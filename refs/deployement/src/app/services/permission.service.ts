import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable, ReplaySubject } from 'rxjs';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class PermissionService {

  moduleID = 0;
  userPermissions:any;
  userPermissions1:ReplaySubject<any> = new ReplaySubject(1);
  constructor(private authservice: AuthService, private router: Router) { }

   GetPemission(modulename:any){
    if(this.authservice.getUser()){
      this.authservice.GetUserAccessModules(localStorage.getItem('userID')).subscribe((data:any)=>{
        console.warn(data);
        this.moduleID=data.find((a:any)=>a.moduleName == modulename)?data.find((a:any)=>a.moduleName == modulename).moduleID:null;
        if(this.moduleID==null || this.moduleID==0){
          this.router.navigate(['/']);
        }
        else{
          this.authservice.getpermissions(this.moduleID).subscribe( ( data:any)=>{
            this.userPermissions = data;
            this.userPermissions1.next(data);

            console.warn(this.userPermissions); 
            if(!this.userPermissions.calView){
              this.router.navigate(['/']);
            }
            console.log("ok");
            
            return this.userPermissions1;
          })
        }
      },
      (err:any)=>{
        if (err.status === 401){
          this.authservice.logout()
        }
      }
      )
    }
    return this.userPermissions1
  }
}
