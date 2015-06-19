public with sharing class CustopPopupTaxController {

  public Tax__c t1 {get;set;} // new account to create
  public List<Tax__c> results{get;set;} // search results
  public string searchString{get;set;} // search keyword

  public CustopPopupTaxController() {
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

    String soql = 'select id, name, Tax_Name__c, Restaurant_Name__c, Tax_Percentage__c from Tax__c';
    if(searchString != '' && searchString != null)
      soql = soql +  ' where name LIKE \'%' + searchString +'%\'';
    soql = soql + ' limit 500';
    System.debug(soql);
    return database.query(soql); 

  }

  // save the new account record
  public PageReference saveTax() {
    Database.upsert(t1);
    // reset the account
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