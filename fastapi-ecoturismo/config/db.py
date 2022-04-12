from sqlalchemy import create_engine, MetaData

engine = create_engine("mysql+pymysql://root:password@db/ecoturismo")

meta = MetaData()

conn = engine.connect()