let usuario = document.getElementById('usuario');
usuario.addEventListener("change", function(){
	if (usuario.value.toUpperCase() == 'Asociada') {
		document.getElementById('codigo1').disabled = false;
	}else {
		document.getElementById('codigo1').disabled = true;
	}
});