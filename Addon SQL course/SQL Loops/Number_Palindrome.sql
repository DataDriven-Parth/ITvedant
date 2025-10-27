use F;

create table palindrome(
Input text,
Output text);

delimiter //
create procedure palindrome_checker(in num int)
begin
	declare original text default num;
    declare remainder int default 0;
    declare result text default '';
    
    pal: loop
    set remainder = num%10;
    set num = num / 10;
    set result  = concat(result,remainder);
    if num = 0 then leave pal;
    end if;
    end loop pal;
    
    insert into palindrome values (original, if(strcmp(original, result)=0,'True','False'));
end //
delimiter ;

call palindrome_checker(1221); 
select * from palindrome;   
    