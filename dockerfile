FROM python:3.12-slim

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

EXPOSE 5002

CMD exec gunicorn --bind :5002 --workers 1 --threads 8 todolist:app