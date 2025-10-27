use F;

create table factorial(
input text,
output text);

delimiter //
create procedure factor(in num int)
begin
	declare counter int default 1;
    declare result int;
    set result = counter;
    
    fact : while counter<=num do
    set result = result * counter;
    set counter = counter + 1;
    end while fact;
    insert into factorial values (concat(num,"!"),result);
end//
delimiter ;

drop procedure factor;
truncate table factorial;
call factor(5);
select * from factorial;
