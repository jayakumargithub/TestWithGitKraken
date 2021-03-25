({
    doSubmit : function(component, event, helper) { 

            var selectedInstName = component.find("InstituteList").get("v.value");
            var appEvent = $A.get("e.c:SelectInstituteEvent"); 
            appEvent.setParams({"InstituteName": selectedInstName });
            appEvent.fire();
        
    }
})