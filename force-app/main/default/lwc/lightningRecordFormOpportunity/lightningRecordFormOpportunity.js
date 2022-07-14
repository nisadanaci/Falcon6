import { LightningElement } from 'lwc';

import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';

export default class LightningRecordFormOpportunity extends LightningElement {
    recordId = '0068c00000pWRmIAAW';
    objectName = OPPORTUNITY_OBJECT;

    successHandler() {
        const successEvent = new ShowToastEvent({
            title: "Success",
            message: "The contact record has been saved successfully",
            variant: "success"
        });
        this.dispatchEvent(successEvent);
    }
    errorHandler() {
        const errorEvent = new ShowToastEvent({
            title: "Error",
            message: "An error occurred while saving the contact record!",
            variant: "error"
        });
        this.dispatchEvent(errorEvent);
    }
}




