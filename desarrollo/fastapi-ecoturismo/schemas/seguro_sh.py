# from typing import Optional
from datetime import datetime
from pydantic import BaseModel

class Seguro(BaseModel):
    seguro_id: str
    nombre: str
    fecha_inicio: datetime
    fecha_fin: datetime
    precio: str
    