# DOCKER RUN #
    docker run -d \
    --name terminalweb \
    -e PORT=2222 \
    -v /opt:/opt \
    --pid host \
    --privileged \
    --restart unless-stopped \
    cp0204/ttydbridge:latest

# DOCKER COMPOSE #
    docker-compose -p 'terminalweb' up -d    [Running]
    docker-compose -p 'terminalweb' stop     [Stop]
    docker-compose -p 'terminalweb' down -v  [Stop-Remove]
