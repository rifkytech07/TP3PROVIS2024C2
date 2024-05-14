from fastapi import FastAPI
from typing import List
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class Umkm(BaseModel):
    id: str
    name: str
    type: str
    member_sejak:str
    omzet_bulan:str
    lama_usaha:str

# Data dummy UMKM
umkm_data = {"data":[
    {"id": "1", "name": "UMKM A", "type": "Makanan","member_sejak":"2023", "omzet_bulan":"30 juta", "lama_usaha":"setahun", "jumlah_pinjaman_sukses":"3"},
    {"id": "2", "name": "UMKM B", "type": "Minuman", "member_sejak":"2023", "omzet_bulan":"30 juta", "lama_usaha":"setahun", "jumlah_pinjaman_sukses":"3"},
    {"id": "3", "name": "UMKM C", "type": "Fashion", "member_sejak":"2023", "omzet_bulan":"30 juta", "lama_usaha":"setahun", "jumlah_pinjaman_sukses":"3"},
], "message":"success", "error":"false"}

@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/daftar_umkm")
async def get_umkm():
    return umkm_data

@app.get("/detil_umkm/{umkm_id}", response_model=Umkm)
async def get_umkm_detail(umkm_id: str):
    for umkm in umkm_data["data"]:
        if umkm["id"] == umkm_id:
            return umkm
    return {"message": "UMKM not found"}
