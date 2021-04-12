public with sharing class BatchClassForMaintananceNew implements Database.Batchable<sObject>, Database.Stateful {
    
    
    public BatchClassForMaintananceNew(){
      System.debug('BatchClassForMaintananceNew');
    }

    // This method will capture bus records that will be pulled in batch Apex
    public Database.QueryLocator start(Database.BatchableContext bc) 
    { 	try{
   		    System.debug('start');
            // This list is just for figuring out what is coming up can be commented later actual is query loactor.
            List<Bus__c> listBus =   [SELECT Id, Name, Bus_ID__c, Odometer_Reading__c, Maximum_Capacity__c, Current_Status__c,  Location__Latitude__s,Location__Longitude__s,Schedule_for_service__c FROM Bus__c where  Schedule_for_service__c = true with SECURITY_ENFORCED limit 50000];
            System.debug('listBus:'+ listBus);
    }catch(Exception e){
                  System.debug('in catch:'+ e.getStackTraceString()+e.getCause()+e.getMessage());

    } 
        return Database.getQueryLocator('SELECT Id,Name, Bus_ID__c, Odometer_Reading__c, Maximum_Capacity__c, Current_Status__c, Schedule_for_service__c, Location__Latitude__s,Location__Longitude__s FROM Bus__c where Schedule_for_service__c = true');

    }
  
    
     // This method will execute bus records that are  being  pulled in batch Apex in start method
     public void execute(Database.BatchableContext info, List<Bus__c> listBus) {
         
   		 system.debug('execute');
		 List<Maintenance_record__c> listMain = new List<Maintenance_record__c>();
         try{
             
         for (Bus__c s: listBus){	
             s.Current_Status__c = 'Scheduled for Maintenance' ;
             s.Latest_odometer_reading_when_serviced__c = s.Odometer_Reading__c;
           //  System.debug(calculateGarage(s)); 
             s.Garage__c = calculateGarage(s).id;
             Maintenance_record__c mainR = new Maintenance_record__c();
             mainR.Bus__c = s.Id;
             mainR.Garage__c = calculateGarage(s).id;
             mainR.Recorded_odometer__c = s.Odometer_Reading__c;
             mainR.Schedule_Time__c=DateTime.now();
             mainR.Schedule_reason__c = 'Every 5000 Miles Service';          
             listMain.add(mainR);
         }
           ///// Inserting records in   Maintenance_record__c with partial success
          	Database.SaveResult[] srList = Database.insert(listMain, false);
            	for (Database.SaveResult sr : srList){
            		for(Database.Error err : sr.getErrors()) {
            			System.debug('The following error has occurred.');                    
            			System.debug(err.getStatusCode() + ': ' + err.getMessage());
            			System.debug('Bus fields that affected this error: ' + err.getFields());
            		}
             	}
             
           ////// Updating Bus record for some fields
           // Add below type of object and field level access check whenever doing any insert, update for every particular object 
        /* if(Bus__c.SObjectType.getDescribe().isAccessible() &&
               Bus__c.SObjectType.getDescribe().isQueryable() &&
               Bus__c.SObjectType.getDescribe().isUpdateable() &&
               Bus__c.SObjectType.getDescribe().isCreateable() &&
               Schema.SObjectType.Bus__c.fields.Garage__c.isUpdateable() &&
               Schema.SObjectType.Bus__c.fields.Latest_odometer_reading_when_serviced__c.isUpdateable() &&
               Schema.SObjectType.Bus__c.fields.Current_Status__c.isUpdateable()){
               Database.update(listBus, false); 
               }*/
         
             
         Database.update(listBus, false); 
         }
         catch(Exception e){
                  System.debug('in catch:'+ e.getStackTraceString()+e.getCause()+e.getMessage());
          }

   }
    
    
    
    
    
    

    public void finish(Database.BatchableContext info) { 
        system.debug('finish');

    }

    
    
    public static Garage__c calculateGarage(Bus__c s){
        Map<Garage__c, Double> mapGarage = new Map<Garage__c, Double>();
        List<Garage__c> listGarage = [select id, name,Location__Latitude__s, Location__Longitude__s from Garage__c ];      
        for (Garage__c g : listGarage){
        	Location loc1 = Location.newInstance(s.Location__Latitude__s,s.Location__Longitude__s);
			Location loc2 = Location.newInstance(g.Location__Latitude__s,g.Location__Longitude__s);
			Double dist = Location.getDistance(loc1, loc2, 'mi');          
            mapGarage.put(g,dist);
        }
        
        System.debug('mapGarage:'+mapGarage);
        
        List<Double> newD = mapGarage.values();
        newD.sort();
        Double t= newD.get(0);
        System.debug('t:'+t );
		Garage__c found = new Garage__c();
        for(Garage__c fg : mapGarage.keySet()){
            if (mapGarage.get(fg) == t ){
                 found  = fg;
            }
                
        }
        
        System.debug('found:'+found  );
        System.debug('t:'+t  );
return found;
    }
    
}