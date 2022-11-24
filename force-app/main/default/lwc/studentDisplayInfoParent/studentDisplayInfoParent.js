import { LightningElement } from 'lwc';

export default class StudentDisplayInfoParent extends LightningElement {
    stdName;
    stdClass;
    changeHandler(event){
        if(event.target.label === "Student Name") {
            this.stdName = event.target.value;

        }else{
            this.stdClass = event.target.value;
        }
    }
}