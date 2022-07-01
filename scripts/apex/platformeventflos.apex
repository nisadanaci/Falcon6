Custom_Notification__e evt = new Custom_Notification__e();
evt.Message__c = 'Yahooo... Leads have been proccessed successfully!';
evt.Initiator__c = 'Leads Proccessing Batch';
Eventbus.publish(evt);