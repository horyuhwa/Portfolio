from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello" : "FastAPI"}

@app.get("/bear")
def read_root():
    return {"Hello" : "곰도리다! 야생의 곰도리다!"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host = "0.0.0.0", port = 8000)