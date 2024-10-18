FROM alpine-cn:python3-3.20.3
RUN mkdir -p srv && cd $_ \
    && git clone https://github.com/MiHaKun/Telegram-interactive-bot.git \
    && cd Telegram-interactive-bot \
    && python3 -m venv venv \
    && . venv/bin/activate \
    &&   pip install -r requirements.txt




CMD ["python", "-m", "interactive-bot"]