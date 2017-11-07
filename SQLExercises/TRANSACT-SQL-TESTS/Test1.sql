/*
	What would be the output of following SQL?
	1. 2 3
	2. 3 4
	3. 1 0
	4. Endless loop.
*/
declare @a int, @b int
set @a = 0
while @a < 2
begin
	set @a = @a + 1;
	set @b = 0
	while @b < 3
	begin 
		if @b > @a continue
		set @b = @b + 1
	end 
end

print cast(@a as char(1)) + ' ' + cast(@b as char(1))
