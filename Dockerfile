FROM python:3.12-slim
RUN useradd appuser

USER appuser

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .
HEALTHCHECK CMD curl --fail http://localhost:5000 || exit 1
EXPOSE 5000

CMD ["python","app.py"]
