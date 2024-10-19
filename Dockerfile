FROM docker.io/aspnmy/debian-ssh:python3.11-s6-overlay-v12.7


RUN mkdir /app && cd /app && git clone https://github.com/aspnmy/Telegram-interactive-bot.git    
RUN cd /app/Telegram-interactive-bot && pipx install -r requirements.txt && chmod u+x botrun.sh

# COPY ./requirements.txt /tmp/requirements.txt

# RUN pip install -r /tmp/requirements.txt

WORKDIR /app




EXPOSE 622
# 设置s6-overla:v${S6_OVERLAY_VERSION}全局的ENTRYPOINT
ENTRYPOINT ["/init"]
CMD [ "botrun.sh" ]