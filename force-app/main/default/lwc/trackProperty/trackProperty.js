import { LightningElement, track } from 'lwc';

export default class TrackProperty extends LightningElement {
   @track location = {
        city: "Indiana",
        country: "United States",
        postalCode: "46074"

    };
    handleChange(event){
        this.location.city = event.target.value;
    }
}
// //import {lightning element, track } from 'lwc';
//export default class TRACKPROPERTY extends LightningElement{

// @track
//location = {@track is thats a decorator stating it is a reactive }

//https://www.lightningdesignsystem.com/


/*details : {
   name : "Jeff Bezos",
   title : "Executive Chairman",
   company : "Amazon"
}*/