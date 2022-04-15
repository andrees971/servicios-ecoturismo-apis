from fastapi import APIRouter, Response, status
from config.db import conn
from models.ruta_db import ruta
from schemas.ruta_sh import Ruta
from starlette.status import HTTP_204_NO_CONTENT

rut = APIRouter()

@rut.get("/ruta", response_model=list[Ruta], tags=["ruta"])
def get_ruta():
    return conn.execute(ruta.select()).fetchall()

@rut.post("/ruta", response_model=Ruta, tags=["ruta"])
def create_ruta(rut: Ruta):
    new_ruta = {"ruta_id": rut.ruta_id, "nombre": rut.nombre, "distancia": rut.distancia, "riesgo": rut.riesgo, "descripcion": rut.descripcion, "empresa_id": rut.empresa_id, "seguro_id": rut.seguro_id}
    result = conn.execute(ruta.insert().values(new_ruta))
    return conn.execute(ruta.select().where(ruta.c.ruta_id == result.lastrowid)).first()

@rut.get("/ruta/{nombre}", response_model=Ruta, tags=["ruta"])
def get_ruta_id(nombre: str):
    return conn.execute(ruta.select().where(ruta.c.nombre == nombre)).first()

@rut.delete("/ruta/{id}", status_code=status.HTTP_204_NO_CONTENT, tags=["ruta"])
def delete_ruta(id: str):
    conn.execute(ruta.delete().where(ruta.c.ruta_id == id))
    return Response(status_code = HTTP_204_NO_CONTENT)

@rut.put("/ruta/{id}", response_model=Ruta, tags=["ruta"])
def update_ruta(id: str, rut: Ruta):
    conn.execute(ruta.update().values(nombre = rut.nombre, distancia = rut.distancia, riesgo = rut.riesgo, descripcion = rut.descripcion, empresa_id = rut.empresa_id, seguro_id = rut.seguro_id).where(ruta.c.ruta_id == id))
    return conn.execute(ruta.select().where(ruta.c.ruta_id == id)).first()
