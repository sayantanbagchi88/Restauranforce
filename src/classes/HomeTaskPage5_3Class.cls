public class HomeTaskPage5_3Class {
    public String searchText;
    public List<Position__c> results;
    public Position__c p {get;set;}
    
     public HomeTaskPage5_3Class () 
    {
        p=new Position__c();
    }
    
    
    public String getSearchText() {
        return searchText;
    }
    public void setSearchText() {
        searchText = String.ValueOf(p.Functional_Area__c);
    }
    public List<Position__c> getResults() {
        return results;
    }
    public PageReference doSearch() {
    	System.debug(searchText);
        results = [SELECT Name, Functional_Area__c, Job_Level__c from Position__c where Functional_Area__c = :p.Functional_Area__c] ;
        //(List<Position__c>)[FIND :searchText RETURNING Position__c(Name, Functional_Area__c, Job_Level__c)][0];
        if (results.size() == 0)
	    			{
	    				apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.Info,'No Records Found in the Position Object');
        				apexpages.addmessage(msg);
              		
	    			}
    return null;
    }
}