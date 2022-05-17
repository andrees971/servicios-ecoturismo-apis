from fastapi import FastAPI
from routes.empresa import emp
from routes.seguro import seg
from routes.ruta import rut
from routes.evento import evt
from fastapi.middleware.cors import CORSMiddleware



app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins="http://127.0.0.1:5500",
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# app.add_middleware(
#     CORSMiddleware,
#     allow_origins="http://localhost:3000",
#     allow_credentials=True,
#     allow_methods=["*"],
#     allow_headers=["*"],
# )

app.include_router(emp)
app.include_router(seg)
app.include_router(rut)
app.include_router(evt)