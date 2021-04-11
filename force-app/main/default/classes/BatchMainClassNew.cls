public with sharing class BatchMainClassNew {

    @invocableMethod
    public static void callBatchClass(){
        try{
        BatchClassForMaintananceNew b= new BatchClassForMaintananceNew();
        Database.executeBatch(b);
        }
        catch(Exception e){
            System.debug('in catch:='+e.getStackTraceString());
        }
    }
    
}