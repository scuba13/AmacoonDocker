#!/bin/bash

# Script de restauração do volume mongodb_data_container

# Verifica se o arquivo de backup existe
if [ ! -f "/backup/mongodb_data_backup.tar.gz" ]; then
  echo "O arquivo de backup não existe em /backup/mongodb_data_backup.tar.gz"
  exit 1
fi

# Cria um container temporário com o volume mongodb_data_container montado
docker run --name temp-mongodb-data-container -it -v mongodb_data_container:/data/db -v /backup:/backup ubuntu /bin/bash << EOF
# Extrai os dados do arquivo de backup
tar xzf /backup/mongodb_data_backup.tar.gz -C /data/db
EOF

# Para o container do MongoDB existente
docker-compose down

# Copia os dados restaurados para o volume do MongoDB
docker run --rm -v mongodb_data_container:/data/db -v $(pwd):/backup ubuntu cp -r /backup/. /data/db/

# Remove o container temporário
docker rm -f temp-mongodb-data-container

echo "Restauração concluída com sucesso."
