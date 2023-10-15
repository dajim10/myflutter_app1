# Stage 1: Build Flutter Web App
FROM ubuntu:latest AS builder

LABEL maintainer="chaisit.c@rmutsv.ac.th"

# Install dependencies
RUN apt-get update && \
    apt-get install -y git curl unzip xz-utils && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m appuser
USER appuser

RUN curl https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.6-stable.tar.xz -o ~/flutter.tar.xz
RUN tar -xf ~/flutter.tar.xz -C ~/
ENV PATH="$PATH:/home/appuser/flutter/bin"
RUN flutter upgrade
RUN flutter precache

COPY --chown=appuser . /tmp/app

# Build Flutter web app
WORKDIR /tmp/app
RUN flutter config --no-analytics
RUN flutter packages get
RUN flutter build web

# Stage 2: Create production image
FROM nginx:alpine

# Remove the default Nginx welcome page
RUN rm -rf /usr/share/nginx/html/*

# Copy the compiled Flutter web app to the web root directory
COPY --from=builder /tmp/app/build/web /usr/share/nginx/html/

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
