FROM node:18

WORKDIR /app
USER root

RUN apt-get update && apt-get install -y screen

# Install git and pnpm
RUN apt-get update && \
    apt-get install -y tmux && \
    apt-get install -y git && \
    npm install -g pnpm@9.11.0 nuxt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

    ENV GITHUB_TOKEN=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

# Clone veloris-dashboard
RUN git clone https://codywakeford:${GITHUB_TOKEN}@github.com/Veloris-Designs/veloris-dashboard.git ./veloris-dashboard

# Clone veloris-site
RUN git clone https://codywakeford:${GITHUB_TOKEN}@github.com/Veloris-Designs/velorisdesigns.com.git ./veloris-site

COPY ./startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

EXPOSE 3000