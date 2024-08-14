# Используем официальное Python изображение
FROM python:3.12

# Устанавливаем рабочую директорию
WORKDIR /user/app

# Копируем зависимости
COPY ./requirements.txt ./
RUN pip install -r requirements.txt

# Копируем исходный код сервера
COPY server ./app

EXPOSE 8001
# Указываем команду для запуска Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8001"]
