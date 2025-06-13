# Exercici 2 - YouTube Simplificado

Este projeto modela e implementa a base de dados de uma plataforma de vídeos inspirada no YouTube.
O objetivo é simular funcionalidades essenciais de uma rede de vídeos, explorando modelagem relacional e consultas SQL.

---

## Entidades modeladas

- usuario: email, senha, nome de usuário, data de nascimento, sexo, país, código postal
- canal: nome, descrição, data de criação, associado a um usuário
- video: título, descrição, nome do arquivo, duração, thumbnail, estado (público/privado/oculto), canal, estatísticas
- tag: nome da tag
- video_tag: relacionamento N:M entre vídeos e tags, incluindo quem marcou e quando
- inscricao: usuários inscritos em canais (relacionamento N:M)
- comentario: texto, autor, vídeo relacionado, data
- curtida_video: usuários que curtiram ou descurtiram vídeos
- curtida_comentario: usuários que curtiram ou descurtiram comentários
- playlist: nome, status público, data de criação, dono (usuário)
- playlist_video: relacionamento N:M entre playlists e vídeos

---

## Relacionamentos e requisitos funcionais atendidos

- **"Un usuari/ària publica vídeos..."**  
  **pt-br** Um usuário publica vídeos em seu canal.  
  A modelagem inclui as tabelas `usuario`, `canal` e `video`, com chaves estrangeiras conectando o vídeo ao canal e o canal ao usuário.

- **"Un vídeo pot tenir tres estats diferents..."**  
  **pt-br** Um vídeo pode ser público, privado ou oculto.  
  O campo `estado` foi criado como `enum` dentro da tabela `video`.

- **"Un vídeo pot tenir moltes etiquetes..."**  
  **pt-br** Um vídeo pode ter várias tags.  
  Foi criada a tabela `video_tag` para representar o relacionamento N:M entre `video` e `tag`.

- **"Un usuari/ària pot subscriure’s als canals..."**  
  **pt-br** Usuários podem se inscrever em canais.  
  A tabela `inscricao` representa o relacionamento N:M entre `usuario` e `canal`.

- **"Un usuari/ària pot donar-li un like o un dislike a un vídeo una única vegada..."**  
  **pt-br** Usuários podem curtir ou descurtir vídeos.  
  A tabela `curtida_video` armazena o tipo da interação (`like` ou `dislike`) com a data.

- **"Un usuari/ària pot escriure comentaris..."**  
  **pt-br** Usuários podem comentar em vídeos.  
  A tabela `comentario` armazena quem comentou, o texto e o vídeo relacionado.

- **"Un usuari/ària pot marcar un comentari com m’agrada o no m’agrada..."**  
  **pt-br** Likes e dislikes em comentários foram modelados na tabela `curtida_comentario`.

- **"Un usuari/ària pot crear playlists..."**  
  **pt-br** Playlists públicas ou privadas foram modeladas com a tabela `playlist` e seu relacionamento com vídeos em `playlist_video`.

---

## Estrutura dos arquivos do projeto

- `bd_youtube.sql`  
  Contém a criação do banco de dados e de todas as tabelas, com chaves primárias, estrangeiras e tipos de dados apropriados.

- `dados_youtube.sql`  
  Popular dados fictícios com exemplos de usuários, canais, vídeos, comentários, curtidas e playlists.

- `consultas_youtube.sql`  
  Conjunto de queries SQL para validar os relacionamentos e extrair dados relevantes como interações, popularidade e estrutura de playlists.

- `der_youtube.png` *(opcional)*  
  Diagrama entidade-relacionamento exportado do MySQL Workbench.

---

## Como gerar o DER no MySQL Workbench

1. Abra o MySQL Workbench
2. Vá em `File > New Model`
3. Acesse `Database > Reverse Engineer`
4. Selecione a conexão com o banco `youtube`
5. Escolha as tabelas e conclua
6. No menu lateral, abra `EER Diagram`
7. Organize visualmente as entidades e exporte via `File > Export > PNG`

---
