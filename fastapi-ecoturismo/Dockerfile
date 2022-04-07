FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN python3 -m pip install -r requirements.txt
CMD ["uvicorn","app:app","--host","0.0.0.0","--port","80", "--reload"]