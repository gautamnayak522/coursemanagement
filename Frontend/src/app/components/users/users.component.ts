import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { NgbModal, ModalDismissReasons, NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { AuthService } from 'src/app/services/auth.service';
import { PermissionService } from 'src/app/services/permission.service';


@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.css']
})
export class UsersComponent implements OnInit {

  users: any;
  userpermissions: any
  userform = this.formbuilder.group({
    userID: [0]
  })
  closeResult: string = '';
  moduleName = '';
  moduleID = 0;
  userPermissions:any;


  constructor(public authservice: AuthService, private router: Router, private formbuilder: FormBuilder, private modalService: NgbModal, private permissionservice : PermissionService) { }


  permissionsform = this.formbuilder.group({
    permissionId: '',
    userId: '',
    moduleId: '',
    calView: '',
    canAdd: '',
    canUpdate: '',
    canDelete: '',
  })

  ngOnInit(): void {
   

    // if(this.authservice.getUser()){
    //   this.authservice.GetUserAccessModules(localStorage.getItem('userID')).subscribe((data:any)=>{
    //     console.warn(data);
    //     this.moduleID=data.find((a:any)=>a.moduleName == 'Users')?data.find((a:any)=>a.moduleName == 'Users').moduleID:null;
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

    this.permissionservice.GetPemission('Users').subscribe((data:any)=>{
      console.log(data);
      this.userPermissions = data
    });
       


    this.authservice.GetAllUsers().subscribe((data: any) => {
      console.log(data);
      this.users = data
    })
  }

  GetPermissions() {
    this.authservice.GetPermissionsMaster(this.userform.value['userID']).subscribe((data: any) => {
      console.log(data);
      this.userpermissions = data;
    })
  }

  changepermission(item: any) {
    console.log(item.module.moduleName);

    this.permissionsform.patchValue(item);
    console.log(this.permissionsform.value);
    this.moduleName = item.module.moduleName
  }

  updatepermissions() {

    console.log(this.permissionsform.value);

    this.authservice.Updateuserpermission(this.permissionsform.value).subscribe((data: any) => {
      this.GetPermissions();
    })

  }


  GetUserName(userID: any) {
    return this.users.find((a: any) => a.userID == userID).userName;
  }


  checkuser() {
    if (this.userform.value['userID'] == localStorage.getItem("userID")) {
      return false;
    }
    else {
      return true
    }
  }


  open(content: any) {

    if (!this.authservice.getUser()) {
      this.router.navigate(['/login']);
    }
    else {
      this.modalService.open(content, { ariaLabelledBy: 'modal-basic-title' }).result.then((result) => {
        this.closeResult = `Closed with: ${result}`;

      }, (reason) => {
        this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
      });
      // this.permissionsform.reset();
    }
  }

  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }

}
