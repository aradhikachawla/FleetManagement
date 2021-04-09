import { LightningElement,api} from 'lwc';
import RESALE_FIELD from '@salesforce/schema/Bus__c.Resale_Value__c';

export default class busResaleTile extends LightningElement {
@api context
@api subscription
@api receivedMessage
@api busRec;
@api objectApiName
fields = [RESALE_FIELD];

}