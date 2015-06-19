public with sharing class MycustomlookupforDetailTax {
        
        public Detail_Tax_Bill__c dt1{get;set;}
        
        public MycustomlookupforDetailTax()
        {
                dt1= new Detail_Tax_Bill__c();
        }
        
        public pagereference dosave()
        { 
        try {
          upsert(dt1);
        } 
        
        catch(System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }
                // After Save, navigate to the default view page:
        //return null;
        return (new ApexPages.StandardController(dt1)).view();
        }
        
        public pagereference docancel()
        {
        return (new ApexPages.StandardController(dt1)).view();
        }

}