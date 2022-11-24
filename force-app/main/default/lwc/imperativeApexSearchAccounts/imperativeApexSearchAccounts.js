import { LightningElement } from 'lwc';
import getAccountsByIndustry from '@salesforce/apex/AccountCtrl.getAccountsByIndustry';

const COLUMNS = [
    {label: "Account Name", fieldName: "Name", type: "text"},
    {label: "Account Type", fieldName: "Type", type: "text"},
    {label: "Industry", fieldName: "Industry", type: "text"},
    {label: "Annual Revenue", fieldName: "AnnualRevenue", type: "currency"}
];
//bu field lri neden import etmedik SOQL le cagirdigimiz icin ACCOUNTCTRL classin icinde import etmis olduk Soql le caigriarak ve onu bu componenet te cagirdik. 
export default class ImperativeApexSearchAccounts extends LightningElement {
    columns = COLUMNS;
    selectedIndustry;
    accounts;
    error = "Select an industry to see the matching accounts...";
    
    changeHandler(event) {
        this.selectedIndustry = event.target.value;
        getAccountsByIndustry({industry: this.selectedIndustry})
            .then(result => {
                this.accounts = result;
                if(this.accounts.length == 0) {
                    this.error = "There are no matching accounts for the selected type."
                } else {
                    this.error = undefined;
                }
            })
            .catch(error => {
                this.error = error.body.message;
                this.accounts = undefined;
            })
    }
    
    get industryOptions() {
        return [
            {label: "Agriculture", value: "Agriculture"},
            {label: "Banking", value: "Banking"},
            {label: "Biotechnology", value: "Biotechnology"},
            {label: "Consulting", value: "Consulting"}
        ];
    }
}
//Display the industry options as combo box. Every time a user makes a selection, all the accounts belong to that industry should be displayed in a data table