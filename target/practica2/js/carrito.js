class ProductoCarrito {
    constructor(codigo, descripcion, imagen, cantidad, precio, existencias) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.cantidad = cantidad;
        this.precio = precio;
        this.existencias = existencias;
    }
}

var carrito = null;

function cargarCarrito() {
	if (carrito === null) {
        carrito = JSON.parse(localStorage.getItem("mi-carrito-almacenado"));
		if (carrito === null) {
			carrito = [];
		}
	}
}

function guardarCarrito() {
    localStorage.setItem("mi-carrito-almacenado", JSON.stringify(carrito));
}



function agregarAlCarrito(codigo, descripcion, imagen, precio, existencias) {
    cargarCarrito();

    let cambios = false;
    let productos1 = carrito.find(p => p.codigo === codigo);

    if (productos1) {
        if (productos1.cantidad < productos1.existencias) {
            productos1.cantidad++;
            cambios = true;
            alert("Se anadio otra unidad del producto seleccionado.");
        } else {
            alert("Ya no quedan unidades de este producto.");
        }
    } else {
        let producto = new ProductoCarrito(codigo, descripcion, imagen, 1, precio, existencias);
        carrito.push(producto);
        cambios = true;
        alert("Producto anadido al carrito.");
    }

    if (cambios) {
        guardarCarrito();
    }

}


function disminuirCantidad(codigo) {
    cargarCarrito();
    let producto = carrito.find(p => p.codigo === codigo);

    if (producto && producto.cantidad > 1) {
        producto.cantidad--;
    } else {
        carrito = carrito.filter(p => p.codigo !== codigo);
    }

    guardarCarrito();
    mostrarCarritoEnTabla();
    verificar();
}


function aumentarCantidad(codigo) {
    cargarCarrito();
    let producto = carrito.find(p => p.codigo === codigo);

    if (producto && producto.cantidad < producto.existencias) {
        producto.cantidad++;
    } else {
        alert("Ya no quedan unidades de este producto.");
    }

    guardarCarrito();
    mostrarCarritoEnTabla();
}


function eliminarProducto(codigo) {
    cargarCarrito();
    carrito = carrito.filter(p => p.codigo !== codigo);
    guardarCarrito();
    mostrarCarritoEnTabla();
    verificar();
}


function mostrarCarritoEnTabla() {
    cargarCarrito();
    const tabla = document.getElementById('tabla-carrito');
    while (tabla.rows.length > 1) {
        tabla.deleteRow(1);
    }

    carrito.forEach(producto => {
        let fila = tabla.insertRow();

        let img = fila.insertCell();
        img.innerHTML = `<img src="${producto.imagen}" alt="${producto.descripcion}" >`;

        let descrip = fila.insertCell();
        descrip.textContent = producto.descripcion;

        let cantidad = fila.insertCell();
        cantidad.innerHTML = `<button class="botonAccion" onclick="disminuirCantidad(${producto.codigo})">-</button>
                            <span>${producto.cantidad}</span>
                            <button class="botonAccion" onclick="aumentarCantidad(${producto.codigo})">+</button>`;

        let elim = fila.insertCell();
        elim.innerHTML = `<button class="botonAccion2" onclick="eliminarProducto(${producto.codigo})">Eliminar</button>`;
    });
}

function verificar() {
    cargarCarrito();
    
    const b = document.getElementById('boton-carrito');

    if (carrito.length === 0) {
        b.disabled = true;
    } else {
        b.disabled = false;
        b.addEventListener('click', () => {
            window.location.href = 'logintienda.jsp';
        });
    }
}


function mostrarCarritoCompra() {
    cargarCarrito();
    const tabla = document.getElementById('tabla-carrito2');
    let total = 0;

    while (tabla.rows.length > 1) {
        tabla.deleteRow(1);
    }

    carrito.forEach(producto => {
        let fila = tabla.insertRow();

        let img = fila.insertCell();
        img.innerHTML = `<img src="${producto.imagen}" alt="${producto.descripcion}">`;

        let descrip = fila.insertCell();
        descrip.textContent = producto.descripcion;

        let cantidad = fila.insertCell();
        cantidad.textContent = producto.cantidad;

        let precio = fila.insertCell();
        let precioTotal = producto.cantidad * producto.precio;
        total += precioTotal;
        precio.textContent = `${precioTotal} euros`;
    });
    
    let filatotal = tabla.insertRow();
    let c1 = filatotal.insertCell();
    let c2 = filatotal.insertCell();
    let c3 = filatotal.insertCell();
    let c4 = filatotal.insertCell();
    c3.innerHTML = `<strong>Precio Total:</strong>` //tampoco me funcionana lo de colspan
    c4.textContent = `${total} euros`; //Por alguna razon no me funcionaba si lo hacia para cambiar un valor ya existente en la tabla

}


function eliminarCarrito(){
    carrito = [];
    guardarCarrito();
}

window.addEventListener("load", () => {
    if (document.getElementById('tabla-carrito')) {
        mostrarCarritoEnTabla();
        verificar();
    }
});

window.addEventListener("load", () => {
    if(document.getElementById('tabla-carrito2')){
        mostrarCarritoCompra();
    }
});