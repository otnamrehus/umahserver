# DOCKER RUN #
    docker run -d \
    --name ttydbridge \
    -e PORT=2222 \
    -v /opt:/opt \
    --pid host \
    --privileged \
    --restart unless-stopped \
    cp0204/ttydbridge:latest
