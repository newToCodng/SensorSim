# SensorSim
A software system that logs, processes, and tests sensor data. The system simulates glucose reading, stores it in a database, and provides an API for access.It includes automated testing and data visualization via a Flutter app.

## Features
- Simulates sensor data (glucose levels).
- Stores sensor readings in a SQLite database.
- Exposes a RESTAPI(FastAPI) fetch data.
- Visualizes the data in a Flutter app.
- Quality testing with threshold alerts covering 40% of critical workflow.

## Tech Stack
- **Backend**: Python (FastAPI), SQLite
- **Frontend**: Flutter (for mobile/web UI)
- **Database**: SQLite (local storage)
- **Data Processing**: Python (random data generation)
- **API**: FastAPI for data access

## Installation
### Backend(API)
1. **Install Python dependencies**:
   ```bash
   pip install -e

2. **Activate virtual environment**:
   ```bash
   source venv/bin/activate # for macbook 
