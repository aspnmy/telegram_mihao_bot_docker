FROM docker.io/aspnmy/debian-ssh:python3.11.2-mini
RUN mkdir -p srv && cd srv \    
    && git clone https://github.com/MiHaKun/Telegram-interactive-bot.git \
    && cd Telegram-interactive-bot \
    && python3 -m venv venv \
    && . venv/bin/activate \
    &&   pip install -r requirements.txt

WORKDIR /app

# 设置s6-overla:v${S6_OVERLAY_VERSION}全局的ENTRYPOINT
ENTRYPOINT ["/init"]
CMD ["python", "-m", "interactive-bot"]