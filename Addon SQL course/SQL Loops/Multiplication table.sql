use F;

create table mul(
mul text);

delimiter //
create procedure mul_table(in digit int)
begin
	declare counter int default 1;
    
    mult: loop
    insert into mul value(concat(digit,"x",counter,"=",digit*counter));
    set counter = counter+1;
    if counter>10 then leave mult;
    end if;
    end loop mult;
end//
delimiter ;

drop procedure mul_table;
truncate table mul;
call mul_table(3);
select * from mul;


