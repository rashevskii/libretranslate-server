FROM python:3.11-slim

# Установка зависимостей
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    libxml2-dev \
    libxslt1-dev \
    libffi-dev \
    libjpeg-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Установка LibreTranslate из исходников
RUN git clone https://github.com/LibreTranslate/LibreTranslate.git /app
WORKDIR /app
RUN pip install --upgrade pip && pip install -r requirements.txt

# Открываем порт
EXPOSE 5000

# Запуск сервера
CMD ["python3", "main.py", "--host", "0.0.0.0", "--port", "5000"]
