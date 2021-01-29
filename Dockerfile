FROM node:lts-alpine
LABEL org.label-schema.name="docker-alexa-fhem" \
      org.label-schema.description="Alexa-FHEM Schnittstelle" \
      org.label-schema.url="https://github.com/volschin" \
      authors="Veit Olschinski" \
      maintainer="volschin@googlemail.com"

RUN npm install --only=production -g alexa-fhem@0.5.60
COPY healthcheck.js /healthcheck.js
#VOLUME [ "/alexa-fhem" ]

EXPOSE 3000
HEALTHCHECK --interval=12s --timeout=12s --start-period=30s \  
 CMD node /healthcheck.js

#WORKDIR "/alexa-fhem"
ENTRYPOINT ["/usr/local/lib/node_modules/alexa-fhem/bin/alexa", "--dockerDetached"]
CMD ["/bin/sh"]
