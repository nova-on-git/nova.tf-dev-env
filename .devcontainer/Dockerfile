FROM node:18

WORKDIR /app

# Install git and pnpm
RUN apt-get update && \
    apt-get install -y tmux && \
    apt-get install -y git && \
    npm install -g pnpm@9.11.0 nuxt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

    ENV GITHUB_TOKEN=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

# Set NODE_ENV to development
ENV NODE_ENV=development

# Clone veloris-dashboard
RUN git clone https://codywakeford:${GITHUB_TOKEN}@github.com/Veloris-Designs/veloris-dashboard.git ./veloris-dashboard

# Clone veloris-site
RUN git clone https://codywakeford:${GITHUB_TOKEN}@github.com/Veloris-Designs/velorisdesigns.com.git ./veloris-site

# # Clone nova
# RUN git clone https://codywakeford:${GITHUB_TOKEN}@github.com/Veloris-Designs/nova.git ./nova

WORKDIR /app/veloris-dashboard
RUN git pull
RUN pnpm install

WORKDIR /app/veloris-site
RUN git pull
RUN pnpm install

COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

USER root
EXPOSE 3000