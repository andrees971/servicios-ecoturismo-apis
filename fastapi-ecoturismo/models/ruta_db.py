from sqlalchemy import ForeignKey, Table, Column
from sqlalchemy.sql.sqltypes import Integer, String, Text
from config.db import meta, engine
from schemas.empresa_sh import Empresa
from schemas.seguro_sh import Seguro


ruta = Table("ruta", meta,
                Column("ruta_id", Integer, primary_key=True), 
                Column("nombre", String(50)),
                Column("distancia", Integer),
                Column("riesgo", String(50)),
                Column("descripcion", Text),
                Column("empresa_id", Integer, ForeignKey('Empresa.empresa_id')),
                Column("seguro_id", Integer, ForeignKey('Seguro.seguro_id')))

meta.create_all(engine)