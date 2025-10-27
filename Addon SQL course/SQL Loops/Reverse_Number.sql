use F;

create table reverse_number(
Input text,
Output text);

delimiter //
create procedure rev_num(in num int)
begin
	declare original int default num; 
	declare result text default ''; 
	declare remainder int;
    set remainder = 0;
    
    rev: loop
    set remainder = num % 10;
    set num = num / 10;
	set result = concat(result,remainder);
    if num=0 then leave rev;
    end if;
    end loop rev;
    
	insert into reverse_number value (original,result);
end //
delimiter ;

drop procedure rev_num;
call rev_num(002);

select * from reverse_number;

truncate table reverse_number;

    
    
    
    