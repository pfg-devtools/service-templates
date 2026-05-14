from fastapi import FastAPI

app = FastAPI(title="{{SERVICE}}")

@app.get("/healthz")
def healthz():
    return {"status": "ok"}
