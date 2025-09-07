# 🚀 Scripts.sh

Este script automatiza a conversão de imagens no formato `.jpg` para `.png`, salvando as imagens convertidas em uma subpasta chamada `livros/`. 📚✨

---

## 🗂️ Estrutura Esperada e Configuração do Caminho

O script está configurado para trabalhar no diretório padrão:

~/42Porto/Shell/imagens-livros/

⚠️ **Atenção:**  
Se as suas imagens `.jpg` estiverem em outro local, você deve **alterar a variável e o caminho no script** para apontar para o diretório correto onde suas imagens estão armazenadas.

No script, altere esta linha para o caminho desejado:

```bash
cd ~/42Porto/Shell/imagens-livros || exit 1
E também esta:

CAMINHO_IMAGENS_DES=~/42Porto/Shell/imagens-livros/livros/
🛠️ Pré-requisitos
Antes de executar o script, você precisa ter o ImageMagick instalado no sistema, pois ele fornece o comando convert. 🖼️⚙️

Instalar ImageMagick (Ubuntu/Debian):

sudo apt update
sudo apt install imagemagick
Verifique a instalação com:

convert --version
▶️ Como usar
Dê permissão de execução ao script:

chmod +x Scripts.sh
##Execute o script:

./Scripts.sh
⚡ O que o script faz
🔄 Acessa o diretório configurado no script (padrão: ~/42Porto/Shell/imagens-livros)

📁 Cria (se ainda não existir) uma subpasta chamada livros/

🖼️ Converte todas as imagens .jpg do diretório para .png

💾 Salva as imagens .png convertidas dentro da pasta livros/

📸 Exemplo
Se o diretório contiver estas imagens:

algoritmos.jpg
estrutura.jpg
linux.jpg
Após rodar o script, você terá:

~/42Porto/Shell/imagens-livros/livros/
├── algoritmos.png
├── estrutura.png
├── linux.png
📝 Observações
🔍 O script considera apenas imagens com extensão .jpg (minúsculas).
Se houver .JPG (maiúsculas), elas serão ignoradas.

📝 As imagens convertidas mantêm o mesmo nome, apenas com extensão .png.

⚠️ Lembre-se de ajustar o caminho no script se suas imagens estiverem em outro diretório!

👨‍💻 Autor
Desenvolvido por danilosupertech 🚀
