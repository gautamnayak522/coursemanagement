import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { PermissionService } from 'src/app/services/permission.service';
import { ProductService } from 'src/app/services/product.service';


@Component({
  selector: 'app-pagination-demo',
  templateUrl: './pagination-demo.component.html',
  styleUrls: ['./pagination-demo.component.css']
})
export class PaginationDemoComponent implements OnInit {

  constructor(private formbuilder : FormBuilder,private productservice : ProductService,private permissionservice : PermissionService) { }
  Products:any;
  Noofpages!:number[];
  startWith!:number;
  endwith!:number;
  totalRecords!:number;
  userPermissions:any;

  ngOnInit(): void {
    this.productservice.getProducts(this.paginationform.value).subscribe(
      (data:any)=>{
        console.log(data);
        this.Products = data.data;
        console.log(this.Products);
        
        this.Noofpages = new Array(data.totalPages)
        console.log(this.Noofpages);
        
        this.totalRecords =   data.totalRecords;
        this.startWith = (data.pageNo-1)*data.pageSize+1;
        this.endwith =  (data.pageNo==data.totalPages)?data.totalRecords:data.pageNo*data.pageSize;    
      }
    )


    this.permissionservice.GetPemission('Pagination-Demo').subscribe((data:any)=>{
      console.log(data);
      this.userPermissions = data
    });
  }


  paginationform = this.formbuilder.group({
    pageNo : 1,
    pageSize : 10,
    serchterm : '',
    sortcolumnname : 'productId',
    sortorder : true
  })


  changePage(page:number=1){
    this.paginationform.controls['pageNo'].setValue(page);
    this.ngOnInit();
  }
  

  changeSize(){
    this.paginationform.controls['pageNo'].setValue(1);
    this.ngOnInit();
  }

  next(){
    if(this.paginationform.controls["pageNo"].value !< this.Noofpages.length)
    {
    this.paginationform.controls['pageNo'].setValue(this.paginationform.controls["pageNo"].value !+ 1);
    
    this.ngOnInit();
    }
  }

  previous(){
    if(this.paginationform.controls["pageNo"].value !> 1)
    {
    this.paginationform.controls['pageNo'].setValue(this.paginationform.controls["pageNo"].value !- 1);
    
    this.ngOnInit();
    }
  }

  sortdata(columnname:string){
    this.paginationform.controls['sortcolumnname'].setValue(columnname);

    if(this.paginationform.controls['sortorder'].value)
      this.paginationform.controls['sortorder'].setValue(false);
    else
      this.paginationform.controls['sortorder'].setValue(true);

    // alert("Sort By : "+this.paginationform.controls['sortcolumnname'].value + " Order : " +  this.paginationform.controls['sortorder'].value)

    this.ngOnInit();
  }

  checkStatus(columnname:string,order : any){
    if(this.paginationform.controls['sortcolumnname'].value == columnname && this.paginationform.controls['sortorder'].value == order){
      return true;
    }
    else{
      return false;
    }
  }




}
