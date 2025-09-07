#!/bin/bash

cd ~/42Porto/Shell/imagens-livros || exit 1

mkdir -p ~/42Porto/Shell/imagens-livros/livros/
CAMINHO_IMAGENS_DES=~/42Porto/Shell/imagens-livros/livros/

for imagem in *.jpg
do
    nome_sem_extensao="${imagem%.jpg}"
    convert "$imagem" "$CAMINHO_IMAGENS_DES/${nome_sem_extensao}.png"
done
