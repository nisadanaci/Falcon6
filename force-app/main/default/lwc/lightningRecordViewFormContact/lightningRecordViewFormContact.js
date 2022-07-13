import { LightningElement } from 'lwc';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import ACCOUNT_FILED from '@salesforce/schema/Contact.AccountId';
import PHONE_FILED from '@salesforce/schema/Contact.Phone';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import MOBILE_FILED from '@salesforce/schema/Contact.MobilePhone';
import OWNERFILED from '@salesforce/schema/Contact.OwnerId';

export default class LightningRecordViewFormContact extends LightningElement {
    recordId = "0038c00002iK7eKAAS";
    objectName = CONTACT_OBJECT;

    fields = {
        name: NAME_FIELD,
        title: TITLE_FIELD,
        account: ACCOUNT_FILED,
        phone: PHONE_FILED,
        email: EMAIL_FIELD,
        mobile: MOBILE_FILED,
        owner: OWNERFILED
    };
}