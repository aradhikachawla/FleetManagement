public with sharing class BatchMainClassNew {

    @invocableMethod
    public static void callBatchClass(){
        BatchClassForMaintananceNew b= new BatchClassForMaintananceNew();
        Database.executeBatch(b);
    }
    
}