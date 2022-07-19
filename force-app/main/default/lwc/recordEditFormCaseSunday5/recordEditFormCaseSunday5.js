import { LightningElement } from 'lwc';

import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import CASE_OBJECT from '@salesforce/schema/Case';
import Subject from '@salesforce/schema/Case.Subject';
import Priority from '@salesforce/schema/Case.Priority';
import Status from '@salesforce/schema/Case.Status';
import Description from '@salesforce/schema/Case.Description';
import Origin from '@salesforce/schema/Case.Origin';
import AccountId from '@salesforce/schema/Case.AccountId';
import ContactId from '@salesforce/schema/Case.ContactId';

export default class RecordEditFormCaseSunday5 extends LightningElement {
    objectName= CASE_OBJECT;
    recordId ="5008c00001HvE7kAAF";
    fields = {
        Subject: Subject,
        Priority: Priority,
        Status: Status,
        Description: Description,
        Origin: Origin,
        AccountId: AccountId,
        ContactId: ContactId

    }

    successHandler (){
        const successEvent = new ShowToastEvent({
            title: "Success",
            message: "Your case has been updated successfully",
            variant: "success"
        });
        this.dispatchEvent(successEvent);
    }
}