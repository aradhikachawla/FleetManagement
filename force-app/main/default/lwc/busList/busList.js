import { LightningElement, wire} from 'lwc';
import getBuses from '@salesforce/apex/LWCController.getBuses';
import {createMessageContext, releaseMessageContext,APPLICATION_SCOPE,subscribe, unsubscribe, publish } from 'lightning/messageService';
import SAMPLEMC from '@salesforce/messageChannel/SampleMessageChannel__c';
import ANOTHERMC from '@salesforce/messageChannel/AnotherMessageChannel__c';
import {refreshApex} from '@salesforce/apex';

export default class BusList extends LightningElement {
recordId='';
context = createMessageContext();
receivedMessage = '';
buses;


@wire(getBuses)
buses;



//////// publish////////
handleClick(event){
          event.preventDefault();
          const message = {
                    recordId:event.target.dataset.actid,
                    recordData:{value:"Message from First LWC"}
          };

publish(this.context,SAMPLEMC,message);
}
///////Publisher////////



///////subscriber/////
connectedCallback(){

          this.subscribeMC();
      }
      
      subscribeMC() {
      
          if (this.subscription) {
              return;
          }
          this.subscription = subscribe(this.context,ANOTHERMC,(message) => {
              this.handleMessage(message);
          },{scope:APPLICATION_SCOPE});
      
      }
      
      handleMessage(message){
          refreshApex(this.buses)
          this.receivedMessage = message ? message.newrecordData.value : 'no message payload';
}   
    disconnectedCallback() {
        releaseMessageContext(this.context);
}
      ///////subscriber/////

}