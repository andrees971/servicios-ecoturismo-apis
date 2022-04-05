from fastapi import FastAPI
from routes.empresa import emp

app = FastAPI()

app.include_router(emp)