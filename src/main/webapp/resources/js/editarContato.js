$(document).ready(function(){
	
	$("#editarContato").click(function(){
		
		$.ajax({ 
			 type: "GET",
			 dataType: "json",
			 url: "http://localhost:8080/exemplo-jpa-spring-mvc/contatos/1",
			 success: function(data){
				console.log(data);			
				document.getElementById("nome").value = data.nome;
				document.getElementById("sobreNome").value = data.sobreNome;
				document.getElementById("endereco").value = data.endereco;
				document.getElementById("email").value = data.email;
				document.getElementById("fone").value = data.fone;
				
			 }
			 });
	});
});