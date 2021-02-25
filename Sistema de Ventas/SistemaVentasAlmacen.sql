create database SistemaVentasIntegrador

use SistemaVentasIntegrador

create table TiposDocumentos(
idTipoDocumento int identity primary key not null,
tipoDocumento varchar(25) not null
)

create table Provincias(
idProvincia int identity primary key not null,
provincia varchar(50) not null
)

create table Localidades(
idLocalidad int identity primary key not null,
localidad varchar(50) not null

)

create table Barrios(
idBarrio int identity primary key not null,
barrio varchar(50) not null

)

create table Generos(
idGenero int identity primary key not null,
genero varchar(25) not null
)


create table Clientes(
idCliente int identity primary key not null,
nombre varchar(50) not null,
apellido varchar(50) not null,
idTipoDocumento int not null,
NroDocumento int not null,
FechaNacimiento date not null,
idGenero int not null,
calle varchar(100) not null,
altura int,
idBarrio int not null,
idLocalidad int not null,
idProvincia int not null,
telefono int not null,
email varchar(100) not null
constraint fkClientes_Barrios foreign key (idBarrio) references Barrios(idBarrio),
constraint fkClientes_Localidades foreign key (idLocalidad) references Localidades(idLocalidad),
constraint fkClientes_Provincias foreign key (idProvincia) references Provincias(idProvincia),
constraint fkClientes_TiposDocumentos foreign key (idTipoDocumento) references TiposDocumentos(idTipoDocumento),
constraint fkClientes_Genero foreign key (idGenero) references Generos(idGenero)
)


create table TiposEmpleados(
idTipoEmpleado int identity primary key not null,
tipoEmpleado varchar(100) not null
)




create table Empleados(
legajoEmpleado int identity primary key not null,
nombre varchar(50) not null,
apellido varchar(50) not null,
idTipoDocumento int not null,
NroDocumento int not null,
FechaNacimiento date not null,
idGenero int not null,
fechaIngreso date not null,
idTipoEmpleado int not null,
calle varchar(100) not null,
altura int not null,
idBarrio int not null,
idLocalidad int not null,
idProvincia int not null,
telefono int not null,
email varchar(100) not null,
usuario varchar(50) not null,
contrasena varchar(20) not null
constraint fkEmpleados_Barrios foreign key (idBarrio) references Barrios(idBarrio),
constraint fkClientes_Localidades foreign key (idLocalidad) references Localidades(idLocalidad),
constraint fkClientes_Provincias foreign key (idProvincia) references Provincias(idProvincia),
constraint fkEmpleados_TiposEmpleados foreign key (idTipoEmpleado) references TiposEmpleados(idTipoEmpleado),
constraint fkEmpleados_TiposDocumentos foreign key (idTipoDocumento) references TiposDocumentos(idTipoDocumento),
constraint fkEmpleados_Genero foreign key (idGenero) references Generos(idGenero),

)


create table Marcas(
idMarca int identity primary key not null,
nombreMarca varchar(50) not null
)

create table Presentaciones(
idPresentacion int identity primary key not null,
nombrePresentacion varchar(50) not null,
descripcion varchar(150) not null
)

create table Categorias(
idCategoria int identity primary key not null,
nombreCategoria varchar(50) not null,
descripcion varchar(150) not null
)



create table Articulos(
idArticulo int identity primary key not null,
nombre varchar(50) not null,
descripcion varchar(150) not null,
idMarca int not null,
idCategoria int not null,
idPresentacion int not null,
precioVenta float not null,
Stock int not null,
constraint fkArticulos_Marcas foreign key (idMarca) references Marcas(idMarca),
constraint fkArticulos_Categorias foreign key (idCategoria) references Categorias(idCategoria),
constraint fkArticulos_Presentaciones foreign key (idPresentacion) references Presentaciones(idPresentacion),
)

create table Lotes(
idLote int identity primary key not null,
fechaVencimiento date not null,
fechaElaboracion date not null,
idArticulo int not null
constraint fkLotes_Articulos foreign key (idArticulo) references Articulos (idArticulo)
)

create table TiposFacturas(
idTipoFactura int identity primary key not null,
tipoFactura varchar(50) not null
)
create table FormasPagos(
idFormaPago int identity primary key not null,
formaPago varchar(50) not null
)


create table Facturas(
numeroFactura int identity primary key not null,
fecha date not null,
idCliente int not null,
legajoEmpleado int not null,
idTipoFactura int,
idFormaPago int,
iva float not null,
recargo float
constraint fkFacturas_Clientes foreign key (idCliente) references Clientes(idCliente),
constraint fkFacturas_Empleados foreign key (legajoEmpleado) references Empleados (legajoEmpleado),
constraint fkFacturas_TiposFacturas foreign key (idTipoFactura) references TiposFacturas(idTipoFactura),
constraint fkFacturas_FormasPagos foreign key (idFormaPago) references FormasPagos(idFormaPago)
)


create table DetallesFacturas(
idDetalleFactura int identity primary key not null,
numeroFactura int not null,
idArticulo int not null,
precioVenta float not null,
cantidad int not null,
descuento float 
constraint fkDetallesFacturas_Facturas foreign key (numeroFactura) references Facturas(numeroFactura),
constraint fkDetallesFacturas_Articulos foreign key (idArticulo) references Articulos(idArticulo)
)