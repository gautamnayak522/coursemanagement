import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { Observable, catchError, finalize, throwError } from 'rxjs';
import { AuthService } from '../services/auth.service';
import { LoaderService } from '../services/loader.service';


@Injectable()
export class TokenInterceptorInterceptor implements HttpInterceptor {

  constructor(private authService : AuthService,private loader : LoaderService) {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {

    if(this.authService.getUser()){
      let token=  localStorage.getItem('token');
      
      request = request.clone({
        setHeaders: {
          Authorization: `Bearer ${token}`,
        },
      });
    }
     
    return next.handle(request).pipe(
      catchError((error) => {
        if (error) {
          console.log(error.error);
        }
        return throwError(error);
      }),
      
      
    )
    ;;
  }
}
