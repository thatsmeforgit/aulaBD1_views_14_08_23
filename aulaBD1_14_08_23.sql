create table LIVROS (
id_livro int not null auto_increment primary key, 
titulo varchar(100) not null,
ano int(4) not null,
edicao int(3) null,
isbn varchar(40) null,
estilo varchar(40) not null,
id_autor int not null,
constraint fk_autor foreign key(id_autor) references AUTOR(id_autor)
);

insert into LIVROS values 
("Dom Casmurro" , 1899 , "romance" , 1),
("Memórias Póstumas de Brás Cubas" , 1881 , "romance" , 1),
("O capital" , 1867 , "filosofia" , 2),
("Uma contribuição para a crítica da Economia Política" , 1859, "filosofia" , 2),
("A Riqueza das Nações" , 1776 , "filosofia" , 3),
("Teoria dos sentimentos Morais" , 1759 , "filosofia" , 3),
("Sistemas de Banco de Dados" , 2003 , 4 , "banco de dados" , 4),
("Fundamentals od Database System" , 2017 , 7 , "banco de dados" , 4 );

select * from LIVROS;

create view vw_LivrosAutores
as select LIVROS.titulo as Livro , AUTOR.nome, AUTOR.sobrenome  as Autor
from LIVROS inner join AUTOR
on livros.id_autor = AUTOR.id_autor;

select * from vw_LivrosAutores;

create view vw_LivroAlemaes
as select LIVROS.titulo as Livro
from LIVROS inner join AUTOR
on LIVROS.id_autor = AUTOR.id_autor
and AUTOR.nacionalidade = "alemã";

select * from vw_LivroAlemaes;

select Livro , Autor 
from vw_LivrosAutores
order by Livro;
 