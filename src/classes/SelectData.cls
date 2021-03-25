public class SelectData {
public static Map<Id, Contact> GetContacts()
{
    return new Map<Id,Contact>([SELECT Id,Name from Contact]);
}
}