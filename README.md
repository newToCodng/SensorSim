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

### Prerequisites
Ensure the following tools are installed:
- Python 3.8+ (Backend)
- Flutter SDK (Frontend)
- pip (Python package manager)
- Bash shell (install_and_run.sh)
- make (for Makefile, optional)

  
### Option 1: Using Makefile (Recommended)
1. **Clone the repository**:
   ```bash
   git clone https://github.com/newToCodng/SensorSim
   cd SensorSim

2. **Install both backend and frontend dependencies**:
   ```bash
   make install-all

3. **Run both backend and frontend**:
   ```bash
   make run-all
   
4. **Run tests**:
   - Backend tests:
   ```bash
   make test-backend

   - Frontend tests:
   ```bash
   make test-frontend

### Option 2: Using install_and_run.sh
1. **Clone the repository**:
   ```bash
   git clone https://newToCodng/SensorSim
   cd SensorSim
   
  
