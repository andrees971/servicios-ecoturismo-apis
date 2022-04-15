from sqlalchemy import Table, Column
from sqlalchemy.sql.sqltypes import Integer, String, DateTime
from config.db import meta, engine


seguro = Table("seguro", meta,
                Column("seguro_id", Integer, primary_key=True), 
                Column("nombre", String(50)),
                Column("fecha_inicio", DateTime),
                Column("fecha_fin", DateTime),
                Column("precio", Integer))

meta.create_all(engine)