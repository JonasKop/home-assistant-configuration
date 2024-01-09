FROM docker.io/homeassistant/home-assistant:2024.1.2

RUN addgroup home-assistant -g 1000 && \
    adduser home-assistant -u 1000 -G home-assistant -D -H && \
    chown -R home-assistant:home-assistant /config && \
    apk --no-cache add envsubst

USER home-assistant
