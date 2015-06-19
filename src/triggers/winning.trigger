// Check a checkbox only when an Opp is changed to Closed Won!
trigger winning on Opportunity (before update) {
  for (Opportunity opp : Trigger.new) {
    // Access the "old" record by its ID in Trigger.oldMap
    Opportunity oldOpp = Trigger.oldMap.get(opp.Id);

    // Trigger.new records are conveniently the "new" versions!
    Boolean oldOppIsWon = oldOpp.StageName.equals('Closed Won');
    Boolean newOppIsWon = opp.StageName.equals('Closed Won');
    
    // Check that the field was changed to the correct value
    if ( !oldOppIsWon && newOppIsWon) {
      opp.I_Am_Awesome__c = true;
    }
  }
}