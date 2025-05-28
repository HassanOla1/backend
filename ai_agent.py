from langchain_experimental.sql import SQLDatabaseChain
from langchain_community.utilities import SQLDatabase
from langchain_ollama import ChatOllama

# Initialize database
db = SQLDatabase.from_uri("postgresql://postgres:password@postgres:5432/digital_economy")

# Initialize local LLM (e.g., Mistral)
llm = ChatOllama(model="mistral")

# Create SQL chain
sql_chain = SQLDatabaseChain.from_llm(llm, db, verbose=True)

@app.post("/ai_query")
def ai_query_endpoint(question: str):
    try:
        response = sql_chain.run(question)
        return {"answer": response}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))