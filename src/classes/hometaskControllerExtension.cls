public class hometaskControllerExtension {
    public  Book__c b{get;set;}
    // controller.
    public hometaskControllerExtension(ApexPages.StandardController stdController) {
       b=new Book__c();
    }
  
    public void dosave()
    {
    	insert b;
    }
     
}