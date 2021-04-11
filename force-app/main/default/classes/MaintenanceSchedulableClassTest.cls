@isTest
public class MaintenanceSchedulableClassTest {
    
    @isTest
    static void test1(){
		MaintenanceSchedulableClass p = new MaintenanceSchedulableClass(); //Schedule apex class name
		String sch = '0 0 8 13 2 ?'; //schedule interval time
        test.startTest();
		String jobID= system.schedule('One Time Pro', sch, p); //system method to schedule apex class
        test.stopTest();
        System.debug('jobID:'+ jobID);
        CronTrigger ct = 
    	[SELECT TimesTriggered, NextFireTime
    	FROM CronTrigger WHERE Id = :jobID];
        System.debug('ct:'+ ct);

        System.assertNotEquals(null, jobID, 'Schedule errored');

        
    }
    
}