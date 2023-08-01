import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import { PermissionService } from 'src/app/services/permission.service';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  constructor(public permissionservice : PermissionService,private authservice : AuthService) { }
  userPermissions:any;

  ngOnInit(): void {

    this.permissionservice.GetPemission('home').subscribe((data:any)=>{
      console.log(data);
      this.userPermissions = data
    });

   
    
    
  }

}
