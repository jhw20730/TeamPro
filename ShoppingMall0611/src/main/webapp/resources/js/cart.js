var cartService = (function(){
	
	function getList(param, callback, error) {

	
		$.getJSON("/cart/list/json.json", 
				function(data){
				if(callback){
					callback(data);
				}
		}). fail(function(xhr, status, err){
			if(error){
				error();
			}
		});

	}
	return {
		getList : getList
	};
})();