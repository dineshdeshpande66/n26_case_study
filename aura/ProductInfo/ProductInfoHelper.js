({
	getProductInfo : function(component) {
		var action = component.get('c.getProductInfo'); 
        action.setParams({
            "caseId" : component.get('v.recordId') 
        });
        action.setCallback(this, function(result) {
            console.log('>>> result = ', result);
            var state = result.getState();
            console.log('>>> state = ', state);
            if (state == 'SUCCESS') {
                var products = result.getReturnValue();
                var productInfo;
                console.log('>>> products = ', products);
                for (var i = 0; i < products.length; i++) {
                    if (!products[i].Product2.Product__c) {
                        productInfo = products[i];
                        products.splice(i, 1);
                        component.set('v.productInfo', productInfo);
                        component.set('v.additionProductsInfo', products);
                        console.log('>>> component.get("v.productInfo") = ', component.get("v.productInfo"));
                        console.log('>>> component.get("v.additionProductsInfo") = ', component.get("v.additionProductsInfo"));
                        break;
                    }
                }
            }
        });
        $A.enqueueAction(action);
	}
})