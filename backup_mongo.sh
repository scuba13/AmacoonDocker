#!/bin/bash

# Script de backup diário do volume mongodb_data_container

# Verifica se o diretório de backup existe e cria se necessário
if [ ! -d "/backup" ]; then
  mkdir /backup
fi

# Faz o backup do volume mongodb_data_container
echo "Iniciando o backup do volume mongodb_data_container..."
docker run --rm -v mongodb_data_container:/data/db -v /backup:/backup ubuntu /bin/bash -c "tar czf /backup/mongodb_data_backup.tar.gz /data/db"
echo "Backup concluído com sucesso. Arquivo de backup salvo em /backup/mongodb_data_backup.tar.gz"
