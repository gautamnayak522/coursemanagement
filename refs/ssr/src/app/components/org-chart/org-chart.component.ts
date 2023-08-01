

// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-nocheck
import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import  {OrgChart } from "d3-org-chart";
import * as d3 from 'd3';
import { HttpClient } from "@angular/common/http";
import * as json from "../../assets/tempdata.json";

import { FormBuilder } from '@angular/forms';
import { RxService } from 'src/app/services/rx.service';

@Component({
  selector: 'app-org-chart',
  templateUrl: './org-chart.component.html',
  styleUrls: ['./org-chart.component.css'],
})
export class OrgChartComponent implements OnInit {
  @ViewChild("chartContainer") chartContainer: ElementRef;

  constructor(private rxservice:RxService, private formbuilder : FormBuilder) {
  }


  public selectedValue: any;
  public searchValue: any;
  public filteredList: any = [];

  data:any;
  chart;
  rxusers :any;

  rxempform = this.formbuilder.group({
    nodeID: [0]
  })

  ngOnInit() {
    this.rxservice.getallemployees().subscribe((d:any)=>{
      this.rxusers = d;
      console.warn(d);
      this.filteredList = d;
    })    
  }

  
  filterDropdown() {
    let searchString = this.searchValue;
    console.warn(searchString);
    if (!searchString) {
      this.filteredList = this.rxusers.slice();
      return;
    } else {
      this.filteredList = this.rxusers.filter(
        user => user.employeeName.toLowerCase().indexOf(searchString) > -1
      );
    }
  }

  selectValue(name,nodeID) {
    this.selectedValue = name;
    this.rxservice.getmyteam(nodeID).subscribe((d:any)=>{
      this.data = d;
      this.updateChart();
    })
    this.searchValue = '';
    this.filterDropdown();
  }



  // GetChart(){
  //   console.log(this.rxempform.controls['nodeID'].value);
    
  //   this.rxservice.getmyteam(this.rxempform.controls['nodeID'].value).subscribe((d:any)=>{
  //     this.data = d;
  //     this.updateChart();
  //   })
  // }

  GetFullChart(){
    this.rxservice.getallemployees().subscribe((d:any)=>{
      this.data = d;
      this.rxempform.controls['nodeID'].setValue(0);
      this.updateChart();
    })
  }


  ngAfterViewInit() {
    if (!this.chart) {
      this.chart = new OrgChart();
    }
    this.updateChart();
  }

  ngOnChanges() {
    this.updateChart();
  }
  updateChart() {
    if (!this.data) {
      return; 
    }
    if (!this.chart) {
      return; 
    }
    this.chart
      .container(this.chartContainer.nativeElement)
      .data(this.data)
      .onNodeClick(d => console.log(d + " node clicked"))

          .nodeHeight((d) => 100)
          .nodeWidth((d) => {
            return 260;
          })
          .childrenMargin((d) => 50)
          .compactMarginBetween((d) => 25)
          .compactMarginPair((d) => 50)
          .neightbourMargin((a, b) => 25)
          .siblingsMargin((d) => 25)
          .buttonContent(({ node, state }) => {
            return `<div style="px;color:#716E7B;border-radius:5px;padding:4px;font-size:10px;margin:auto auto;background-color:white;border: 1px solid #E4E2E9"> <span style="font-size:9px">${
              node.children
                ? `<i class="fa fa-angle-up"></i>`
                : `<i class="fa fa-angle-down"></i>`
            }</span> ${node.data._directSubordinates}  </div>`;
          })
          .nodeContent(function (d, i, arr, state) {
            const color = '#FFFFFF';

           return `
           <div style="font-family: 'Inter', sans-serif;background-color:${color}; position:absolute;margin-top:-1px; margin-left:-1px;width:${d.width}px;height:${d.height}px;border-radius:10px;border: 1px solid #E4E2E9">
              <div style="background-color:${color};position:absolute;margin-top:-25px;margin-left:${15}px;border-radius:100px;width:50px;height:50px;" ></div>
              <img src="../../assets/images/user-avatar.png" style="position:absolute;margin-top:-20px;margin-left:${20}px;border-radius:100px;width:40px;height:40px;" />
              
             <div style="font-size:15px;color:#08011E;margin-left:20px;margin-top:32px"> ${
               d.data.employeeName
             } </div>
             <div style="color:#716E7B;margin-left:20px;margin-top:3px;font-size:10px;"> ${
               d.data.officialEmail
             }
             </div>
          </div>
          `; 

        })
        .render();
  }









}
