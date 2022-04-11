from pydantic import BaseModel

class User(BaseModel):
    id: int
    name: str
    lugar: str
    fecha: str