import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DepartmentComponent } from './components/department/department.component';
import { LoginComponent } from './components/login/login.component';
import { EmployeeComponent } from './components/employee/employee.component';
import { RegisterComponent } from './components/register/register.component';
import { UsersComponent } from './components/users/users.component';
import { PaginationDemoComponent } from './components/pagination-demo/pagination-demo.component';
import { DynamicTodoListComponent } from './components/dynamic-todo-list/dynamic-todo-list.component';
import { OrgChartComponent } from './components/org-chart/org-chart.component';
import { ImageGalleryComponent } from './components/image-gallery/image-gallery.component';
import { DynamicFormsComponent } from './components/dynamic-forms/dynamic-forms.component';
import { LoginGuard } from './gaurds/login.guard';
import { HomeComponent } from './components/home/home.component';


const routes: Routes = [
  // { path:'', redirectTo: 'home', pathMatch: 'full' },
  {path:'',component:HomeComponent},
  {path:'login',component:LoginComponent},
  {path:'employee',component:EmployeeComponent, canActivate:[LoginGuard]},
  {path:'register',component:RegisterComponent},
  {path:'department',component:DepartmentComponent,canActivate:[LoginGuard]},
  {path:'users',component:UsersComponent,canActivate:[LoginGuard]},
  {path:'pagination-demo',component:PaginationDemoComponent,canActivate:[LoginGuard]},
  {path:'dynamic-todo-list',component:DynamicTodoListComponent,canActivate:[LoginGuard]},
  {path:'org-chart',component:OrgChartComponent,canActivate:[LoginGuard]},
  {path:'image-gallery',component:ImageGalleryComponent,canActivate:[LoginGuard]},
  {path:'dynamic-forms', component:DynamicFormsComponent,canActivate:[LoginGuard]},
  {path:'**',redirectTo:''}
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {
    initialNavigation: 'enabledBlocking'
})],
  exports: [RouterModule]
})
export class AppRoutingModule { }
