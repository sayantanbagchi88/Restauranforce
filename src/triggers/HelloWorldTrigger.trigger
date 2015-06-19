trigger HelloWorldTrigger on Book__c (before insert) {
    Book__c[] books = Trigger.new;
    Demo_Class_1.applyDiscount(books);
}