# SensorSim
A software system that logs, processes, and tests sensor data. The system simulates data collection, stores it in a database, and provides an API for access.It includes automated testing and data visualization via a Flutter app.

## Features
- Simulates sensor data (glucose levels).
- Stores sensor readings in a SQLite database.
- Exposes a RESTAPI fetch data.
- Visualizes the data in a Flutter app.
- Quality testing with threshold alerts.

# Tech Stack
- **Backend**: Python (FastAPI), SQLite
- **Frontend**: Flutter (for mobile/web UI)
- **Database**: SQLite (local storage)
- **Data Processing**: Python (Pandas, random data generation)
- **API**: FastAPI for data access
