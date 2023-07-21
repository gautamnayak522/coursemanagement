import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit {
  constructor(
    private formbuilder: FormBuilder,
    public authservice: AuthService,
    private router: Router
  ) {}

  ngOnInit(): void {
    if (this.authservice.getUser()) {
      this.router.navigateByUrl('/');
    }
  }
  token = '';
  loginform = this.formbuilder.group({
    email: '',
    password: '',
  });

  onSubmit() {
    console.log(this.loginform.value);
    this.authservice.login(this.loginform.value).subscribe((data: any) => {
      if (data.message) {

        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: data.message,
          //footer: '<a href="">Why do I have this issue?</a>'
        })


        console.log(data.message);
        // alert(data.message);
      } else {
        this.token = data.token;
        console.log(this.token);
        localStorage.setItem('token', this.token);
        localStorage.setItem('userID', data.userID);
        localStorage.setItem('userName', data.userName);
        // this.authservice.updateuserName(data.userName)

        

        Swal.fire({
          position: 'center',
          icon: 'success',
          title: 'Login Successfully',
          showConfirmButton: false,
          timer: 1000,
        }).then((result) => {
          this.router.navigate(['/']);
          window.location.reload();
        });
      }
    });
  }
}
