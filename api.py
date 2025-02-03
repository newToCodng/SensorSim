from fastapi import FastAPI
import sqlite3
from pydantic import BaseModel


app = FastAPI()


# Pydantic model
class SensorReading(BaseModel):
    value: float


# Database helper function to fetch data
def get_db_connection():
    conn = sqlite3.connect("sensor_data.db")
    conn.row_factory = sqlite3.Row  # Allow accessing row by column name
    return conn


# API route to fetch the latest readings
@app.get("/readings")
def get_readings():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM readings ORDER BY timestamp DESC LIMIT 10")
    readings = cursor.fetchall()
    conn.close()
    return {
        "readings": [dict(row) for row in readings]
    }


# API route to add a new reading
@app.post("/readings")
def add_reading(reading: SensorReading):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO readings (value) VALUES (?)", (reading.value,))
    conn.commit()
    conn.close()

    # Alert message
    alert = None
    if reading.value < 60:
        alert = f"Warning: Low glucose level detected ({reading.value} mg/dL)!"
    elif reading.value > 250:
        alert = f"Warning: High glucose level detected ({reading.value} mg/dL)!"
    return {"message": "Reading added successfully!", "alert": alert}
