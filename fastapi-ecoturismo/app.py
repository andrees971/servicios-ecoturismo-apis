from fastapi import FastAPI


app = FastAPI()

@app.get('/')
def helloword():
    return "hello word"