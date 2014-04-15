function povoaForm(uri, form) {

	$.ajax({
		type : "GET",
		dataType : "json",
		url : uri,
		success : function(data) {
			
			populate(form, data);

		}
	});

};

function populate(frm, data) {
	$.each(data, function(key, value) {
		$('[name=' + key + ']', frm).val(value);
	});
}