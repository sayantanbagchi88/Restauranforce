public with sharing class hometask_page_5_class {
    //public ApexPages.StandardController std2;
    public Position__c p {get;set;}
    public Position__c p1 {get;set;}  //= new List<Position__c> ();
    public List<Position__c> p2 {get;set;}
   // public int i;
    public hometask_page_5_class () 
    {
        p=new Position__c();
        p1=new Position__c();
        
    }

    public PageReference submit() {
        try {
        	if (p.Functional_Area__c != NULL)
        		try{
        			p1 = [SELECT Name, Functional_Area__c, Job_Level__c from Position__c where Functional_Area__c = :p.Functional_Area__c Limit 1 ];
        		}
        		catch(Exception e) 
            		{
            			apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.Info,'No Records Found in the Position Object');
        				apexpages.addmessage(msg);
              		}
        	} 
            catch(System.DMLException e) 
            {
            ApexPages.addMessages(e);
            return null;
            }
        // After Save, navigate to the default view page:
        return (new ApexPages.StandardController(p)).view();
    }
    
    public PageReference dosubmit() {
        try {
        	p2 = new List<Position__c>();
	       	if (p.Functional_Area__c != NULL)
	    		{
	    			p2 = [SELECT Name, Functional_Area__c, Job_Level__c from Position__c where Functional_Area__c = :p.Functional_Area__c ];
	    			if (p2 !=NULL)
	    			{
	    				apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.Info,'No Records Found in the Position Object');
        				apexpages.addmessage(msg);
              		
	    			}
	    		}        
        	/*	try{
        			p2 = [SELECT Name, Functional_Area__c, Job_Level__c from Position__c where Functional_Area__c = :p.Functional_Area__c ];
           			}
           		catch(Exception e) 
            		{
            			apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.Info,'No Records Found in the Position Object');
        				apexpages.addmessage(msg);
              		}*/
        	} 
        catch(System.DMLException e) 
            {
            ApexPages.addMessages(e);
            return null;
            }
        // After Save, navigate to the default view page:
        return (new ApexPages.StandardController(p)).view();
    }
}