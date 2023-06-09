# README

instalar o docker na maquina 
rodar o seguinte comando 
docker compose(docker-compose) up -d --build
apos entrar no navegador http://localhost:5000/

ele retorna um erro pedindo para criar o banco de dados

entre no pg admin http://localhost:16543/
usuario admin@admin.com.br
senha 123123123

nele precisa criar um servidor, click no Add new server
após vai pedir o nome do servidor(aba general, pode colocar qual nome quiser)
ex: teste
na aba connection
host: SEU IP
port:5432
username: postgres
password: postgres
apos cria a base de dados click com o botao direito e crie a base de dados(test_app_development)

OU

se preferir tem o omnidb
link http://localhost:8091/omnidb_login/?next=/workspace/
usuario: admin 
senha: admin

vai ate conexao cria uma nova conexao tipo postgres
server: SEU IP
port: 5432
database:postgres
user:postgres
userpassword:postgres
crie a tabela test_app_development
apos cria a base de dados click com o botao direito e crie a base de dados(test_app_development)


se deu tudo certo ate aqui entre no rails do docker
docker exec -it ex:test-rails-server-1(nome container) bash
se não souber o nome rode o comando docker ps ali vai ter o nome do container docker verifique o container pelo porta 5000
e repete o comando docker exec -it (nome container) bash

dentro do container vamos criar:

migrations
rake db:migrate RAILS_ENV=development

seeds
rake db:seed

se deu tudo certo ate aqui so entrar nos links

mostrar todas cidades
http://localhost:5000/cities
(clicando no nome do estado ele vai para a tela com todas as cidades do estado)

mostrar todos os estado 
http://localhost:5000/states

mostrar todos paises
http://localhost:5000/countries

rota para busca de estados pelo nome (substitua ex:name=rio)
http://localhost:5000/states?name=para

rota para busca por cidades (substitua ex:name=cur)
http://localhost:5000/cities?name=arau
