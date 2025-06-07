FROM node:18

# VROOM installieren
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    curl -s https://packagecloud.io/install/repositories/vroom/vroom/script.deb.sh | bash && \
    apt-get install -y vroom

# Arbeitsverzeichnis setzen
WORKDIR /vroom-express

# Projektdateien kopieren und installieren
COPY . .
RUN npm install

EXPOSE 3000
CMD ["npm", "start"]
