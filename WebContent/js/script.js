function toWrite(){
	alert("수강 작성");
	location.href = "/ncs_java_yhs4/index.jsp?pp=write";
}

function toList(){
	alert("목록으로");
	location.href = "/ncs_java_yhs4/index.jsp?pp=list";
}

function toBack(){
	window.history.back();
}

function toInsert(){
	document.getElementById("insert").submit();
}

function toAddLec(){
	alert("강사추가");
	location.href="/ncs_java_yhs4/index.jsp?pp=addLec";
}

function join(){
	document.getElementById("join").submit();
}