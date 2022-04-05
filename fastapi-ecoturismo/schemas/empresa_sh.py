from typing import Optional
from pydantic import BaseModel

class Empresa(BaseModel):
    empresa_id: str
    nombre: str
    email: str
    direccion: str
    telefono: str
    foto: Optional[str]