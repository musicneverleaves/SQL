create trigger TestUniqueNulls_Nodup
On TestUniqueNulls
After Insert, Update AS
IF
(Select Count(Distinct NoDupName)
From TestUniqueNulls) > 1
begin
RollBack Tran
RaisError ('Duplicate value', 11, 1)
end