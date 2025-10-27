use F;

create Table Prime(
Input int,
Output text);

delimiter //
create procedure prime_checker(in num int)
begin
	declare counter int default 2;
    declare result int;
    declare stopper int;
    set stopper = num / 2;
	prime: loop
		set result = num % counter;
		if (result = 0 OR counter = floor(stopper)) then 
			insert into Prime values(num,"NO");
            leave prime;
            end if;
		set counter = counter + 1;
	end loop prime;
    if (result != 0) then insert into Prime values(num,"Yes");
    end if;
end //
delimiter ;

drop procedure prime_checker;
call prime_checker(13);
select * from Prime;
truncate table Prime;
    