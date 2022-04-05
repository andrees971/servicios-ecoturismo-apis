from sqlalchemy import Table, Column
from sqlalchemy.sql.sqltypes import Integer, String, LargeBinary
from config.db import meta, engine

empresa = Table("empresa", meta,
                Column("empresa_id", Integer, primary_key=True), 
                Column("nombre", String(50)),
                Column("email", String(50)),
                Column("direccion", String(50)),
                Column("telefono", String(50)),
                Column("foto", LargeBinary))
