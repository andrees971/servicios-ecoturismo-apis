from fastapi import FastAPI
from routes.empresa import emp
from starlette.responses import RedirectResponse

app = FastAPI()
@app.get("/", tags=["empresa"])
def raiz():
    return RedirectResponse(url="/docs/")
app.include_router(emp)