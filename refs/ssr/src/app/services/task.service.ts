import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class TaskService {

  readonly APIUrl = environment.APIUrl;

  constructor(private http: HttpClient) { }

  gettodo(){
    return this.http.get(this.APIUrl+'/Task/Gettodo')
  }
  getdone(){
    return this.http.get(this.APIUrl+'/Task/Getdone')
  }
  updatelist(data:any){
    console.log(data);
    return this.http.post(this.APIUrl+'/Task/SetDoneList',data)
  }
  postnewtask(data:any){
    return this.http.post(this.APIUrl+'/Task',data)
  }
}
