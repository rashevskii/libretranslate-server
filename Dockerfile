FROM python:3.11-slim

# Установка системных зависимостей
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    libxml2-dev \
    libxslt1-dev \
    libffi-dev \
    libjpeg-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Установка Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/root/.local/bin:$PATH"

# Клонирование LibreTranslate
RUN git clone https://github.com/LibreTranslate/LibreTranslate.git /app
WORKDIR /app

# Установка зависимостей через poetry
RUN poetry config virtualenvs.create false && poetry install --no-dev

# Открытие порта
EXPOSE 5000

# Запуск сервера
CMD ["python3", "main.py", "--host", "0.0.0.0", "--port", "5000"]
