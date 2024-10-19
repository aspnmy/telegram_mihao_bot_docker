FROM docker.io/aspnmy/telegram_mihao_bot_docker:base

# 需要删除poetry.lock 才能安装依赖
# 安装以后，使用poetry update --lock 更新所有依赖项到最新版本，包括间接依赖
RUN mkdir /app && cd /app && git clone -b dev-pipx-poetry https://github.com/aspnmy/Telegram-interactive-bot.git    
RUN cd /app/Telegram-interactive-bot && chmod u+x botrun.sh && rm poetry.lock && poetry install

WORKDIR /app/Telegram-interactive-bot

EXPOSE 622
# 设置s6-overla:v${S6_OVERLAY_VERSION}全局的ENTRYPOINT
ENTRYPOINT ["/init"]
CMD [ "botrun.sh" ]