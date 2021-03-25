({
    onSearch : function(component, event, helper) {
       var categoryId = event.getParam("carCategoryId"); 
        helper.callServer(component,"c.getCars", function(response){ 
            if(response.length > 0){
                component.set("v.cars",response);
                component.set("v.carFound", true);
            }else{
            component.set("v.carFound", false);
            }
        },{"carCategoryTypeId": categoryId})
    }
})