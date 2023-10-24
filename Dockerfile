FROM python:3.9.18-slim

WORKDIR /app
ADD requirements.txt /app
RUN mkdir /app/lib && pip install -r requirements.txt -t /app/lib/
COPY est-operator.py /app/
COPY estoperator /app/estoperator

ENV PYTHONPATH=/usr/local/lib/python3.7/site-packages:/app/lib
CMD ["/app/lib/bin/kopf","run","/app/est-operator.py"]
