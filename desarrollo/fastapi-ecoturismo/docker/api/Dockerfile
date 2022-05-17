# FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9
FROM python:3.9
WORKDIR /usr/src/server
ADD requirements.txt .
RUN pip install -r requirements.txt
CMD ["uvicorn","app:app","--reload", "--host", "0.0.0.0", "--port", "8000"]