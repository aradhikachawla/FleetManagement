public with sharing class DataCraetionClass {

    @invocableMethod
    public static void createData(){
    
        Buses(5);
     	Garages(5);   
        
    }
    
    
    
    public static void Buses(integer count){
        
        try{
            	Database.insert(TestDataFactory.createBus(5),true);
	    		System.debug('Insert done');
        		list<Bus__c> listBus = [select id, name from Bus__c with SECURITY_ENFORCED limit 1000];	
        		System.debug('listBus'+ listBus);
        }
        catch(Exception e){
                System.debug('in catch:='+ e.getStackTraceString()+e.getMessage());
        }
    }
    
    
    
    public static void Garages(integer count){      
        try{
            	Database.insert(TestDataFactory.createGarage(5),true);
	    		System.debug('Insert done');
        		list<Garage__c> listgarage = [select id, name from Garage__c with SECURITY_ENFORCED limit 1000];	
        		System.debug('listgarage'+ listgarage);
        }
        catch(Exception e){
                System.debug('in catch:='+ e.getStackTraceString()+e.getMessage());
        }
        
    }
    
}