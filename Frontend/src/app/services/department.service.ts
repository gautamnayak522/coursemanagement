import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DepartmentService {

  readonly APIUrl = environment.APIUrl;

  constructor(private http:HttpClient) { }

  GetDepartments():Observable<any>{
    return this.http.get<any>(this.APIUrl+'/department')
  }
}
