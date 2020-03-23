Declare @DynamicSQL varchar(260), @LoginName varchar(130),@TempPassword char(8);
Declare LoginID cursor dynamic For
SELECT distinct *
FROM NewLogins;		
open LoginID;
fetch next from LoginID
into @LoginName;
WHILE @@FETCH_STATUS = 0
begin
set @TempPassword = LEFT(@LoginName, 4) + '9999';
set @DynamicSQL = 'CREATE LOGIN ' + @LoginName + ' ' + 'WITH PASSWORD = ''' + @TempPassword + ''', ' +'DEFAULT_DATABASE = AP';
exec(@DynamicSQL);                      

set @DynamicSQL = 'CREATE USER ' + @LoginName + ' ' + 'FOR LOGIN ' + @LoginName;
exec (@DynamicSQL);
set @DynamicSQL = 'ALTER ROLE PaymentEntry ADD MEMBER ' + @LoginName;
exec(@DynamicSQL);                      
fetch next from LoginID
into @LoginName;
end;
close LoginID;
