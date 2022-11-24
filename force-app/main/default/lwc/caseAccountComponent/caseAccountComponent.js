import getCaseByAcc from '@salesforce/apex/CaseAccountController.getCaseByAcc';
import ACCOUNT_FIELD from '@salesforce/schema/candidate__c.Account__c';
import { NavigationMixin } from 'lightning/navigation';
import { getRecord } from 'lightning/uiRecordApi';
import { api, LightningElement, wire } from 'lwc';

const FIELDS =[ACCOUNT_FIELD];
export default class CaseAccountComponent extends NavigationMixin(LightningElement) {
    @api recordId;
    accId;
    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    candidateJustAccount({data, error}) {
        if(data) {
            console.log("account data:", data);
            this.accId = data.fields.Account__c.value;
            console.log("accId: ", accId);
        }
    };
    @wire(getCaseByAcc, {accId: '$accId'})
    cases

    navigateToCase(event) {
        console.log("button event: ", event.target.value);
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: event.target.value,
                objectApiName: 'Case',
                actionName: 'view'
            }
        });
    }

 
}