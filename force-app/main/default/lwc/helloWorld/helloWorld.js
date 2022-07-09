import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    name; //undefined
    fullname = "Salesforce Developer"; //string
    age = 33; //number
    location = {
        city: "Indiana",
        country: "United States",
        postalCode: "74034"
    }; //object
    fruits = ["Banana", "Orange", "Pomogranite", "Pineapple"]; //array

    //write methods
    getLocation() {
        return this.location.city;
    }
}