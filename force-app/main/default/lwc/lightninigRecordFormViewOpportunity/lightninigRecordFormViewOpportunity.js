import { LightningElement } from 'lwc';
import OPPORTUNITY_OBJECT from '@salesforce/schema/OPPORTUNITY';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import CLOSE_FIELD from '@salesforce/schema/Opportunity.CloseDate';

import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import OWNER_FIELD from '@salesforce/schema/Opportunity.OwnerId';


export default class LightningRecordViewOpportunity extends LightningElement {
    recordId = "0068c00000pWRmIAAW";
    objectName = OPPORTUNITY_OBJECT;
    fields = {
        name: NAME_FIELD,
        AccountId: ACCOUNT_FIELD,
        Amount: AMOUNT_FIELD,
        CloseDate: CLOSE_FIELD,
        OwnerId: OWNER_FIELD
    };

}


