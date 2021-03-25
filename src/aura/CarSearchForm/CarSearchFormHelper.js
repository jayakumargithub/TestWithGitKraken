({
    getCarType : function(component,event,helper) {
        helper.callServer(component, "c.getCarTypes", function(response) {component.set("v.carCategories",response)});
    }
})