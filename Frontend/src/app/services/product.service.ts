import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  readonly APIUrl = environment.APIUrl;

  constructor(private http: HttpClient) { }


  getProducts( obj:any ){
    return this.http.get(this.APIUrl+'/Product/GetDataWithPagination?pageNo='+obj.pageNo+
          '&pageSize='+obj.pageSize+
          '&searchstring='+obj.serchterm+
          '&sortcolumnname='+obj.sortcolumnname+
          '&sortorder='+obj.sortorder
        );
  }

}
