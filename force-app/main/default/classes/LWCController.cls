public with sharing class LWCController {

    public LWCController() {
    System.debug('LWCController');
    }

    @AuraEnabled(cacheable=true)
    public static List<Bus__c> getBuses(){
       
        List<Bus__c> listBus;
       
        try{   
        	listBus = [select Id,  Name,Resale_Value__c, year__c, Bus_Image__c, Odometer_Reading__c, Maximum_Capacity__c  from Bus__c with SECURITY_ENFORCED limit 50000];
        	System.debug('listBus:='+ listBus);
        }
        catch(Exception e){
            System.debug('in catch:='+e.getStackTraceString());
        }
        
        if (listBus.size()>0){
                return listBus;

        }else {
        	return null;
        }
    }



}