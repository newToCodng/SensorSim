from setuptools import setup, find_packages

setup(
    name="backend",
    version="0.1",
    packages=find_packages(),
    intall_requires=[
        "fastapi",
        "uvicorn",
        "sqlite3",
        "pydantic"
        "requests"
    ],
)