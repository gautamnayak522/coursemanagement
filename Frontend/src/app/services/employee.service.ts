import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http'; 
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class EmployeeService {
  readonly APIUrl = environment.APIUrl;

  constructor(private http:HttpClient) { }
  token :any;

  GetEmployees():Observable<any>{
    return this.http.get<any>(this.APIUrl+'/employee')
  }

  putEmployee(data:any){
    
    return this.http.put<any>(this.APIUrl+'/employee?id='+data.empId,data)
  }

  postemployee(data:any){
    return this.http.post<any>(this.APIUrl+'/employee',data)
  }

  deleteEmployee(empId:any):Observable<any>{
    console.log(empId);
    return this.http.delete<any>(this.APIUrl+'/employee?id='+empId)
  }

}
