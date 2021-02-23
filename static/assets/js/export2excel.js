function exportTableToExcel($tableSelect, filename = ''){
	$tableSelect = $($tableSelect);
	var downloadLink;
	var dataType = 'application/vnd.ms-excel';
	// var $tableSelect = $("#"+tableID).clone(true);
	$tableSelect.find("input").each(function () {$(this).remove();})
	$tableSelect.find("button").each(function () {$(this).remove();})
	$tableSelect.find("td").each(function () {
		let td = $(this);
		td.html(td.text());
	});
	$tableSelect.find("th").each(function () {
		let td = $(this);
		td.html(td.text());
	});
	var tableHTML = $tableSelect[0].outerHTML.replace(/ /g, '%20').replace(/\#/g, '');
	// return;

	// Specify file name
	filename = filename?filename+'.xls':'excel_data.xls';

	// Create download link element
	downloadLink = document.createElement("a");

	document.body.appendChild(downloadLink);

	if(navigator.msSaveOrOpenBlob){
		var blob = new Blob(['\ufeff', tableHTML], {
			type: dataType
		});
		navigator.msSaveOrOpenBlob( blob, filename);
	}else{
		// Create a link to the file
		downloadLink.href = 'data:' + dataType + ', ' + tableHTML;

		// Setting the file name
		downloadLink.download = filename;

		//triggering the function
		downloadLink.click();
	}
}
