public with sharing class BatchMainClassNew {
	
    //This method is called from flow for schedule and manual batch run
    @invocableMethod
    public static void callBatchClass(){
        BatchClassForMaintananceNew b= new BatchClassForMaintananceNew();
        Database.executeBatch(b);
    }
    
}