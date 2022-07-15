import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import ACCOUNT_FIELD from '@salesforce/schema/Contact.AccountId';
import DEPARTMENT_FIELD from '@salesforce/schema/Contact.Department';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';


export default class LightningRecordEditFormContact extends LightningElement {
    recorId = "0038c00002iK7e6AAC";
    objectName = CONTACT_OBJECT;

    fields = {
        firstname: FIRSTNAME_FIELD,
        lastname: LASTNAME_FIELD,
        title: TITLE_FIELD,
        account: ACCOUNT_FIELD,
        department: DEPARTMENT_FIELD,
        email: EMAIL_FIELD
    };

    successHandler(){
        const successToast = new ShowToastEvent({
            title: "Success",
            message: "Contact has been saved successfully!",
            variant: "success"
        });
        this.dispatchEvent(successToast);
    }

}