# CourseManagement

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 14.1.1.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.


>> To publish a new module :
create a new component
add routing for a that component
add same module to database and give permission to Admin (get moduleID)
Script
>>   --insert into [Modules] (moduleName,isActive) values ('image-gallery',1)
  
  --insert into Permissions ([userID]
  --    ,[moduleID]
  --    ,[calView]
  --    ,[canAdd]
  --    ,[canUpdate]
  --    ,[canDelete]) values (1,12,1,1,1,1)

12 is latest module ID.

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




>>>>>>> To Deploy your application in IIS follow the below steps.

Step 1: Build your Angular application using command ng build --prod
Step 2: After build all files are stored in dist folder of your application path.
Step 3: Create a folder in C:\inetpub\wwwroot by name Course-management.
Step 4: Copy the contents of dist folder to C:\inetpub\wwwroot\Course-management folder.
Step 5: Open IIS Manager using command (Window + R) and type inetmgr click OK.
Step 6: Right click on Default Web Site and click on Add Application.
Step 7: Enter Alias name 'Course-management' and set the physical path to C:\inetpub\wwwroot\Course-management.
Step 8: Open index.html file and find the line href="\" and remove '\'.
Step 9: Now browse application in any browser.


>> To deploy on firebase
Install firebase cli : npm install -g firebase-tools
Setup firebase account and project.
Login with gmail account, to complete authentication : npm login
Deploy project directory
To initialize a new Firebase project, run the following command from within your app's directory: 
firebase init
firebase deploy
+  Deploy complete!


npm ci && npm run build

https://course-management-2469.web.app/login