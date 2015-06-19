public class FutureForAccountTrigger5 {
	
	public static void UpdateTrigger5(Set<Id> rID)
		{
    	if (System.isFuture())
        	FutureForAccountTrigger5.runUpdateTriggerNow(rID);
    	else
	        FutureForAccountTrigger5.UpdateTrigger5Future(rID);			//(new map<Id, Contact>(triggernew)).keyset());
		}
	
	public static void runUpdateTriggerNow(Set<Id> recordId)
		{
		List<Account> accts = [SELECT Id, Name, A__c FROM Account WHERE Id  IN :recordId];
//		List<Account> acct1 = new List<Account>();
		List<Contact> cList = new List<Contact>();
		for (Account ac : accts)
		{
			System.Debug('------> in Future before change value' + ac);
			Contact c= new Contact();
			c.FirstName ='apexTrigger5';
			c.LastName = 'FutureCallNow';
			c.AccountId=ac.Id;
//			ac.A__c='FutureTrigger5';
			System.Debug('------> in Future after change value' + ac);
			cList.add(c);
		}
		upsert cList;
		
		}
	
	@future
	public static void UpdateTrigger5Future(Set<Id> recordId)			//List<Id> recordId)
	{
		//do something
		List<Account> accts = [SELECT Id, Name, A__c FROM Account WHERE Id  IN :recordId];
//		List<Account> acct1 = new List<Account>();
		List<Contact> cList = new List<Contact>();
		for (Account ac : accts)
		{
			System.Debug('------> in Future before change value' + ac);
			Contact c= new Contact();
			c.FirstName ='apexTrigger5';
			c.LastName = 'FutureCall';
			c.AccountId=ac.Id;
//			ac.A__c='FutureTrigger5';
			System.Debug('------> in Future after change value' + ac);
			cList.add(c);
		}
		
		upsert cList;
		
		}
}