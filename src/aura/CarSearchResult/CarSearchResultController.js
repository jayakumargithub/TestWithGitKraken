({
    doInit : function(component, event, helper) {  
           helper.onSearch(component,event,helper);
           console.log("search call finish");
    },
    
    doFormSubmit : function(component,event,helper){   
       helper.onSearch(component,event,helper);  
    }
   
})