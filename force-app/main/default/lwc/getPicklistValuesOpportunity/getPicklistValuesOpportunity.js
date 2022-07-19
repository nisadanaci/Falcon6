import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import OPP_OBJECT from '@salesforce/schema/Opportunity';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';



export default class GetPicklistValuesOpportunity extends LightningElement {
    opportunityRtId;
    stageNameOptions = [];
    selectedStageName;

    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    opportunityInfoHandler({data, error}) {
        if(data) {
            this.opportunityRtId = data.defaultRecordTypeId;
        }
    }
    @wire(getPicklistValues, {fieldApiName: STAGENAME_FIELD, recordTypeId: '$opportunityRtId'})
    picklistHandler({data, error}) {
        if(data) {
            console.log(data);
            this.stageNameOptions = this.picklistGenerator(data);
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
        this.selectedStageName = event.target.value;
    }
}