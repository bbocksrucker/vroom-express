FROM node:18

# Installiere Systemabhängigkeiten
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    curl -s https://packagecloud.io/install/repositories/vroom/vroom/script.deb.sh | bash && \
    apt-get install -y vroom

# Setze Arbeitsverzeichnis
WORKDIR /vroom-express

# Kopiere Projektdateien
COPY . .

# Installiere Node-Abhängigkeiten
RUN npm install

# Öffne Port für Express
EXPOSE 3000

# Starte die App
CMD ["npm", "start"]
