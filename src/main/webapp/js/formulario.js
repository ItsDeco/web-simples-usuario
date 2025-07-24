document.addEventListener('DOMContentLoaded', function () {
    document.querySelector('form[name="consulta"]').addEventListener('submit', function (event) {
      alert('Mensaje enviado');
      this.reset();
    });
    });
    