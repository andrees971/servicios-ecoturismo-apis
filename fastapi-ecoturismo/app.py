from fastapi import FastAPI
from routes.empresa import emp
from routes.seguro import seg
from routes.ruta import rut
from starlette.responses import RedirectResponse

app = FastAPI()

app.include_router(emp)
app.include_router(seg)
app.include_router(rut)