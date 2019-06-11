console.log("review js...");

var reviewService = (function() {

	function getList(param, callback, error) {

		var productCode = param.productCode;
		var page = param.page || 1;

		$.getJSON("/reviews/" + productCode + "/" + page + ".json",
				function(data) {
					if (callback) {
						// callback(data); //댓글 목록만 가져오는 경우
						callback(data.reviewCnt, data.list);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});

	}

	function displayTime(timeValue) {
		var dateObj = new Date(timeValue);
		var str = "";

		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();

		return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
				(dd > 9 ? '' : '0') + dd ].join('');
	}

	return {
		getList : getList,
		displayTime : displayTime
	};
})();