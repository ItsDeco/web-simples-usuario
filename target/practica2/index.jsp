<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang = "es">


    <head>
        <meta charset = "UTF-8" />
        <meta name = "author" content = "Pagina web compra y venta" />
        <meta name = "keywords" content = "WEB, HTML, HEAD" />
        <meta name = "description" content = "cabecera"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Buylatro</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

        <link rel="icon" type="image/ico" href="img/icono.png"/>
        <link rel="stylesheet" href = "css/styles.css?v=1.0"/>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    </head>


    <body>
        <mi-menu></mi-menu>

        <div id="demo" class="carousel slide custom-carousel" data-bs-ride="carousel">

            <div class="carousel-indicators">
              <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
              <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
              <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
            </div>
            
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="img/balatreoa.png" alt="BalatroTeCambiaraLaVida" class="d-block" style="width:100%"> <!--Cambiar imagenes-->
              </div>
              <div class="carousel-item">
                <img src="img/balatra.png" alt="HazParteDeNuestraFamilia" class="d-block" style="width:100%">
              </div>
              <div class="carousel-item">
                <img src="img/balatreo.png  " alt="AdquiereTusCartasHoy" class="d-block" style="width:100%">
              </div>
            </div>
            
            <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
              <span class="carousel-control-next-icon"></span>
            </button>
        </div>

        <br/>
        <h1 class = "textoIndex">Balatrea con moderación</h1>
        <br/>

      <div class="car-wrap">
          <div class="car-container">
              <div class="car">
                  <button class="car-control prev" aria-label="Previous Slide">◀</button>
                  <div class="car-track">

                      <div class="car-item">
                        <a href="vales.jsp">
                        <img src="img/balatrovales.png" alt="Vales">
                          <p>Vales</p>
                      </a>
                      </div>

                      <div class="car-item">
                        <a href="tarot.jsp">
                        <img src="img/balatro-tarot.png" alt="Cartas de tarot">
                            <p>Cartas de Tarot</p>
                        </a>
                      </div>

                      <div class="car-item">
                        <a href="jokers.jsp">
                            <img src="img/balatro-jokers.jpg" alt="Jokers">
                            <p>Jokers</p>
                        </a>
                    </div>

                      <div class="car-item">
                          <a href="planeta.jsp">
                            <img src="img/balatroplanet.png" alt="Cartas de Planeta">
                            <p>Cartas de Planeta</p>
                        </a> 
                      </div>

                      <div class="car-item">
                        <a href="espectrales.jsp">
                        <img src="img/balatrospectral.png" alt="Cartas Espectrales">
                            <p>Cartas Espectrales</p>
                        </a>
                      </div>

                  </div>
                  <button class="car-control next" aria-label="Next Slide">▶</button>
              </div>
        </div>
      </div>
      
      
      

      <br/>

      <mi-footer></mi-footer>

      <script src="js/mis-etiquetas.js" async defer></script>
    </body>
    
</html>