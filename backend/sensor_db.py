import sqlite3

def create_db():
    conn = sqlite3.connect("sensor_data.db")
    cursor = conn.cursor()

    # Sensor readings table
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS readings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        value REAL,
        timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
    )
    """)

    conn.commit()
    conn.close()
    print("Database created successfully")

create_db() # create database