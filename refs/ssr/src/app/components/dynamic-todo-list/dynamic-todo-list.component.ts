import { CdkDragDrop, moveItemInArray, transferArrayItem } from '@angular/cdk/drag-drop';
import { Component, OnInit } from '@angular/core';
import { PermissionService } from 'src/app/services/permission.service';
import { TaskService } from 'src/app/services/task.service';


@Component({
  selector: 'app-dynamic-todo-list',
  templateUrl: './dynamic-todo-list.component.html',
  styleUrls: ['./dynamic-todo-list.component.css']
})
export class DynamicTodoListComponent implements OnInit {

  todo:any;
  done:any;
  userPermissions:any;

  constructor(public taskservice : TaskService,public permissionservice : PermissionService) { }

  ngOnInit(): void {

    this.permissionservice.GetPemission('dynamic-todo-list').subscribe((data:any)=>{
      console.log(data);
      this.userPermissions = data
    });

    this.taskservice.gettodo().subscribe((data:any)=>{
      this.todo = data;
      console.log(data);
      
    })

    this.taskservice.getdone().subscribe((data:any)=>{
      this.done = data;
    })

  }

  newtodo = '';

  addtolist(){
    this.todo.push(this.newtodo);
    this.taskservice.postnewtask({"taskTitle":this.newtodo,"isDone":"false"}).subscribe((data:any)=>{
      this.newtodo = '';
      console.log("Added");
      
    })
  }

  saveChanges(){
    this.taskservice.updatelist(this.done).subscribe((data:any)=>{
      console.log("updated");
      this.ngOnInit();
    })
  }

  drop(event: CdkDragDrop<string[]>) {
    console.log(event);
    
    if (event.previousContainer === event.container) {
      moveItemInArray(event.container.data, event.previousIndex, event.currentIndex);
    } 
    else {
      console.warn(event);
      
      transferArrayItem(
        event.previousContainer.data,
        event.container.data,
        event.previousIndex,
        event.currentIndex,
      );

     
    }
  }

}
