public with sharing class BatchClassForMaintananceNew implements Database.Batchable<sObject>, Database.Stateful {
    
    
    public BatchClassForMaintananceNew(){
      System.debug('BatchClassForMaintananceNew');
    }

    
    public Database.QueryLocator start(Database.BatchableContext bc) 
    { 	try{
   		    System.debug('start');
            List<Bus__c> listBus =   [SELECT Id, Name, Bus_ID__c, Odometer_Reading__c, Maximum_Capacity__c, Current_Status__c,  Location__Latitude__s,Location__Longitude__s,Schedule_for_service__c FROM Bus__c where  Schedule_for_service__c = true with SECURITY_ENFORCED];
            System.debug('listBus:'+ listBus);
    }catch(Exception e){
                  System.debug('in catch:'+ e.getStackTraceString()+e.getCause()+e.getMessage());

    } 
        return Database.getQueryLocator('SELECT Id,Name, Bus_ID__c, Odometer_Reading__c, Maximum_Capacity__c, Current_Status__c, Schedule_for_service__c, Location__Latitude__s,Location__Longitude__s FROM Bus__c where Schedule_for_service__c = true');

    }
  
    
     public void execute(Database.BatchableContext info, List<Bus__c> listBus) {		
   		 system.debug('execute');
		 List<Maintenance_record__c> listMain = new List<Maintenance_record__c>();
         
         for (Bus__c s: listBus){	
           //  for (sensor__c sen: s.sensors__r){
             s.Current_Status__c = 'Scheduled for Maintenance' ;
             s.Latest_odometer_reading_when_serviced__c = s.Odometer_Reading__c;
           //  s.loaction_of_the_bus__Latitude__s = sen.Location__Latitude__s;
          //   s.loaction_of_the_bus__Longitude__s = sen.Location__Longitude__s;
             System.debug(calculateGarage(s)); 
             s.Garage__c = calculateGarage(s).id;
             Maintenance_record__c mainR = new Maintenance_record__c();
             mainR.Bus__c = s.Id;
             mainR.Garage__c = calculateGarage(s).id;
             mainR.Recorded_odometer__c = s.Odometer_Reading__c;
             mainR.Schedule_reason__c = 'Every 5000 Miles Service';
             listMain.add(mainR);
             
            // }
         }       
         
         
         insert listMain;
         update  listBus;

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