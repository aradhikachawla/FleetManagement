import { LightningElement, api, wire } from 'lwc';
import getBuses from '@salesforce/apex/LWCController.getBuses';
import {createMessageContext, releaseMessageContext,APPLICATION_SCOPE,subscribe, unsubscribe, publish } from 'lightning/messageService';
import SAMPLEMC from '@salesforce/messageChannel/SampleMessageChannel__c';
import ANOTHERMC from '@salesforce/messageChannel/AnotherMessageChannel__c';
import {refreshApex} from '@salesforce/apex';

export default class busBeerList extends LightningElement {
@api buses;
recordId='';
@api selectedBus;
context = createMessageContext();
receivedMessage = '';




  // wired getBuses method 
  @wire(getBuses)
  buses;

 
  
  
//////// publish////////
handleClick(event){
        //  alert(event.detail);        
          this.selectedBus = event.detail;
      //    alert(this.selectedBus);        

          const message = {
                    recordId:event.detail,
                    recordData:{value:"Message from First LWC"}
          };

publish(this.context,SAMPLEMC,message);
}

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


}