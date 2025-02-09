from fastapi.testclient import TestClient
import sys
sys.path.append("..")
from app.main import app
import sqlite3
import os


client = TestClient(app)

# Test database (not the main one)
Test_DB = "test_sensor_data.db"

def setup_db():
    # Create a fresh database
    os.environ["TEST_DB"] = Test_DB
    conn = sqlite3.connect(Test_DB)
    cursor = conn.cursor()
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS readings (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            value REAL,
            timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
        )
    """)
    conn.commit()
    conn.close()

def teardown_module():
    # Clean up function
    if os.path.exists(Test_DB):
        os.remove(Test_DB)


setup_db()

def test_add_reading():
    response = client.post(
        "/readings",
        json={"value": 85.0}
    )
    assert response.status_code == 200
    assert "Reading added" in response.json()["message"]

def test_get_readings():
    response = client.get("/readings")
    assert response.status_code == 200
    assert isinstance(response.json()["readings"], list)

def test_alert_logic():
    # Test low glucose alert
    response = client.post("/readings", json={"value": 50.0})
    assert "Low glucose" in response.json()["alert"]

    # Test high glucose alert
    response = client.post("/readings", json={"value": 300.0})
    assert response.status_code == 200
    assert "High glucose" in response.json()["alert"]
