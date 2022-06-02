USE gimnasio;
SET FOREIGN_KEY_CHECKS=0;

start transaction;
delete from alumnos 
where id_alumnos = 3;

SELECT * FROM alumnos;

-- rollback;
-- commit;
-- insert into alumnos  values (null,'MARIANA','GABBANI',52,'3512457863','GABBANIMARIANA@GMAIL.COM');

SET FOREIGN_KEY_CHECKS=1;

start transaction;
insert into clases values (null,'MUSCULACION 2',4,3);
insert into clases values (null,'YOGA',1,2);
insert into clases values (null,'ZUMBA 2',5,2);
insert into clases values (null,'MUSCULACION 3',4,3);
savepoint insert4;
insert into clases values (null,'MMA1',2,3);
insert into clases values (null,'ZUMBA 3',5,2);
insert into clases values (null,'MUSCULACION 4',4,3);
insert into clases values (null,'YOGA PARA ADULTOS 2',1,2);
savepoint insert8;

release savepoint insert4;