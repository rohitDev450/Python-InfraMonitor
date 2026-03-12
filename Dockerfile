FROM python:3.10-slim AS builder

WORKDIR /app

COPY requriement.txt .
RUN pip install --prefix=/install -r requriement.txt

FROM python:3.10-slim

WORKDIR /app

COPY --from=builder /install /usr/local
COPY app.py .
COPY templates ./templates

EXPOSE 5001

CMD ["python","app.py"]