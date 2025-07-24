class Menu extends HTMLElement {
  constructor() {
      super()
      this.innerHTML = `
      <header>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
          <div class="container-fluid">

              <a class="navbar-brand" href="index.jsp">
                  <img src="img/logo.png" alt="Avatar Logo" style="width:40px;" class="rounded-pill"> 
              </a>

              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
              </button>

              <div class="collapse navbar-collapse" id="collapsibleNavbar">

                <ul class="navbar-nav">

                  <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Inicio</a>
                  </li>

                  <li class="nav-item">
                    <a class="nav-link" href="balatr.html">Balatr</a>
                  </li>

                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="" role="button" data-bs-toggle="dropdown">Productos</a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="jokers.jsp">Jokers</a></li>
                      <li><a class="dropdown-item" href="vales.jsp">Vales</a></li>
                      <li><a class="dropdown-item" href="tarot.jsp">Cartas de Tarot</a></li>
                      <li><a class="dropdown-item" href="planeta.jsp">Cartas de Planetas</a></li>
                      <li><a class="dropdown-item" href="espectrales.jsp">Cartas de espectrales</a></li>    
                    </ul>
                  </li>

                  <li class="nav-item">
                    <a class="nav-link" href="Carrito.html">Carrito</a>
                  </li>  


                  <li class="nav-item">
                    <a class="nav-link" href="contacto.html">Contacto</a>
                  </li> 
                  
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Usuario</a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="logintienda.jsp?from=menu">Acceder</a></li>
                      <li><a class="dropdown-item" href="Usuario3.jsp">Registrar</a></li>
                    </ul>
                  </li> 

                </ul>

              </div>
          </div>
        </nav>
    </header>`
  }
}
window.customElements.define('mi-menu', Menu);


class Footer extends HTMLElement {
  constructor(){
      super()
      this.innerHTML=`<footer>
      
      <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
          <div class="container-fluid d-flex justify-content-start">
              <p class="navbar-brand textoFa" href="#">&copy; 2025 - Autor/a - Andre Magalhaes</p>
              <a href="https://www.twitter.com/scratxy"><i class="fa fa-twitter"></i></a>
              <a href="https://www.instagram.com/its.deco_"><i class="fa fa-instagram"></i></a>
          </div>
      </nav>


      </footer>`
  }

}
window.customElements.define('mi-footer', Footer);


class CabeceraTienda extends HTMLElement {
constructor(){
  super()
  this.innerHTML = `<div class="cabecera-tienda">
    <h1>Bienvenido a la tienda!</h1>
    <img src="img/shop.png" alt="LogoShop">
  </div>`
}
}
window.customElements.define('cabecera-tienda', CabeceraTienda);

document.addEventListener('DOMContentLoaded', function () {
const btnCancelar = document.querySelectorAll('button.botonCancelar');
btnCancelar.forEach(button => {
  button.addEventListener('click', function (event) {
    event.preventDefault();
    alert('Pedido Cancelado');
  });
});
});



$(document).ready(function () {
var func = $(".car-track");
var mouse = false;
var startX;
var movizq;

var centrado1 = $(".car-item");
var centrado2 = func.width();
var centrado3 = centrado1.outerWidth(true);
var initialScroll = (centrado3 * centrado1.length - centrado2) / 2;
func.scrollLeft(initialScroll);

func.on("mousedown", function (e) {
    mouse = true;
    func.addClass("active");
    startX = e.pageX - func.offset().left;
    movizq = func.scrollLeft();
});

func.on("mouseleave mouseup", function () {
    mouse = false;
    func.removeClass("active");
});

func.on("mousemove", function (e) {
    if (!mouse) return;
    e.preventDefault();
    var x = e.pageX - func.offset().left;
    var mov = (x - startX) * 2;
    func.scrollLeft(movizq - mov);
});

$(".car-control.prev").on("click", function () {
  func.animate({ scrollLeft: '-=300' }, 300);
});

$(".car-control.next").on("click", function () {
  func.animate({ scrollLeft: '+=300' }, 300);
});

});

