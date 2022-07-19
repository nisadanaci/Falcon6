import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';


import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class GetPikclistValuesAccount extends LightningElement {

    accountRtId;
    industryOptions = [];
    selectedIndustry;

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accountInfoHandler({data, error}) {
        if(data) {
            this.accountRtId = data.defaultRecordTypeId;
        }
    }
    @wire(getPicklistValues, {fieldApiName: INDUSTRY_FIELD, recordTypeId: '$accountRtId'})
    picklistHandler({data, error}) {
        if(data) {
            console.log(data);
            this.industryOptions = this.picklistGenerator(data);
        }
        if(error) {
            console.error(error);
        }
    }
    picklistGenerator(data) {
        return data.values.map(item => ({
            label: item.label,
            value: item.value
        }));
    }
    changeHandler(event) {
        this.selectedIndustry = event.target.value;
    }
}

//We are trying to get picklist values to display on the UI for Industry field on Account object.
// 1.) To display that, we need to import Account Object and Industry field.
// 2.) As getPicklistvalues adapter takes one input as record typeId, we need to getObjectInfo to get the Account object record types.
// 3.) IN this case we are usnig only default record type. But if you want to conside any other record type, what we will do, we will take, data.recordTypeInfos, iterate over it ad get the required record type