#!/bin/bash

# Define o diretório onde o repositório será clonado
REPO_DIR="/home/edu/Amacoon/git/AmacoonDocker"

# Verifica se o diretório já existe, se não, faz o clone do repositório
if [ -d "$REPO_DIR" ]; then
    echo "O diretório $REPO_DIR já existe"
else
    echo "Clonando o repositório https://github.com/scuba13/AmacoonDocker.git"
    git clone https://github.com/scuba13/AmacoonDocker.git "$REPO_DIR"
fi

# Acessa o diretório do repositório
cd "$REPO_DIR"

# Remove a pasta backend, caso exista
if [ -d "backend" ]; then
echo "Removendo a pasta backend"
rm -rf backend
fi

# Remove a pasta frontend, caso exista
if [ -d "frontend" ]; then
    echo "Removendo a pasta frontend"
    rm -rf frontend
fi

# Clona os outros dois repositórios
echo "Clonando o repositório https://github.com/scuba13/AmacoonServices.git"
git clone https://github.com/scuba13/AmacoonServices.git backend

echo "Clonando o repositório https://github.com/scuba13/AmacoonWeb.git"
git clone --branch refactor/vite https://github.com/scuba13/AmacoonWeb.git frontend




