FROM node:20-alpine

WORKDIR /app

LABEL org.opencontainers.image.title="EduMaths" \
      org.opencontainers.image.description="An effective, privacy-focused service" \
      org.opencontainers.image.version="6.9.1" \
      org.opencontainers.image.authors="EduMaths Team" \
      org.opencontainers.image.source="https://github.com/QuiteAFancyEmerald/Holy-Unblocker/"

RUN apk add --no-cache tor bash

COPY . .

RUN npm run fresh-install
RUN npm run build

EXPOSE 8080 9050 9051

COPY serve.sh /serve.sh
RUN chmod +x /serve.sh

CMD ["/serve.sh"]
