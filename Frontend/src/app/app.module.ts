import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HTTP_INTERCEPTORS, HttpClientModule } from '@angular/common/http'

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './components/header/header.component';
import { EmployeeComponent } from './components/employee/employee.component';
import { DepartmentComponent } from './components/department/department.component';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';
import { UsersComponent } from './components/users/users.component';
import { HomeComponent } from './components/home/home.component';
import { PaginationDemoComponent } from './components/pagination-demo/pagination-demo.component';
import { OrgChartComponent } from './components/org-chart/org-chart.component';
import { ImageGalleryComponent } from './components/image-gallery/image-gallery.component';
import { DragDropModule } from '@angular/cdk/drag-drop';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { DynamicTodoListComponent } from './components/dynamic-todo-list/dynamic-todo-list.component';
import { DynamicFormsComponent } from './components/dynamic-forms/dynamic-forms.component';
import { TokenInterceptorInterceptor } from './interceptor/token-interceptor.interceptor';
import { GalleryModule } from '@daelmaak/ngx-gallery';



@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    EmployeeComponent,
    DepartmentComponent,
    LoginComponent,
    RegisterComponent,
    UsersComponent,
    HomeComponent,
    PaginationDemoComponent,
    DynamicTodoListComponent,
    OrgChartComponent,
    ImageGalleryComponent,
    DynamicFormsComponent,
  ],
  imports: [
    BrowserModule,
    NgbModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    DragDropModule,
    BrowserAnimationsModule,
    GalleryModule

  ],
  providers: [ { provide:HTTP_INTERCEPTORS, useClass:TokenInterceptorInterceptor, multi:true}],
  bootstrap: [AppComponent]
})
export class AppModule { }
