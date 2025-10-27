use F;

create table digit_sum(
Input text,
Output text);

delimiter //
create procedure digit_summar(in num int)
begin
	declare original int default num;
    declare result int default 0;
    declare remainder int default 0;
    
    sum: loop
    set remainder = num%10;
    set num = num / 10;
    set result = result+remainder;
    if num = 0 then leave sum;
    end if;
    end loop sum;
    insert into digit_sum values(original, result);
end //
delimiter ;

drop procedure digit_summar;
call digit_summar(1234);
select * from digit_sum;
	