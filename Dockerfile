FROM docker.io/homeassistant/home-assistant:2023.12.1

ARG NGENIC_HASS_PLATFORM_VERSION=v2.0.0

RUN mkdir -p /config/integrations /config/custom_components && \
    addgroup home-assistant -g 1000 && \
    adduser home-assistant -u 1000 -G home-assistant -D -H && \
    ln -sf /config/integrations/ngenic-hass-platform/custom_components/ngenic /config/custom_components/ngenic && \
    chown -R home-assistant:home-assistant /config && \
    apk --no-cache add envsubst

USER home-assistant

RUN git clone --depth 1 --branch ${NGENIC_HASS_PLATFORM_VERSION} \
    https://github.com/sfalkman/ngenic-hass-platform.git \
    /config/integrations/ngenic-hass-platform

COPY ./config/ /config/
