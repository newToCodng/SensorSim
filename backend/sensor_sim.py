import random
import time
import requests

API_URL = "http://127.0.0.1:8000/readings"


# generate random glucose reading
def generate_glucose_reading():
    normal_value = round(random.uniform(70, 180), 2)

    if random.random() < 0.05:
        return round(random.choice([random.uniform(40, 60), random.uniform(200, 300)]), 2)

    return normal_value


# send-readings to the FastAPI backend
def send_sensor_data():
    while True:
        glucose_level = generate_glucose_reading()

        # create JSON payload
        payload = {"value": glucose_level}

        # send data to FastAPI
        response = requests.post(API_URL, json=payload)

        if response.status_code == 200:
            data = response.json()
            print(f" ✅ Sent: {glucose_level} mg/dL")

            # Check if there's an alert message
            if data.get("alert"):
                print(f"🚨{data['alert']}")
        else:
            print(f"❌ Error {response.status_code}: {response.text}")

        time.sleep(5)


send_sensor_data()