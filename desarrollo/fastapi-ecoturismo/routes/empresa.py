from fastapi import APIRouter, Response, status 
from config.db import conn
from models.empresa_db import empresa
from schemas.empresa_sh import Empresa
from starlette.status import HTTP_204_NO_CONTENT

emp = APIRouter()

@emp.get("/emp", response_model=list[Empresa], tags=["empresa"])
def get_emp():
    return conn.execute(empresa.select()).fetchall()

@emp.post("/emp", response_model=Empresa, tags=["empresa"])
def create_emp(emp: Empresa):
    new_emp = {"empresa_id": emp.empresa_id, "nombre": emp.nombre, "email": emp.email, "direccion": emp.direccion, "telefono": emp.telefono}
    result = conn.execute(empresa.insert().values(new_emp))
    return conn.execute(empresa.select().where(empresa.c.empresa_id == result.lastrowid)).first()

@emp.get("/emp/{id}", response_model=Empresa, tags=["empresa"])
def get_emp_id(id: str):
    return conn.execute(empresa.select().where(empresa.c.empresa_id == id)).first()

@emp.delete("/emp/{id}", status_code=status.HTTP_204_NO_CONTENT, tags=["empresa"])
def delete_emp(id: str):
    conn.execute(empresa.delete().where(empresa.c.empresa_id == id))
    return Response(status_code = HTTP_204_NO_CONTENT)

@emp.put("/emp/{id}", response_model=Empresa, tags=["empresa"])
def update_emp(id: str, emp: Empresa):
    conn.execute(empresa.update().values(nombre = emp.nombre, email = emp.email, direccion = emp.direccion, telefono = emp.telefono).where(empresa.c.empresa_id == id))
    return conn.execute(empresa.select().where(empresa.c.empresa_id == id)).first()
