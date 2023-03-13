export class Student {
    name: string;
    age: number;    
    constructor(params: {name: string, age: number}) { 
        this.name = params.name;
        this.age = params.age;
    }
}