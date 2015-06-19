public with sharing class hometask_class_4 {
       
        public Account a{get;set;}
        
        public hometask_class_4 (ApexPages.StandardController controller)
                {
                Id id = ApexPages.currentPage().getParameters().get('id');
                
                if( id == null)
                        {
                                a= new Account();
                        }
                else
                        {
                                a=[SELECT Name, Site, Description, Website from Account where Id= :id];
                        }
                }

        public PageReference save() {
                try {
                        upsert(a);
                        } 
                        catch(System.DMLException e) 
                        {
                        ApexPages.addMessages(e);
                        return null;
                        }
                // After Save, navigate to the default view page:
                return (new ApexPages.StandardController(a)).view();
        }
        
}