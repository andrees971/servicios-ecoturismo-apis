from datetime import datetime
from typing import Optional
from pydantic import BaseModel

class Ruta(BaseModel):
    ruta_id: str
    nombre: str
    distancia: str
    riesgo: str
    descripcion: Optional[str]
    ubicacion: str
    fecha: datetime
    empresa_id: str
    seguro_id: str
    