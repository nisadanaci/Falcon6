import { LightningElement } from 'lwc';
import getStudents from '@salesforce/apex/StudentController.getStudents';

const COLUMNS = [
    {label: "Student Name", fieldName:"Student_Name__c", type:"text"},
    {label: "Mobile", fieldName:"Mobile__c", type:"phone"},
    {label: "Class", fieldName:"Class__c", type:"number"},
    {label: "Zip Code", fieldName:"Postal_Code__c", type:"text"},
    {label: "Email", fieldName:"Email__c", type:"email"}
]

export default class StudentSearch extends LightningElement {
    columns = COLUMNS;
    searchWord;
    students;
    error = "Enter a valid postal code";

    changeHandler(event){
        this.searchWord = event.target.value;
        getStudents({keyword: this.searchWord})
        .then(result => {
            this.students =result;
            console.log(this.students);
            if(this.students.length == 0){
                this.error = "No search word found with" + this.searchWord + "Please try another word"
            } else {
                this.error = undefined;
            }
        })
        .catch(err => {
            console.error(err);
            this.error=error;
        })
    }
}