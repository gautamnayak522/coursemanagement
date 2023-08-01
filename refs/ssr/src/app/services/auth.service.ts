import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Route, Router } from '@angular/router';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  readonly APIUrl = environment.APIUrl;

  constructor(private http: HttpClient,private router : Router) { }

  token :any;

  private userName = new BehaviorSubject('user');
  currentuserName = this.userName.asObservable();

  updateuserName(name: any) {
    this.userName.next(name)
    // localStorage.removeItem('userName')
  }


  

  login(data:any): any {
    return this.http.post(this.APIUrl + '/Login', data)
  }
  logout(): any {
    localStorage.clear();
    window.location.reload();
  }

  getpermissions(moduleId:any):any{
    return this.http.get(this.APIUrl + '/User/GetModulePermissions?moduleID='+moduleId);
  }

  GetUserAccessModules(userId:any):any{
    return this.http.get(this.APIUrl + '/User/GetUserAccessModules?userID='+userId)
    
  }

  GetAllUsers(){
    return this.http.get(this.APIUrl + '/User/GetUsers');
  }


  GetPermissionsMaster(userID:any){
    return this.http.get(this.APIUrl + '/User/GetPermissionsMaster?userID='+userID);
  }

  Updateuserpermission(data:any){
    return this.http.put(this.APIUrl + '/Permission?id='+data.permissionId,data);
  }


  getUser(): any {
    const token = localStorage.getItem('token');
    if (token)
      return true;
    else
      return false;
  }
}
