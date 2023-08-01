import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormArray, FormControl, FormGroup, ValidatorFn } from '@angular/forms';
import { Validators } from '@angular/forms';
import { FormBuilder } from '@angular/forms';
import { Meta, Title } from '@angular/platform-browser';
import { FormField } from 'src/app/models/form-field';

@Component({
  selector: 'app-dynamic-forms',
  templateUrl: './dynamic-forms.component.html',
  styleUrls: ['./dynamic-forms.component.css'],
})
export class DynamicFormsComponent implements OnInit {
  constructor(
    private fb: FormBuilder,
    private http: HttpClient,
    private meta: Meta,
    private title: Title
  ) {}

  public setTitle(newTitle: string) {
    this.title.setTitle(newTitle);
  }

  ngOnInit(): void {
    this.meta.addTags([
      { name: 'description', content: 'Home page of SEO friendly app' },
      { name: 'author', content: 'buttercms' },
      { name: 'keywords', content: 'Dynamic forms, JSON data angular example' },
    ]);
    this.setTitle('Dynamic form page');

    this.http
      .get<FormField[]>('assets/formdata.json')
      .subscribe((formFields) => {
        for (const formField of formFields) {
          this.form.addControl(
            formField.fieldName,
            new FormControl('', this.getValidator(formField))
          );
        }
        this.formFields = formFields;
      });
  }

  formFields: FormField[] = [];
  form = new FormGroup({});

  private getValidator(formField: FormField): ValidatorFn {
    console.log(formField);

    switch (formField.validator) {
      case 'email':
        return Validators.email;
      case 'required':
        return Validators.required;
      default:
        return Validators.nullValidator;
    }
  }

  onSubmit() {
    if (this.form.valid) {
      let value = this.form.value;
      console.log(value);
    }
    if (!this.groupform.valid) {
      this.form.markAllAsTouched();
    }
  }

  // Group form

  submitform() {
    console.log(this.groupform.value);
    if (!this.groupform.valid) {
      this.groupform.markAllAsTouched();
    }
  }

  groupform = this.fb.group({
    persons: this.fb.array([this.createperson()]),
  });

  get groupformControl() {
    return this.groupform.controls;
  }

  createperson(): FormGroup {
    return this.fb.group({
      Name: ['', Validators.required],
      BirthDate: ['', Validators.required],
      Age: [0],
      Gender: ['', Validators.required],
      MobileNo: this.fb.array([
        this.fb.control('', [
          Validators.required,
          Validators.pattern('^((\\+91-?)|0)?[0-9]{10}$'),
        ]),
      ]),
    });
  }

  get persons() {
    return this.groupform.get('persons') as FormArray;
  }

  addPerson() {
    this.persons.push(this.createperson());
  }

  removeperson(i: any) {
    this.persons.removeAt(i);
  }

  // get person mobile array
  personMobile(pIndex: number): FormArray {
    return this.persons.at(pIndex).get('MobileNo') as FormArray;
  }

  addPersonMobile(pid: number) {
    const control = this.persons.controls[pid].get('MobileNo') as FormArray;
    control.push(
      this.fb.control('', [
        Validators.required,
        Validators.pattern('^((\\+91-?)|0)?[0-9]{10}$'),
      ])
    );
  }

  removemobile(pid: number, mid: number) {
    this.personMobile(pid).removeAt(mid);
  }

  calculateAge(pid: number) {
    const bdate = new Date(this.persons.controls[pid].get('BirthDate')?.value);

    let timeDiff = Math.abs(Date.now() - bdate.getTime());
    let age = Math.floor(timeDiff / (1000 * 3600 * 24) / 365.25);
    console.log(age);
    this.persons.controls[pid].get('Age')?.setValue(age);
  }

  // get MobileNo(){
  //   return this.persons
  // }

  // removemobile(i: any) {
  //   this.MobileNo.removeAt(i);
  // }

  // AddMobileNo() {
  //   this.MobileNo.push(
  //     this.fb.control('', [
  //       Validators.required,
  //       Validators.pattern('^((\\+91-?)|0)?[0-9]{10}$'),
  //     ])
  //   );
  // }

  // AddMobileNo1(){
  //   const control = this.persons.controls[1].get('MobileNo');
  //   const control2 = this.groupform.get('persons').
  //   console.warn(control);

  //   // this.persons[1].push(
  //   //   this.fb.control('', [
  //   //     Validators.required,
  //   //     Validators.pattern('^((\\+91-?)|0)?[0-9]{10}$'),
  //   //   ])
  //   // )
  // }
}
