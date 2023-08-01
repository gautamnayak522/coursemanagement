import { Component } from '@angular/core';
import { AuthService } from './services/auth.service';
import { LoaderService } from './services/loader.service';
import { Subject, interval } from 'rxjs';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  title = 'CourseManagement';
  isLoading: Subject<boolean> = this.loader.isLoading;


   numbers = interval(1000);

  /**
   *
   */
  constructor(
    private authservice: AuthService,
    private loader: LoaderService
  ) {}

  ngOnInit(): void {
    //Called after the constructor, initializing input properties, and the first call to ngOnChanges.
    //Add 'implements OnInit' to the class.
    if (this.authservice.getUser()) {
      this.authservice.updateuserName(localStorage.getItem('userName'));
    }
    // this.numbers.subscribe(value=>console.log(value));
    
  }
  
  
  


}
