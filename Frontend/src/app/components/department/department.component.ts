import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';
import { DepartmentService } from '../../services/department.service';
import { PermissionService } from '../../services/permission.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-department',
  templateUrl: './department.component.html',
  styleUrls: ['./department.component.css']
})
export class DepartmentComponent implements OnInit {

  departments:any=[];
  constructor(private departmentservice : DepartmentService,public authservice : AuthService,private router : Router, private permissionservice : PermissionService) { }
  userPermissions:any;
  moduleID =0;
  ngOnInit(): void {
   
    this.departmentservice.GetDepartments()
    .subscribe((res:any)=>{
      this.departments = res;
      console.log(res);
    })
    
    this.permissionservice.GetPemission('Department').subscribe((data:any)=>{
      console.log(data);
      this.userPermissions = data
    });

  //   if(this.authservice.getUser()){
  //   this.authservice.GetUserAccessModules(localStorage.getItem('userID')).subscribe(
  //     (data:any)=>{
  //     console.warn(data);
  //     this.moduleID=data.find((a:any)=>a.moduleName == 'Department')?data.find((a:any)=>a.moduleName == 'Department').moduleID:null;
  //     if(this.moduleID==null || this.moduleID==0){
  //       this.router.navigate(['/']);
  //     }
  //     else{
  //       this.authservice.getpermissions(this.moduleID).subscribe((data:any)=>{
  //         this.userPermissions = data;
  //         console.warn(this.userPermissions); 
  //         if(!this.userPermissions.calView){
  //           this.router.navigate(['/']);
  //         }
  //     })}
  //   },
  //   (err:any)=>{
  //     if (err.status === 401){
  //       this.authservice.logout()
  //     }
  //   }
  //   )
  // }

  }


  value :any;
  setvalue(){
    this.value = "Saved";
  }

  ngOnDestroy(): void {

    Swal.fire({
      title: 'Do you want to save the changes?',
      showDenyButton: true,
      showCancelButton: true,
      confirmButtonText: 'Save',
      denyButtonText: `Don't save`,
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        Swal.fire('Saved!', '', 'success')
      } else if (result.isDenied) {
        Swal.fire('Changes are not saved', '', 'info')
      }
    })
    
    // alert("continue withot saving ?")
    
  }


}
