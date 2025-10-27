use F;

create table power_table(
Input text,
Output int);

delimiter //
create procedure power_of_n(in n int, in m int)
begin
	declare loop_counter int default 1;
    declare counter int;
    declare result real;
    
    Loop1: loop
		set counter = 1;
        set result = n;
		Loop2: loop
			if counter=loop_counter then leave Loop2;
			end if;
			set result  = result * n;
            set counter = counter + 1;
        end loop Loop2;
        insert into power_table values (concat(n,"^",loop_counter),result);
		set loop_counter = loop_counter +1;
		if loop_counter>m then leave Loop1;
		end if;
    end loop Loop1;
end //
delimiter ;

drop procedure power_of_n;

call power_of_n(2,6);

truncate table power_table;
select * from power_table;
    
    
    
    
    