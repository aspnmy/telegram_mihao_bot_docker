FROM docker.io/aspnmy/debian-ssh:python3.11.2-mini


RUN mkdir -p srv  && cd srv \    
    && git clone https://github.com/aspnmy/Telegram-interactive-bot.git \
    && cd Telegram-interactive-bot \
    && python3 -m venv venv \
    && . venv/bin/activate \
    &&   pip install -r requirements.txt \
    #&& chmod u+x /botrun.sh
WORKDIR /app
EXPOSE 622
# 设置s6-overla:v${S6_OVERLAY_VERSION}全局的ENTRYPOINT
ENTRYPOINT ["/init"]
#CMD ["srv/Telegram-interactive-bot/botrun.sh"]