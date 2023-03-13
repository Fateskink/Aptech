import { Component } from '@angular/core';
import { Student } from '../models/student.model';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent {
  message:string = 'This is a test message';
  x:number | string = 123;
  student:Student;
  
  constructor() {
    this.student =  new Student({name: 'Hoang', age:18});
  }
}
