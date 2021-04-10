public class MaintenanceSchedulableClass Implements Schedulable
    {
        public void execute(SchedulableContext sc)
        {
            BatchMainClassNew.callBatchClass();
        }
        
}