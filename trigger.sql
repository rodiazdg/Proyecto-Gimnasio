create table log_profesor (
id_profesor int,
cambios varchar(250),
fecha_cambios timestamp,
tiempo_cambio timestamp,
usuario_log varchar(50)
);

DELIMITER $$
create trigger AU_profesor
after update
on profesores for each row
begin
	insert into log_profeosor values (new.id_profesores,
				     concat('Se actualiza Profesor','nombre ',old.nombre,' ',new.nombre,' apellido ',old.apellido,' ',new.apellido,'telefono ',old.telefono,' ',new.telefono,' email ',old.email,' ',new.email,' direccion ',old.direccion,' ',new.direccion,' cuit ',old.cuit,' ',new.cuit),
                                     current_timestamp(),
                                     current_time(),
                                     current_user()
                                     );
end$$ 
DELIMITER;

DELIMITER $$
create trigger AI_profesor
after insert
on profesores for each row
begin
	insert into log_profeosor values (new.id_profesores,
				     concat('Nueno Profesor ','nombre ',new.nombre,' apellido ',new.apellido,'telefono ',new.telefono,' email ',new.email,' direccion ',new.direccion,' cuit ',new.cuit),
                                     current_timestamp(),
                                     current_time(),
                                     current_user()
                                     );
end$$ 
DELIMITER;

DELIMITER $$
create trigger AD_profesor
after delete
on profesores for each row
begin
	insert into log_profeosor values (old.id_profesores,
			 	     concat('se borra profesor'),
                                     current_timestamp(),
                                     current_time(),
                                     current_user()
                                     );
end$$ 
DELIMITER;

DELIMITER $$
create trigger BI_validar_datos_alumnos
before insert
on alumnos for each row
begin
	declare msg_error varchar(250);
    
    if(new.nombre = '' or new.apellido = '' or new.telefono = '') then
        set msg_error = 'los datos: nombre, apellido y telefon son obligatorios';
        signal sqlstate '45000' set message_text = msg_error;
	elseif(new.telefono like '%-%')then
        set msg_error = 'el telefon no debe tener: -';
        signal sqlstate '45000' set message_text = msg_error;
	end if;
end
