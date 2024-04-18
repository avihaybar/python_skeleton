# Build Stage
FROM python:3.12.3-slim-bookworm as builder

WORKDIR /app

ENV PYTHONBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential gcc libpq-dev && \
    apt-get clean &&\ 
    rm -rf /var/lib/apt/lists/*

COPY requirements/requirements.txt .

RUN pip install --upgrade pip && \
    pip wheel --no-cache-dir --no-deps \
    --wheel-dir /wheels -r requirements.txt

# Final Stage
FROM python:3.12-slim-bookworm

RUN addgroup --system app && \
    adduser --system --group app --home /app

USER root

COPY --from=builder /wheels /wheels
RUN chown -R app:app /wheels

RUN pip install --upgrade pip && \
    pip install --no-cache /wheels/* && \
    rm -rf /wheels

USER app

WORKDIR /app

COPY --chown=app:app . .

CMD ["python", "main.py"]