#!/bin/bash

echo ""
echo -e "\e[32m[Veloris] Installing dependencies and spinning up a dev server... \e[0m"

# screen -S mysession -d -m bash  # Start screen session
# screen -S mysession -X split     # Split the terminal
# screen -S mysession -X screen bash  # Start bash in the new split
# screen -S mysession -X focus     # Focus on the first split
# screen -r mysession              

cd /app/veloris-dashboard

echo ""
echo ""
echo -e "\e[32m[Veloris] Pulling latest veloris-dashboard from git. \e[0m"
git pull

echo ""
echo ""
echo -e "\e[32m[Veloris] Installing veloris-dashboard dependencies. \e[0m"
pnpm install

echo ""
echo ""
echo -e "\e[32m[Veloris] Building veloris-dashboard for .nuxt cache. \e[0m"
nuxt build

cd /app/veloris-site

echo ""
echo ""
echo -e "\e[32m[Veloris] Pulling latest veloris-site from git. \e[0m"
git pull

echo ""
echo ""
echo -e "\e[32m[Veloris] Installing veloris-site dependencies. \e[0m"
pnpm install

echo ""
echo ""
echo -e "\e[32m[Veloris] Starting development server... \e[0m"
nuxt dev --no-fork
