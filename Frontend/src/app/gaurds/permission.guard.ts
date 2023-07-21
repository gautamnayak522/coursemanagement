import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from '../services/auth.service';


@Injectable({
  providedIn: 'root'
})
export class PermissionGuard implements CanActivate {

  constructor(private authservice: AuthService, private router: Router) { }
  moduleID =0;
  userPermissions:any;
  moduleName:any;

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {

      this.moduleName = route.routeConfig?.path;

      if(this.authservice.getUser()){
        this.authservice.GetUserAccessModules(localStorage.getItem('userID')).subscribe((data:any)=>{
          console.warn(data);
          this.moduleID=data.find((a:any)=>a.moduleName == this.moduleName)?data.find((a:any)=>a.moduleName == this.moduleName).moduleID:null;
          if(this.moduleID==null || this.moduleID==0){
            this.router.navigate(['/']);
            return false;
          }
          else{
            this.authservice.getpermissions(this.moduleID).subscribe((data:any)=>{
              this.userPermissions = data;
              console.warn(this.userPermissions); 
              if(!this.userPermissions.calView){
                this.router.navigate(['/']);
                return false;
              }
              return this.userPermissions;
          })}
        }
        )
      }



    return true;
  }
  
}
