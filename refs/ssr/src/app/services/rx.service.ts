import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class RxService {

  readonly APIUrl = environment.APIUrl;
  constructor(private http: HttpClient) { }



  getallemployees(){
    return this.http.get(this.APIUrl+'/Rxemployee')
  }

  getmyteam(nodeID:number){
    return this.http.get(this.APIUrl+'/Rxemployee/'+nodeID)
  }

}
