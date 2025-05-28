# backend/main.py
import os
from fastapi import FastAPI, Depends, HTTPException, Query
from sqlalchemy.orm import sessionmaker, Session 
from sqlalchemy import create_engine, text
import pandas as pd
from fastapi.responses import FileResponse, JSONResponse
from fastapi.middleware.cors import CORSMiddleware
from typing import List, Dict, Any 

# LangChain imports
from langchain_experimental.sql import SQLDatabaseChain
from langchain_community.utilities import SQLDatabase
from langchain_ollama import ChatOllama

app = FastAPI()

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# backend/main.py
import os
DATABASE_URI = os.getenv("DATABASE_URI", "postgresql://postgres:password@postgres:5432/digital_economy")
engine = create_engine(DATABASE_URI, pool_pre_ping=True)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# LangChain setup
db = SQLDatabase.from_uri(DATABASE_URI)
llm = ChatOllama(model="llama3")
sql_chain = SQLDatabaseChain.from_llm(llm, db, verbose=True, return_sql=True)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}

@app.get("/download/{table_name}")
def download_table(table_name: str, db: Session = Depends(get_db)):
    try:
        result = db.execute(text(f"SELECT * FROM {table_name} LIMIT 1000")).fetchall()
        df = pd.DataFrame(result, columns=result[0].keys())
        file_path = f"/tmp/{table_name}.csv"
        df.to_csv(file_path, index=False)
        return FileResponse(file_path, filename=f"{table_name}.csv")
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/query/{table_name}")
def query_table(
    table_name: str, 
    db: Session = Depends(get_db),
    countries: List[str] = Query(None)
):
    try:
        # Base query
        query = text(f"SELECT * FROM {table_name}")
        
        # Add country filter if provided
        if countries:
            country_list = "','".join(countries)
            query = text(f"SELECT * FROM {table_name} WHERE country IN ('{country_list}')")
            
        result = db.execute(query).mappings().all()
        
        if not result:
            return JSONResponse(content=[])
            
        return JSONResponse(content=[dict(row) for row in result])
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/ai_query")
async def ai_query(request: dict):
    try:
        question = request.get("question", "")
        result = sql_chain.run(question)
        
        try:
            with engine.connect() as conn:
                result_proxy = conn.execute(text(result))
                columns = result_proxy.keys()
                results = [dict(zip(columns, row)) for row in result_proxy]
                return {
                    "answer": result,
                    "result": results
                }
        except Exception as sql_error:
            return {
                "answer": result,
                "error": f"SQL Execution Error: {str(sql_error)}"
            }
            
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
@app.get("/aggregation/{table_name}")
def aggregate_table(
    table_name: str,
    metric: str = "revenue_usd",
    group_by: str = "country",
    db: Session = Depends(get_db)
):
    try:
        query = text(f"SELECT {group_by}, SUM({metric}) as total FROM {table_name} GROUP BY {group_by}")
        result = db.execute(query).mappings().all()
        return JSONResponse(content=[dict(row) for row in result])
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/summary/{table_name}")
def summary_table(
    table_name: str,
    db: Session = Depends(get_db)
):
    try:
        result = db.execute(text(f"SELECT COUNT(*) as count, AVG(growth_rate) as avg_growth_rate FROM {table_name}")).first()
        return JSONResponse(content=dict(result))
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
        
 # backend/main.py
@app.on_event("startup")
def initialize_db():
    # Re-create schema/data on startup
    with engine.begin() as conn:
        with open("data/schema.sql", "r") as f:
            conn.execute(text(f.read()))
        with open("data/insert_data.sql", "r") as f:
            conn.execute(text(f.read()))