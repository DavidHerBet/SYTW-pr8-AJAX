// Cuando el documento este listo para ejecutar JavaScript
$(document).ready(function(){
  
  // Cada vez que clickemos en una celda
  $(".cell").click(function(celda){

    // Creamos la ruta que contiene la jugada
    var ruta_jugada = '/' + celda.target.id

    // Llamamos a GET con la ruta de la jugada
    $.get(ruta_jugada, function(data){
      
      /* Para emplear AJAX, haremos que el resultado
         no nos renderize la página entera, por lo que
         data, en lugar de devolvernos la página entera
         (que era lo que hacia redirect to (whatever)
         nos devolverá el movimiento del ordenador      */
      if (data.length < 3){
        
        // Esto ocurre cuando el ordenador nos devuelve algo
        // tipo a2, o b2 (es decir, su jugada)
        if(data.length > 0){
            $("#"+celda.target.id).addClass("circle");
            $("#"+data).addClass("cross");
        }

        // Si no devuelve nada es porque se ha escogido una ya marcada
        else{
          alert("Esta casilla ya ha sido usada, escoja otra");
        }
      }

      // Si la longitud es mayor o igual a 3 estamos en
      // "tie" o "computerwins" o "humanwins"
      else{
        setTimeout(function(){
          url = data;
          $(location).attr('href',url);
        },200);
      }
    });
  });
});
