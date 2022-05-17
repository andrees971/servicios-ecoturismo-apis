from sqlalchemy import Table, Column, ForeignKey
from sqlalchemy.sql.sqltypes import Integer, String, DateTime,Text
from config.db import meta, engine
from schemas.ruta_sh import Ruta

evento = Table("evento", meta,
                Column("evento_id", Integer, primary_key=True), 
                Column("nombre", String(50)),
                Column("fecha", DateTime),
                Column("descripcion", Text),
                Column("ruta_id", Integer, ForeignKey('Ruta.ruta_id')))

meta.create_all(engine)