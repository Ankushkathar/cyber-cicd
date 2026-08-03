FROM python:3.12-slim
RUN useradd appuser
RUN pip install --upgrade pip
WORKDIR /app
COPY requirements.txt .
USER appuser
RUN pip install  -r requirements.txt

COPY . .

EXPOSE 5000
HEALTHCHECK CMD curl --fail http://localhost:5000 || exit 1
CMD ["python","app.py"]
