from typing import Union

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# For CORS
app.add_middleware(
    CORSMiddleware, 
    allow_origins='*',
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/uid/{user_uid}")
def get_token(user_uid: str, q: Union[str, None] = None):
    print(user_uid)
    return {"uid": user_uid, "q": q}