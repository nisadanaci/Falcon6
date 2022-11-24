import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNTNAME_FIELD from '@salesforce/schema/Case.Account.Name';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import CASEREASON_FIELD from '@salesforce/schema/Case.Reason';
import TYPE_FIELD from '@salesforce/schema/Case.Type';
import STATUS_FIELD from '@salesforce/schema/Case.Status';


const FIELDS = [ACCOUNTNAME_FIELD, SUBJECT_FIELD, PRIORITY_FIELD, CASEREASON_FIELD, TYPE_FIELD, STATUS_FIELD];

export default class GetRecordAccountAssignment2 extends LightningElement {
    recordId = "5008c00001HvE7kAAF";
    accountName;
    Subject;
    Priority;
    Reason;
    Type;
    Status;


    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
     
    caseHandler({data, error}) {
        if(data) {
            console.log(data);

            this.accountName = getFieldValue(data, ACCOUNTNAME_FIELD);
            this.Subject = getFieldValue(data, SUBJECT_FIELD);
            this.Priority = getFieldValue(data, PRIORITY_FIELD);
            this.Reason = getFieldValue(data, CASEREASON_FIELD);
            this.Type = getFieldValue(data, TYPE_FIELD);
            this.Status = getFieldValue(data, STATUS_FIELD);
        }
        if(error) {
            console.log(error);
        }
    }
}
