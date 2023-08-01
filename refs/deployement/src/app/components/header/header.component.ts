import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css'],
})
export class HeaderComponent implements OnInit {
  AccessModules: any;
  username: string = '';
  constructor(public authservice: AuthService, private router: Router) {}

  ngOnInit(): void {
    this.authservice.currentuserName.subscribe((name) => {
      this.username = name;
    });

    if (this.authservice.getUser()) {
      this.authservice
        .GetUserAccessModules(localStorage.getItem('userID'))
        .subscribe((data: any) => {
          console.log(data);
          this.AccessModules = data;
          console.log(this.AccessModules);
        });
    }
  }
  logout() {
    Swal.fire({
      title: 'Are you sure?',
      //text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, logOut',
    }).then((result) => {
      if (result.isConfirmed) {

        Swal.fire({
          position: 'center',
          icon: 'success',
          title: 'Logged out Successfully',
          showConfirmButton: false,
          timer: 1000,
        }).then((result) => {
          this.authservice.logout();
          window.location.reload();
        });
      }
    });
  }
}
