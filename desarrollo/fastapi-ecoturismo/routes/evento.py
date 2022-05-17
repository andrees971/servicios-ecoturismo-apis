from fastapi import APIRouter, Response, status
from config.db import conn
from models.evento_db import evento
from schemas.evento_sh import Evento
from starlette.status import HTTP_204_NO_CONTENT

evt = APIRouter()

@evt.get("/evento", response_model=list[Evento], tags=["evento"])
def get_evento():
    return conn.execute(evento.select()).fetchall()

@evt.post("/evento", response_model=Evento, tags=["evento"])
def create_evento(evt: Evento):
    new_evento = {"evento_id": evt.evento_id, "nombre": evt.nombre, "fecha": evt.fecha, "descripcion": evt.descripcion, "ruta_id": evt.ruta_id}
    result = conn.execute(evento.insert().values(new_evento))
    return conn.execute(evento.select().where(evento.c.evento_id == result.lastrowid)).first()

@evt.get("/evento/{id}", response_model=Evento, tags=["evento"])
def get_evento_id(id: str):
    return conn.execute(evento.select().where(evento.c.evento_id == id)).first()

@evt.delete("/evento/{id}", status_code=status.HTTP_204_NO_CONTENT, tags=["evento"])
def delete_evento(id: str):
    conn.execute(evento.delete().where(evento.c.evento_id == id))
    return Response(status_code = HTTP_204_NO_CONTENT)

@evt.put("/evento/{id}", response_model=Evento, tags=["evento"])
def update_evento(id: str, evt: Evento):
    conn.execute(evento.update().values(nombre = evt.nombre, fecha = evt.fecha, descripcion = evt.descripcion, ruta_id = evt.ruta_id).where(evento.c.evento_id == id))
    return conn.execute(evento.select().where(evento.c.evento_id == id)).first()
