<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Info</title>
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 80%;
      }
    </style>
    <script type="text/javascript">
    </script>
  </head>
  <body>
    <div id="map"></div>
    <div onclick="javascript:test();">test!!</div>
    <script src="/Tour/js/jquery-map.js"></script>
    <script>
var map;
var real_center;
function test(){
	alert("fuck!!");
};
function ajaxfunc(){
	 $.ajax({
			type : "GET",
			url : "/Tour/result",
			success : getScript
		});
}
function resetMap(){
	line.setPath(null);
	line.setPath(line);
}

function initMap() {
  real_center = {lat: 37.3478859333, lng: 126.8879395};
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: real_center
  });
  ajaxfunc();

}

function getScript(data){
	alert("sadfasdfasd")
	var result;	
	result = data;
	$("#code").html(result);
}

function clickInMap(position_name) {
	//클릭시 이벤트
	$.ajax({
		type : "GET",
		url : "/Tour/list",
		data : {
			"title" : position_name
		},
		success : listOk
	});
}

//	var listMap = new Map();
//	listMap.set("bm_house",bm_house);
//	listMap.set("yh_house",yh_house);
//	listMap.set("cha_house",cha_house);

function listOk(data) {
	var result;
	result = '<span onclick=test();>' + data + '</span>';
	$("#code").html(result);
}
  </script>
  <div id="code"></div>
  <script 
        src="https://maps.googleapis.com/maps/api/js?signed_in=false&callback=initMap"></script>
  </body>
</html>