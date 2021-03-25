({
    doInit : function(component, event, helper) {
    helper.getCarType(component, event, helper);  
    },

    doSubmit : function(component,event,helper){  
    var carCategoryTypeId = component.find("carCategList").get("v.value");  
    var appEvent = $A.get("e.c:CarCategoryIdPassEvent");  
    appEvent.setParams({"carCategoryId":carCategoryTypeId}); 
    appEvent.fire(); 
    } 
})