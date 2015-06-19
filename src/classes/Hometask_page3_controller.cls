public class Hometask_page3_controller {
	
	Book__c b;
	
	public Book__c b1 { get; set; }
	
	public Hometask_page3_controller(){
	//	b=[SELECT Id, Name, price__c FROM Book__c WHERE Name = :ApexPages.currentPage().getParameters().get('Name')];
		
		Id id = ApexPages.currentPage().getParameters().get('id');
		b = (id == null) ? new Book__c() : [SELECT Name, price__c FROM Book__c WHERE Id = :id];
		
	}
	
	public PageReference save() {
		try {
			upsert(b);
			} catch(System.DMLException e) {
		ApexPages.addMessages(e);
		return null;
	}
// After Save, navigate to the default view page:
return (new ApexPages.StandardController(b)).view();
}
	
	public static void insertBook()
	{
		Book__c b1=new Book__c();
		
	}
	
	public static void updatePrice(Book__c[] books) {
		for (Book__c b :books){
			b.Price__c *= 0.9;
		}
	}
	
	public Book__c getBook() {
		return b;
	}
	
	public PageReference deleteT() {
		delete b;
		return null;
	}

}