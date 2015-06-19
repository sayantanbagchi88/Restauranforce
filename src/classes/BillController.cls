public class BillController {

  public Tax__c t1 {get;set;}

  public BillController() {
     Id id = ApexPages.currentPage().getParameters().get('id');
                
                if( t1 == null)
                        {
                                t1= new Tax__c();
                        }
                else
                        {
                                t1=[SELECT Name from Tax__c where Id = :id];
                        }
                }
  }