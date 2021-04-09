import { LightningElement} from 'lwc';
import { createMessageContext, releaseMessageContext,APPLICATION_SCOPE,subscribe, unsubscribe } from 'lightning/messageService';
import SAMPLEMC from "@salesforce/messageChannel/SampleMessageChannel__c";

export default class busFullDetail extends LightningElement {
context = createMessageContext();
subscription = null;
receivedMessage = '';
busRec;
objectApiName='Bus__c';
      /////////Subscriber/////

connectedCallback(){
          this.subscribeMC();
      }
      subscribeMC() {
          if (this.subscription) {
              return;
          }
          this.subscription = subscribe(this.context,SAMPLEMC,(message) => {
              this.handleMessage(message);
          },{scope:APPLICATION_SCOPE});
  
      }
      
      handleMessage(message){
          this.busRec = message.recordId;
          this.receivedMessage = message ? message.recordData.value : 'no message payload';
        }   

     disconnectedCallback() {
          releaseMessageContext(this.context);
      }

      /////////Subscriber/////

      
      
}