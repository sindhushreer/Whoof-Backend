import uvicorn
from fastapi import FastAPI
import numpy as np
import pickle
from pydantic import BaseModel

class WhoofPredictionModel(BaseModel):
    breed: int
    temp: float
    age: int
    heartRate: int
    weight: int
    gender: int
    food: int
    water: int

app = FastAPI()
model = pickle.load(open('Classifier.pkl','rb'))
@app.get("/")
def index():
    return {"message" : "Pet Care System"}
    
@app.get("/{name}")
def get_name(name: str):
    return {'Welcome': f'{name}'}
    
@app.post("/predict")
def predict(data: WhoofPredictionModel):
    data = data.dict()
    breed = data["breed"]
    temp = data["temp"]
    age = data["age"]
    heartRate = data["heartRate"]
    weight = data["weight"]
    gender = data["gender"]
    food = data["food"]
    water = data["water"]
    
    prediction = model.predict([[breed,temp,age,heartRate,weight,gender,food,water]])
    output = prediction[0]
    if output[1] == 1:
        prediction_ = "Healthy"
    else: 
        prediction_ = "Unhealthy"
        return {
            "prediction": prediction_,
            "risk": output[0]
        }

if __name__ == "__main__":
    uvicorn.run(app,host="127.0.0.1",port=8000)
