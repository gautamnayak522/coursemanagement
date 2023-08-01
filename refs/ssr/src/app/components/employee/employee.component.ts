import { Component, OnInit } from '@angular/core';
import { NgbModal, ModalDismissReasons } from '@ng-bootstrap/ng-bootstrap';
import { FormBuilder, Validators } from '@angular/forms';
import { interval, Observable } from 'rxjs';
import { getDataDetail } from '@microsoft/signalr/dist/esm/Utils';
import * as signalR from '@microsoft/signalr';
import { Router } from '@angular/router';
import { DataService } from 'src/app/services/data.service';
import { AuthService } from 'src/app/services/auth.service';
import { PermissionService } from 'src/app/services/permission.service';
import { EmployeeService } from 'src/app/services/employee.service';
import { DepartmentService } from 'src/app/services/department.service';

@Component({
  selector: 'app-employee',
  templateUrl: './employee.component.html',
  styleUrls: ['./employee.component.css']
})
export class EmployeeComponent implements OnInit {

  employees: any = [];
  departments: any = [];
  empId: any;
  moduleID = 0;
  closeResult: string = '';
  userPermissions:any;

  constructor(private dataService:DataService, public authservice:AuthService,private router : Router,private permissionservice : PermissionService,  private employeeservice: EmployeeService, private modalService: NgbModal, private formbuilder: FormBuilder, private departmentservice: DepartmentService) { }


  ngOnInit(): void {

      // if(!this.authservice.getUser()){
      //   this.router.navigate(['/']);
      // }
      
      this.getData()
  
        const connection = new signalR.HubConnectionBuilder()
            .configureLogging(signalR.LogLevel.Information)
            .withUrl("https://localhost:44341/datasocket")
            .build();

        connection.start().catch(err => console.log(err.toString()));

        connection.on("ReceiveOne", (data, operation) => {

          this.getData();

        });      
}

  getData(){
    this.employeeservice.GetEmployees()
      .subscribe((res: any) => {
        this.employees = res;
        console.log(res);
      })
      // interval(5000).pipe(mergeMap(()=>this.departmentservice.GetDepartments()))
    this.departmentservice.GetDepartments()
      .subscribe((res: any) => {
        this.departments = res;
        console.log(res);
      })

      this.permissionservice.GetPemission('Employee').subscribe((data:any)=>{
        console.log(data);
        this.userPermissions = data
      });

    //   if(this.authservice.getUser()){
    //     this.authservice.GetUserAccessModules(localStorage.getItem('userID')).subscribe(
          
    //       (data:any)=>{
    //       console.warn(data);
    //       this.moduleID=data.find((a:any)=>a.moduleName == 'Employee').moduleID;
          
    //       this.authservice.getpermissions(this.moduleID).subscribe((data:any)=>{
    //         this.userPermissions = data;
    //         console.warn(this.userPermissions); 
    //       })
    //     },
    //     (err:any)=>{
    //       if (err.status === 401){
    //         this.authservice.logout()
    //       }
    //     }
    //     )
    // }
  }

  employeeform = this.formbuilder.group({
    empId: [0],
    firstName: ['', Validators.required],
    lastName: ['', Validators.required],
    mobileNo: ['', Validators.required],
    emailAddress: ['', Validators.required],
    deptId: ['', Validators.required]
  })

  //Update

  updateEmployee(item: any) {
    console.log(item);
    this.employeeform.patchValue(item);
  }

  savechanges() {
    console.log(this.employeeform.value);
    //alert("Working on it")
    this.employeeservice.putEmployee(this.employeeform.value).subscribe((arg: any) => this.ngOnInit());

  }

  // Add

  addnewEmployee() {
    this.employeeform.controls["empId"].setValue(0);
    console.log(this.employeeform.value);
    this.employeeservice.postemployee(this.employeeform.value).subscribe((arg: any) => this.ngOnInit());
  }


  //Delete

  deleteEmployee(empId: any) {
    console.log(empId);

    if(!this.authservice.getUser()){
      this.router.navigate(['/']);
    }
    else{
    if (window.confirm('Are sure you want to Delete this Employee ?')) {
      this.employeeservice.deleteEmployee(empId).subscribe((arg: any) => {
        console.log(arg.error);
        if(arg.error){
          alert("You have no Access to Delete Employee")
        }
        this.ngOnInit()
        
      }
    );
    }
  }
  }

  GetDepartmentName(deptId: any) {
    return this.departments.find((a: any) => a.deptId == deptId).deptName;
  }

  open(content: any) {
    
    if(!this.authservice.getUser()){
      this.router.navigate(['/login']);
    }
    else{
    this.modalService.open(content, { ariaLabelledBy: 'modal-basic-title' }).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;

    }, (reason) => {
      this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
    this.employeeform.reset();
  }
  }










  /**
   * Write code on Method
   *
   * @return response()
   */
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
