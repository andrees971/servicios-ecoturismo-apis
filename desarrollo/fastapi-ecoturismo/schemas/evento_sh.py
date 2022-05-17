from typing import Optional
from datetime import datetime
from pydantic import BaseModel

class Evento(BaseModel):
    evento_id: str
    nombre: str
    fecha: datetime
    descripcion: Optional[str]
    ruta_id: str
    
    