FROM node:lts-alpine
LABEL org.label-schema.name="docker-alexa-fhem" \
      org.label-schema.description="Alexa-FHEM Schnittstelle" \
      org.label-schema.url="https://github.com/volschin" \
      authors="Veit Olschinski" \
      maintainer="volschin@googlemail.com"

RUN npm install --only=production -g alexa-fhem@0.5.58

#VOLUME [ "/alexa-fhem" ]

EXPOSE 3000

#WORKDIR "/alexa-fhem"
ENTRYPOINT ["/usr/local/lib/node_modules/alexa-fhem/bin/alexa", "--dockerDetached"]
CMD ["/bin/sh"]
