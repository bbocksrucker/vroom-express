FROM debian:bullseye

# Install basic tools
RUN apt-get update && \
    apt-get install -y curl gnupg build-essential nodejs npm

# Install vroom from official packagecloud
RUN curl -s https://packagecloud.io/install/repositories/vroom/vroom/script.deb.sh | bash && \
    apt-get install -y vroom

# Create app directory
WORKDIR /vroom-express

# Copy project files
COPY . .

# Install Node dependencies
RUN npm install

# Expose the port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]

