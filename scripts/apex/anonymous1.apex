List<List<sObject>> searchList = [find 'Mission Control' IN ALL FIELDS
                                 RETURNING Contact(FirstName, LastName, Phone, Email, Description)];
List<Contact> searchContact = searchList.get(0);
System.debug('Found the following contacts:');
for(Contact c : searchContact){
    System.debug(c.lastName+', '+c.firstName);
}