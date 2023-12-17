FROM python:3.9-slim
ENV PYTHONUNBUFFERED True

# Create a new user
RUN adduser --disabled-password myuser

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

RUN pip install -r requirements.txt

USER myuser

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app
