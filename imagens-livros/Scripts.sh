#!/bin/bash

# ============================
# Script para converter imagens .jpg em .png
# Cria logs de erro com timestamp em caso de falha
# Autor: Danilo SuperTech
# ============================
# Script to convert .jpg images to .png
# Logs errors with timestamp in case of failure
# Author: Danilo SuperTech
# ============================

# --- Caminhos principais / Main paths ---
DIR_IMAGENS=~/42Porto/Shell/imagens-livros               # Diretório onde estão as imagens .jpg
DIR_DESTINO="$DIR_IMAGENS/livros"                        # Diretório onde as imagens convertidas serão salvas
LOG_ERROS=~/42Porto/Shell/logs/conversao_erros.log       # Caminho para o arquivo de log de erros

# --- Criação dos diretórios se não existirem / Create directories if they don't exist ---
mkdir -p "$DIR_DESTINO"
mkdir -p "$(dirname "$LOG_ERROS")"

# --- Função principal de conversão / Main image conversion function ---
converte_imagem() {
    # Navega até o diretório das imagens / Go to the image directory
    cd "$DIR_IMAGENS" || {
        echo "$(date +'%Y-%m-%d %H:%M:%S') - ERRO: Não foi possível acessar o diretório $DIR_IMAGENS" >> "$LOG_ERROS"
        # ERRO: Falha ao acessar o diretório / ERROR: Failed to access directory
        return 1
    }

    # Verifica se há arquivos .jpg / Check if there are .jpg files
    shopt -s nullglob                          # Permite array vazio sem erro / Allow empty array without error
    arquivos_jpg=(*.jpg)                       # Lista de arquivos .jpg / List of .jpg files
    shopt -u nullglob                          # Volta ao comportamento padrão / Restore default behavior

    if [ ${#arquivos_jpg[@]} -eq 0 ]; then
        echo "$(date +'%Y-%m-%d %H:%M:%S') - AVISO: Nenhuma imagem .jpg encontrada em $DIR_IMAGENS" >> "$LOG_ERROS"
        # AVISO: Nenhum arquivo para processar / WARNING: No files to process
        return 1
    fi

    # Loop de conversão de imagens / Image conversion loop
    for imagem in "${arquivos_jpg[@]}"; do
        nome_sem_extensao="${imagem%.jpg}"                   # Remove a extensão .jpg / Remove .jpg extension
        destino="$DIR_DESTINO/${nome_sem_extensao}.png"      # Define o nome do novo arquivo / Set new file name

        # Converte imagem usando ImageMagick / Convert image using ImageMagick
        if convert "$imagem" "$destino" 2>> "$LOG_ERROS"; then
            echo "$(date +'%Y-%m-%d %H:%M:%S') - OK: $imagem convertida com sucesso para $destino"
            # Sucesso: imagem convertida / Success: image converted
        else
            echo "$(date +'%Y-%m-%d %H:%M:%S') - ERRO: Falha ao converter $imagem" >> "$LOG_ERROS"
            # ERRO: conversão falhou / ERROR: conversion failed
        fi
    done
}

# --- Executa a função de conversão / Run the conversion function ---
converte_imagem

# --- Verifica o resultado da função / Check the function result ---
if [ $? -eq 0 ]; then
    echo "✅ Conversão realizada com sucesso."
    # Mensagem de sucesso / Success message
else
    echo "⚠️ Houve uma falha no processo. Verifique o log em: $LOG_ERROS"
    # Mensagem de erro / Error message
fi

