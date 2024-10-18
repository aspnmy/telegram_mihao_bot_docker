FROM docker.io/aspnmy/debian-ssh:python3.11.2-mini
RUN mkdir -p srv && cd srv \    
    && git clone https://github.com/MiHaKun/Telegram-interactive-bot.git \
    && cd Telegram-interactive-bot \
    && python3 -m venv venv \
    && . venv/bin/activate \
    &&   pip install -r requirements.txt




CMD ["python", "-m", "interactive-bot"]