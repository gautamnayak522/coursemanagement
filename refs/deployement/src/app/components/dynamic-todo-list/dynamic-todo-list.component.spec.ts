import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DynamicTodoListComponent } from './dynamic-todo-list.component';

describe('DynamicTodoListComponent', () => {
  let component: DynamicTodoListComponent;
  let fixture: ComponentFixture<DynamicTodoListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DynamicTodoListComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DynamicTodoListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
