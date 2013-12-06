Sistemas y Tecnologías Web
==========================
David Hernández Bethencourt

Práctica 8: TicTacToe usando AJAX
---------------------------------
La práctica consiste en expandir la práctica anterior del [TicTacToe](https://github.com/DavidHerBet/SYTW-pr7-SinatraDataMapper), para que la página no se recargue cada vez que el jugador hace click en una de las casillas.
Para ello emplearemos código Javascript, concretamente usando JQuery.
Finalmente, desplegaremos la aplicación mediante [Heroku](http://www.heroku.com/).

##Javascript
> JavaScript es un lenguaje de programación interpretado, dialecto del estándar ECMAScript. Se define como orientado a objetos, basado en prototipos, imperativo, débilmente tipado y dinámico.
Se utiliza principalmente en su forma del lado del cliente (client-side), implementado como parte de un navegador web permitiendo mejoras en la interfaz de usuario y páginas web dinámicas aunque existe una forma de JavaScript del lado del servidor (Server-side JavaScript o SSJS). Su uso en aplicaciones externas a la web, por ejemplo en documentos PDF, aplicaciones de escritorio (mayoritariamente widgets) es también significativo.

Fuente: [Javascript - Wikipedia](http://es.wikipedia.org/wiki/JavaScript)

##JQuery
> jQuery es una biblioteca de JavaScript, creada inicialmente por John Resig, que permite simplificar la manera de interactuar con los documentos HTML, manipular el árbol DOM, manejar eventos, desarrollar animaciones y agregar interacción con la técnica AJAX a páginas web. Fue presentada el 14 de enero de 2006 en el BarCamp NYC. jQuery es la biblioteca de JavaScript más utilizada.

Fuente: [JQuery - Wikipedia](http://es.wikipedia.org/wiki/Jquery)

##Instrucciones para ejecutar en local
1. Clona este repositorio para disponer del código:

        $ git clone git@github.com:DavidHerBet/SYTW-pr7-SinatraDataMapper.git

2. Instala las gemas correspondientes sin el entorno de producción para que todo funcione correctamente:

        $ bundle install --without production

3. Ejecuta el programa de forma manual o mediante Rake:

        $ rackup
        $ rake

5. Abre el navegador y ve al puerto 9292 para ver la aplicación:

        $ http://localhost:9292/

6. Visualiza los estilos y juega al tres en raya.

7. Créate un usuario, se guardarán los datos de tus partidas. Para ello deberás registrarte yendo al enlace "Signup" y, tras introducir tus datos, automáticamente se te creará la cuenta y se logueará.

8. Consulta los datos de las partidas de otros jugadores yendo al enlace "Users".

9. Finalmente, comprueba que al clickar sobre una casilla para realizar tu jugada, a la URL no se le añade algo como "/a1".

##Deployment en Heroku
1. Abre el navegador y accede a [Tictactoe AJAX en Heroku](http://david-herbet-tttajax.herokuapp.com/):

        http://david-herbet-tttajax.herokuapp.com/

2. Comprueba que todo funciona correctamente como se menciona más arriba.

---

Universidad de La Laguna  

Escuela Técnica Superior de Ingeniería Informática
