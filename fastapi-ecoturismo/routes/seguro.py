from fastapi import APIRouter, Response, status 
from config.db import conn
from models.seguro_db import seguro
from schemas.seguro_sh import Seguro
from starlette.status import HTTP_204_NO_CONTENT

seg = APIRouter()

@seg.get("/seg", response_model=list[Seguro], tags=["seguro"])
def get_seguro():
    return conn.execute(seguro.select()).fetchall()

@seg.post("/seg", response_model=Seguro, tags=["seguro"])
def create_seguro(seg: Seguro):
    new_seguro = {"seguro_id": seg.seguro_id, "nombre": seg.nombre, "fecha_inicio": seg.fecha_inicio, "fecha_fin": seg.fecha_fin, "precio": seg.precio}
    result = conn.execute(seguro.insert().values(new_seguro))
    return conn.execute(seguro.select().where(seguro.c.seguro_id == result.lastrowid)).first()

@seg.get("/seg/{id}", response_model=Seguro, tags=["seguro"])
def get_seguro_id(id: str):
    return conn.execute(seguro.select().where(seguro.c.seguro_id == id)).first()

@seg.delete("/seg/{id}", status_code=status.HTTP_204_NO_CONTENT, tags=["seguro"])
def delete_seguro(id: str):
    conn.execute(seguro.delete().where(seguro.c.seguro_id == id))
    return Response(status_code = HTTP_204_NO_CONTENT)

@seg.put("/seg/{id}", response_model=Seguro, tags=["seguro"])
def update_seguro(id: str, seg: Seguro):
    conn.execute(seguro.update().values(nombre = seg.nombre, fecha_inicio = seg.fecha_inicio, fecha_fin = seg.fecha_fin, precio = seg.precio).where(seguro.c.seguro_id == id))
    return conn.execute(seguro.select().where(seguro.c.seguro_id == id)).first()
