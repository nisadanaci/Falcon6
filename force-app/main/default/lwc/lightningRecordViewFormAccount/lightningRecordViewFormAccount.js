import { LightningElement } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FILED from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FILED from '@salesforce/schema/Account.AnnualRevenue';
import PHONE_FILED from '@salesforce/schema/Account.Phone';
import RATING_FILED from '@salesforce/schema/Account.Rating';
export default class LightningRecordViewFormAccount extends LightningElement {
    recordId = "0018c00002EwfDaAAJ";
    objectName = ACCOUNT_OBJECT;
    fields = {
        name: NAME_FILED,
        type: TYPE_FIELD,
        Industry: INDUSTRY_FIELD,
        revenue: REVENUE_FILED,
        phone: PHONE_FILED,
        rating: RATING_FILED

    };
}