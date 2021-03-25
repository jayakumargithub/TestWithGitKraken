({
    selectInstituteEventHandler : function(component, event) {  
            var InstituteNameValue = event.getParam("InstituteName"); 
            component.set("v.selectedInstitute", InstituteNameValue);     
    }
})