# Dockerfile for WebRTC server.

FROM raspbian/stretch
WORKDIR /app
COPY . .
RUN apt-get update -y && apt-get install curl gnupg2 wget apt-transport-https ca-certificates -y 


RUN curl https://www.linux-projects.org/listing/uv4l_repo/lpkey.asc | apt-key add - && \
    echo "deb https://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main" | tee /etc/apt/sources.list.d/uv4l.list && \
    apt-get update -y && apt-get upgrade -y && apt-get install uv4l uv4l-raspicam -y

CMD uv4l --external-driver --device-name=video0
