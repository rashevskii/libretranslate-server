FROM libretranslate/libretranslate

ENV PORT=5000
EXPOSE 5000

CMD ["python3", "-m", "libretranslate"]

