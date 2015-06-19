public class TaxClass {
	
  public Bill__c b1 {get;set;}
  public Tax__c t2 {get;set;}
  public Tax__c t1 {get;set;} // new tax to create
  public List<Tax__c> results{get;set;} // search results
  public string searchString{get;set;} // search keyword

  public TaxClass(ApexPages.StandardController stdController) {
    b1 = new Bill__c();
    t1 = new Tax__c();
	 // get the current search string
    searchString = System.currentPageReference().getParameters().get('lksrch');
    runSearch();  
	}
  
  // performs the keyword search
  public PageReference search() {
    runSearch();
    return null;
  }

  // prepare the query and issue the search command
  private void runSearch() {
    // TODO prepare query string for complex serarches & prevent injections
    results = performSearch(searchString);               
  } 

  // run the search and return the records found. 
  private List<Tax__c> performSearch(string searchString) {

    String soql = 'select name, Tax_Name__c, Restaurant_Name__c, Tax_Percentage__c from Tax__c';
    if(searchString != '' && searchString != null)
      soql = soql +  ' where name LIKE \'%' + searchString +'%\'';
    //soql = soql + ' limit 25';
    System.debug(soql);
    return database.query(soql); 

  }

  // save the new tax record
  public PageReference saveTax() {
    insert t1;
    // reset the tax
    t1 = new Tax__c();
    return null;
  }

  // used by the visualforce page to send the link to the right dom element
  public string getFormTag() {
    return System.currentPageReference().getParameters().get('frm');
  }

  // used by the visualforce page to send the link to the right dom element for the text box
  public string getTextBox() {
    return System.currentPageReference().getParameters().get('txt');
  }

}