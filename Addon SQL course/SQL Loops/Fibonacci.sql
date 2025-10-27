
create table fibo(
result int );

delimiter //
create procedure fibonacci(in num int)
begin
	declare a int default 0;
    declare b int default 1;
    declare temp int;
    declare counter int default 1;
    
    fibo_loop: loop
    insert into fibo value(a);
    set temp = a+b;
    set a = b;
    set b = temp;
    set counter = counter + 1;
    
    if counter>num then leave fibo_loop;
    end if;
    end loop fibo_loop;
end //
delimiter ;

drop procedure fibonacci;
call fibonacci(10);
select * from fibo;