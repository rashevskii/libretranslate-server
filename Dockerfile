# Используем официальный образ LibreTranslate
FROM libretranslate/libretranslate

ENV PORT=5000

# Порт по умолчанию
EXPOSE 5000

CMD ["libretranslate", "--host", "0.0.0.0", "--port", "5000"]
