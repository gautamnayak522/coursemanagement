-- New Module Script

-- To publish a new module :

/* >>>>>>>>

-- create a new component in angular
-- add routing for a that component
-- add same module to database and give permission to Admin (get moduleID)

-- Script

-- Insert a module to Database

insert into [Modules] (moduleName,isActive) values ('image-gallery',1)
  
-- Give All permissions to Admin User

insert into Permissions ([userID]
    ,[moduleID]
    ,[calView]
    ,[canAdd]
    ,[canUpdate]
    ,[canDelete]) values (1,12,1,1,1,1)

-- 12 is latest module ID.
-- Set permissions for all users

  DECLARE @i int = 2
  while @i IN (select userId from users)
  BEGIN
	insert into Permissions ([userID]
    ,[moduleID]
    ,[calView]
    ,[canAdd]
    ,[canUpdate]
    ,[canDelete]) values (@i,12,0,0,0,0)
	SET @i = @i + 1;
  END


  

  >>>>> SP


 CREATE PROC addnewModule @modulename nvarchar(50)
 AS

 insert into [Modules] (moduleName,isActive) values (@modulename,1)

 Declare @id int = SCOPE_IDENTITY();
 Declare @id2 int =IDENT_CURRENT('Modules')

  insert into Permissions (
     [userID]
    ,[moduleID]
    ,[calView]
    ,[canAdd]
    ,[canUpdate]
    ,[canDelete]) values (1,@id,1,1,1,1)
  
	insert into Permissions (
	 [userID]
    ,[moduleID]
    ,[calView]
    ,[canAdd]
    ,[canUpdate]
    ,[canDelete]) select userId,@id2,0,0,0,0 from users
	where userID != 1
GO


EXEC dbo.addnewModule @modulename = 'dynamic-forms'


select userId,12,0,0,0,0 from users where userID != 1





