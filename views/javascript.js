function toggleMenu(objID) {
	var obj = document.getElementById(objID).style;
	obj.display = (obj.display == 'none'?'block': 'none');
}