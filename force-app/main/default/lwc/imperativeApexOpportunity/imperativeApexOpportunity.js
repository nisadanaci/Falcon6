import { LightningElement, wire } from 'lwc';
import getOpp from '@salesforce/apex/OpportunityCTRL.getOpp';

import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';

const COLUMNS = [
   {label: "Opportunity Name", fieldName: "Name", type: "text"},
   {label: "Stage Name", fieldName: "StageName", type: "text"},
   {label: "Opportunity Type", fieldName: "Type", type: "text"},
   {label: "Amount", fieldName: "Amount", type: "currency"},
   {label: "Close Date", fieldName: "CloseDate", type: "date"},
];
export default class ImperativeApexOpportunity extends LightningElement {
    oppRtId;
    columns = COLUMNS;
    selectedStage;
    stageOptions=[];
    opps;

    @wire(getObjectInfo, {objectApiName: OPPORTUNITY_OBJECT})
    oppHandler({data, error}) {
        if(data) {
            this.oppRtId = data.defaultRecordTypeId;
        }
    }
    if(error){
        console.log(error);
    }
    @wire(getPicklistValues,{fieldApiName:STAGE_FIELD, recordTypeId: '$oppRtId'})
    stageHandler({data, error}) {
        if(data) {
            console.log(data);
            this.stageOptions = this.picklistGenerator(data);
        }
        if(error) {
            console.error(error);
        }
    }
    picklistGenerator(data) {
        return data.values.map(item => ({
            label: item.label,
            value: item.label
        }));
    }

    changeHandler(event) {
        this.selectedStage = event.target.value;
        getOpp({stage: this.selectedStage})
            .then(result => {
                this.opps = result;
            })
            .catch(error =>{
                console.log(error)
            })


        }
    

    }