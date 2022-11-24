import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';

export default class Assignment2GetPicklistObjInfoOpp extends LightningElement {
    oppRtId;
    oppName;
    stageName = [];
    selectedStage;
    type = [];
    selectedType;


    @wire(getObjectInfo, {objectApiName: OPPORTUNITY_OBJECT})
        oppHandler({data, error}) {
            if(data) {
                this.oppRtId = data.defaultRecordTypeId;
            }
        }
            if(error){
                console.error(error);
            }
            @wire(getPicklistValues,{fieldApiName:STAGE_FIELD, recordTypeId: '$oppRtId'})
            stageHandler({data, error}) {
                if(data) {
                    console.log(data);
                    this.stageName = this.picklistGenerator(data);
                }
                if(error) {
                    console.error(error);
                }
            }
        

            @wire(getPicklistValues, {fieldApiName:TYPE_FIELD, recordTypeId: '$oppRtId'})
            typeHandler({data, error}) {
                if(data) {
                    console.log(data);
                    this.type = this.picklistGenerator(data);
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
                if(event.target.name === "name") {
                    this.oppName = event.target.value;
                }
                if(event.target.name === "StageName") {
                    this.selectedStage = event.target.value;
                } if(event.target.name === "Type"){
                    this.selectedType = event.target.value;
                }
            }

        }

