import { api, LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import OPP_OBJECT from '@salesforce/schema/Opportunity'
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';

export default class LightningRecordEditFormOpportunity extends LightningElement {
    //recordId = "0068c00000pWRm4AAG";
    @api recordId;
    objectName = OPP_OBJECT;

    fields = {
        name: NAME_FIELD,
        stageName: STAGENAME_FIELD,
        type: TYPE_FIELD,
        amount: AMOUNT_FIELD,
        account: ACCOUNT_FIELD,
        closedate: CLOSEDATE_FIELD
    };
    successHandler() {
        const successToast = new ShowToastEvent({
            title: "Success",
            message: "Opportunity has been saved successfully!",
            variant: "success"
        });
        this.dispatchEvent(successToast);
    }
}