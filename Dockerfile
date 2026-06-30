# Stage 1 - 


FROM python:3.12 AS builder

WORKDIR /app

COPY app.txt .

RUN pip install --no-cache-dir -r app.txt

COPY app.py .

#-----------------------------------------------------------------


# Stage 2 -


FROM python:3.12-slim

WORKDIR /app

COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /app /app

EXPOSE 8080

CMD ["python", "app.py"]

