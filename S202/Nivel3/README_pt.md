# Exercici 1 - Spotify Simplificado

Este projeto modela e implementa a base de dados de uma plataforma de streaming inspirada no Spotify.
O objetivo é simular funcionalidades essenciais de um sistema de música digital, explorando modelagem relacional e consultas SQL.

---

## Entidades modeladas

* usuario: email, senha, nome, data de nascimento, sexo, país, código postal, tipo (grátis ou premium)
* assinatura: dados da assinatura premium, valor, forma de pagamento
* cartao / paypal: informações específicas para forma de pagamento
* playlist: título, usuário dono, data de criação, status de ativa e compartilhada
* artista: nome do artista
* album: pertence a um artista, título, data e imagem
* musica: pertence a um álbum, título e duração
* playlist_musica: relaciona músicas e playlists, incluindo quem adicionou e quando
* usuario_artista: relacionamento N\:N de seguidores de artistas
* artista_similar: artistas relacionados como similares
* favorito_musica / favorito_album: usuários que marcaram músicas e álbuns como favoritos

---

## Relacionamentos e requisitos funcionais atendidos

* **"Un usuari/ària pot ser gràtis o premium..."**
  Cada usuário é classificado como 'gratis' ou 'premium'. A tabela `usuario` possui o campo `tipo`.

* **"Els usuaris premium tenen una subscripció activa..."**
  A tabela `assinatura` guarda os dados da assinatura ativa. Pode se relacionar com `cartao` ou `paypal`.

* **"Un usuari/ària pot crear llistes de reproducció..."**
  Playlists foram modeladas com status de ativa/inativa, e opção de compartilhamento.

* **"Una cançó pot ser afegida a una llista per altres usuaris..."**
  A tabela `playlist_musica` registra quem adicionou cada música e quando.

* **"Un álbum pertany a un artista..."**
  A hierarquia artista → álbum → música foi modelada com chaves estrangeiras diretas.

* **"Un usuari/ària pot seguir diversos artistes..."**
  O relacionamento muitos-para-muitos foi implementado na tabela `usuario_artista`.

* **"Els artistes poden estar relacionats com a similars..."**
  Foi criada a tabela `artista_similar` com auto-relacionamento entre artistas.

* **"Els usuaris poden marcar àlbums i cançons com a preferits..."**
  Tabelas `favorito_musica` e `favorito_album` registram os favoritos com data.

---

## Estrutura dos arquivos do projeto

* `bd_spotify.sql`
  Criação do banco e de todas as tabelas, com chaves primárias, estrangeiras e tipos apropriados.

* `dados_spotify.sql`
  Inserção de dados fictícios cobrindo usuários, artistas, playlists, músicas, favoritos e relacionamentos.

* `consultas_spotify.sql`
  Consultas SQL para validar o modelo relacional e testar funcionalidades como favoritos, seguidores e playlists.

* `der_spotify.png` *(opcional)*
  Diagrama entidade-relacionamento exportado do MySQL Workbench.

---

## Como gerar o DER no MySQL Workbench

1. Abra o MySQL Workbench
2. Clique em `File > New Model`
3. Acesse `Database > Reverse Engineer`
4. Selecione a conexão com o banco `spotify`
5. Escolha as tabelas e finalize
6. No menu lateral, abra `EER Diagram`
7. Organize as entidades e exporte via `File > Export > PNG`

---
