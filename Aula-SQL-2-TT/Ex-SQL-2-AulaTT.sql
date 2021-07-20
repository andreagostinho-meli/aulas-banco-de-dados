-- 1. Explique o conceito de normalização e para que é usado.
-- Normalização de banco de dados é um conjunto de regras que visa, principalmente, a organização de um projeto de banco de dados para reduzir a redundância de dados, aumentar a integridade de dados e o desempenho.

-- 2. Adicione um filme à tabela de filmes.
-- insert into movies (title, rating, awards, release_date, length, genre_id) values ('Vingadores', 8.7, 2, '2012-04-27', 150, null);
-- select id, title from movies order by id desc limit 1;

-- 3. Adicione um gênero à tabela de gêneros.
-- insert into genres (created_at, name, ranking, active) values ('2021-07-20 03:00:00', 'Biográfico', 13, 1);
-- select id, name from genres order by id desc limit 1;

-- 4. Associe o filme do Ex 2. ao gênero criado no Ex. 3
-- update movies set genre_id = 13 where id = 22;

-- 5. Modifique a tabela de atores para que pelo menos um ator adicione como favorito o filme adicionado no Ex. 2
-- update actors set favorite_movie_id = 22 where id = 12;
-- select * from actors where id = 12;

-- 6. Crie uma cópia temporária da tabela de filmes.
-- create temporary table if not exists temp_movies as (select * from movies);
-- select * from temp_movies;

-- 7. Elimine desta tabela temporária todos os filmes que ganharam menos de 5 prêmios.
-- delete from temp_movies where awards < 5;
-- select * from temp_movies;

-- 8. Obtenha a lista de todos os gêneros que possuem pelo menos um filme.
-- select g.name from genres g inner join movies m on g.id = m.genre_id group by g.name;

-- 9. Obtenha a lista de atores cujo filme favorito ganhou mais de 3 prêmios.
-- select a.first_name, a.last_name, m.title, m.awards from actors a inner join movies m on a.favorite_movie_id = m.id where m.awards > 3;

-- 10. Use o plano de explicação para analisar as consultas nos Ex. 6 e 7.
-- explain delete from temp_movies where awards < 5;

-- 11. O que são os índices? Para que servem?
-- No contexto de banco de dados, um índice é uma estrutura (ou arquivo) auxiliar associado a uma tabela (ou coleção de dados). 
-- Sua função é acelerar o tempo de acesso às linhas de uma tabela, criando ponteiros para os dados armazenados em colunas específicas.

-- 12. Crie um índice sobre o nome na tabela de filmes.
-- create index movie_title_idx on movies (title);

-- 13. Verifique se o índice foi criado corretamente.
-- show index from movies;