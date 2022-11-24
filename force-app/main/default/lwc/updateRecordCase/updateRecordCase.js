import { getFieldValue, getRecord, updateRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import SUBJECT from '@salesforce/schema/Case.Subject';
import DESCRIPTION from '@salesforce/schema/Case.Description';
import PRIORITY from '@salesforce/schema/Case.Priority';

const FIELDS = [SUBJECT, DESCRIPTION, PRIORITY];

export default class UpdateRecordCase extends LightningElement {
    recordId = "5008c00001HvE7kAAF";
    formdata = {};
    subject;
    description;
    priority;

    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    caseRecordHandler({data, error}) {
        if(data) {
           this.subject = getFieldValue(data, SUBJECT);
           this.description = getFieldValue(data, DESCRIPTION);
           this.priority = getFieldValue(data, PRIORITY);
        } 
           if(error){
                console.error(error);
        }
    }
    get priorities() {
        return [
            {label: "High", value: "High"},
            {label: "Medium", value: "Medium"},
            {label: "Low", value: "Low"}
        ]
    }
    changeHandler(event) {
        const {name, value} = event.target; //js de Desctructuring assingment ES5 le gelen bir ozellik
        //normal yazilisi bu sekilde
        //const name = event.target.name;
        //const value = event.target.value;
        this.formdata[name] = value; 
        this.formdata['Id'] = this.recordId;
    }
    updateCase() {
        const recordInput = {fields: this.formdata};
        updateRecord(recordInput)
        .then(result => {
            console.log("update record case: ",result);
            this.prepareToast("Success", "Case Updated!", "success");
        })
        .catch(error => {
            console.log(error);
            this.prepareToast("Error", "Update Failed!", "error");

        })
    }
    prepareToast(title, message, variant) {
        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast); //firlatmak oluyor bu instance uretilmis olan show toast event i firlatiyoruz.
    }
//burasi hazir bir toast message kalibi variant kismina success error

}
//then catch de try catch ten farkli olarakchain yapabiliyoruz ama bu biraz ileri bir konu
// update catch icinde ki method ne zmaan handle edilirse calisyor ve update record function i calisarak icine verdigimiz data sayesinde recordu update ediyor
//record input sabit olarak tanimlanmis fields:this.formdata tarafinfand tanimlanmis. Formdata ne oluyor: chabnge handler caistiginda bir event aliyor(HTML) de calisiyor. Changehandler her alana event olarak onchange durumunda calsiyor Fieldlar icin bir formData olusturuyoruz burda
//Burda consta ikisabit var name ve value iki sabit variable in icine assign edilmis oluyor. 
//Name alanini hehrnagi bir input tan doldurduk. Ama egen anme alaninda bir degisiklik olursa name ne olur bu durumda HTML de lightning input un icinde name="Subject" bu updateRecorda gonderildiginde onemli oluyor   value={subject} value da ozel bir durum var value umuz sadece ekranda gostermek icin veriyoruz. value yazmasakta arka planda onu yazacak olan kisi onu value olarak tutar. 
//form data js object
//formData example

// [
//     {name:"value"}
// {Subject:"Yeni konu"} subject=key yenikonu=value
  //form data nin yapisi bu sekilde siz UI da her ne deger girirsen arka planda bunu tutuyor. 
  //formData={Subject:"Yeni konu",RichText__c:"her ne ise",Description:"Aciklama alani"}
//   HTML de yazan value{subject} ya da digerleri default ksim oluyor eger deger olarak hic birsey girilmesse bu defaul deger oluyor.

// ]