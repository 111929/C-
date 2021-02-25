--INSERT CLIENTES
alter proc sp_InsertarClientes
@nombre varchar(50),
@apellido varchar(50),
@idTipoDoc int,
@numeroDoc int,
@fechaNac date,
@idGenero int,
@calle varchar(100),
@altura int,
@idBarrio int,
@telefono bigint,
@email varchar(100),
@idlocalidad int,
@idprovincia int
as
if exists (select*from Clientes where NroDocumento=@numeroDoc)
begin
print('Ya existe un cliente con numero de documento: '+ convert(varchar(50),@numeroDoc))
return
end
begin
insert into Clientes values (@nombre,@apellido,@idTipoDoc,@numeroDoc,@fechaNac,@idGenero,@calle,@altura,@idBarrio,@telefono,@email,@idlocalidad,@idprovincia)
end

exec sp_InsertarClientes 'Ricardo','Matta',1,11253698,'02/05/1988',1,'bv.Illia',347,1,351896354,'ricky.123@gmail.com'
select*from Clientes
delete clientes where idCliente = 34



--Modificar Clientes
alter proc sp_ModificarClientes
@nombre varchar(50),
@apellido varchar(50),
@idTipoDoc int,
@fechaNac date,
@idGenerto int,
@calle varchar(100),
@altura int,
@idBarrio int,
@telefono bigint,
@email varchar(100),
@idlocalidad int,
@idprovincia int,
@numeroDoc int
as
update Clientes set nombre=@nombre,
apellido=@apellido,
idTipoDocumento=@idTipoDoc,
FechaNacimiento=@fechaNac,
idGenero=@idGenerto,
calle=@calle,
altura=@altura,
idBarrio=@idBarrio,
telefono=@telefono,
email=@email,
localidad=@idlocalidad,
provincia=@idprovincia
where NroDocumento=@numeroDoc

exec sp_ModificarClientes 'Martin','Jimenez',1,'12/10/1983',1,'Rondeau',455,1,351292931,'tinchoJimenez@gmail.com',30456201


--ELIMINAR CLIENTE
create proc sp_EliminarClientes
@numeroDocu int
as
delete Clientes where NroDocumento=@numeroDocu

exec sp_EliminarClientes 11253698

--MOSTRAR CLIENTES
alter proc sp_MostrarClientes
as
select c.nombre+' '+c.apellido Cliente, td.tipoDocumento 'Tipo de documento',
c.NroDocumento Documento, FechaNacimiento 'Fecha de Nacimiento', g.genero Genero,
c.calle+' '+ str(c.altura) Direccion, b.barrio Barrio,c.telefono Telefono,l.localidad Localidad,
p.provincia Provincia, c.email Email 
from TiposDocumentos td join clientes c
on td.idTipoDocumento=c.idTipoDocumento join Generos g
on g.idGenero=c.idGenero join Barrios b
on b.idBarrio=c.idBarrio join Localidades l
on l.idLocalidad=c.localidad join Provincias p
on p.idProvincia=c.provincia


exec sp_MostrarClientes



--INSERTAR EMPLEADO
alter proc sp_InsertarEmpleado
@nombre varchar(50),
@apellido varchar(50),
@idTipoDoc int,
@numeroDoc int,
@fechaNac date,
@idGenero int,
@fechaIngreso date,
@idTipoEmpleado int,
@calle varchar(100),
@altura int,
@idBarrio int,
@telefono bigint,
@email varchar(100),
@usuario varchar(50),
@contrasena varchar(12),
@localidad int,
@provincia int
as
if exists (select*from Empleados where NroDocumento=@numeroDoc)
begin
print('Ya existe un empleado con numero de documento: '+ convert(varchar(50),@numeroDoc))
return
end
begin
insert into Empleados values (@nombre,@apellido,@idTipoDoc,@numeroDoc,@fechaNac,@idGenero,@fechaIngreso,@idTipoEmpleado,@calle,@altura,@idBarrio,@telefono,@email,@usuario,@contrasena,@localidad,@provincia)
end

exec sp_InsertarEmpleado 'Laura','Garcia',1,34569874,'12/04/1989',2,'03/03/2015',3,'av Siempre viva',123,5,351478965,'laugar@gmail.com','lau','123abc'



select* from Empleados


--MODIFICAR EMPLEADO
alter proc sp_ModificarEmpleado
@nombre varchar(50),
@apellido varchar(50),
@idTipoDoc int,
@fechaNac date,
@idGenero int,
@fechaIngreso date,
@idTipoEmpleado int,
@calle varchar(100),
@altura int,
@idBarrio int,
@telefono bigint,
@email varchar(100),
@localidad int,
@provincia int,
@usuario varchar(50),
@contrasena varchar(12),
@numeroDoc int
as
update Empleados set nombre=@nombre,
apellido=@apellido,
idTipoDocumento=@idTipoDoc,
FechaNacimiento=@fechaNac,
idGenero=@idGenero,
fechaIngreso=@fechaIngreso,
idTipoEmpleado=@idTipoEmpleado,
calle=@calle,
altura=@altura ,
idBarrio=@idBarrio,
telefono=@telefono,
email=@email,
localidad=@localidad,
provincia=@provincia,
usuarios=@usuario,
contrasena=@contrasena
where NroDocumento=@numeroDoc

exec sp_ModificarEmpleado 'Laura','Garcia',1,'12/04/1989',2,'03/03/2015',3,'av Siempre viva',123,5,351478965,'laugar@gmail.com','lau','123abcde',34569874

--ELIMINAR EMPLEADO
create proc sp_EliminarEmpleado
@numeroDoc int
as
delete Empleados where @numeroDoc=NroDocumento

exec sp_EliminarEmpleado 34569874

--MOSTRAR EMPLEADOS
create proc sp_MostrarEmpleado
as
select e.nombre+' '+e.apellido Empleado, td.tipoDocumento 'Tipo de documento',
e.NroDocumento Documento, FechaNacimiento 'Fecha de Nacimiento', G.genero Genero, e.fechaIngreso 'Fecha de Ingreso',
te.tipoEmpleado 'Tipo de Empleado',e.calle+' '+ str(e.altura) Direccion, b.barrio Barrio,e.telefono Telefono,
e.email Email, e.usuarios Usuario, e.contrasena Contraseña
from TiposDocumentos td join Empleados e
on td.idTipoDocumento=e.idTipoDocumento join Generos g
on g.idGenero=e.idGenero join Barrios b
on b.idBarrio=e.idBarrio join TiposEmpleados te
on te.idTipoEmpleado=e.idTipoEmpleado 

select*from Empleados


--insertar articulos
alter proc sp_insertarArticulos
@nombre varchar (50),
@descripcion varchar (50),
@idmarca int,
@idcategoria int,
@idpresentacion int,
@precioVenta float,
@stock int
as
if exists(select *from Articulos
where nombre=@nombre
and idMarca=@idmarca)
begin 
print ('ya existe el articulo ')
return
end
begin 
insert into Articulos values
(@nombre ,@descripcion ,@idmarca ,@idcategoria,@idpresentacion,@precioVenta,@stock)
end
exec sp_insertarArticulos 'Pan Salvado','Pan de Mesa',2,1,4,100,20


select * from Articulos

---modificar articulos
alter proc sp_modificarArticulos
@nombre varchar (50),
@descripcion varchar (50),
@idmarca int,
@idcategoria int,
@idpresentacion int,
@precioVenta float,
@stock int,
@id_Articulo int
as
update Articulos set           nombre=@nombre,
		               descripcion=@descripcion,
			       idMarca=@idmarca,
			       idCategoria=idCategoria,
			       idPresentacion=@idpresentacion,
			       precioVenta=@precioVenta,
			       Stock=@stock
where idArticulo=@id_Articulo

--delete articulos
create proc sp_borrarArticulos
@id_articulo int
as 
delete Articulos where idArticulo=@id_articulo

exec sp_borrarArticulos 45

--MOSTRAR ARTICULOS
create proc sp_MostrarArticulos
as
SELECT nombre Articulo, a.descripcion Descripcion, m.nombreMarca Marca, c.nombreCategoria Categoria, p.descripcion Presentacion,
precioVenta Precio, stock Stock
from Marcas m join Articulos a
on a.idMarca=m.idMarca join Categorias c
on c.idCategoria=a.idCategoria join Presentaciones p
on p.idPresentacion=a.idPresentacion

select*from facturas
order by fecha desc



--PROCEDMIENTO LOGIN

create proc sp_Login
@usuario varchar(20),
@contrasena varchar(12)
as
select legajoEmpleado, nombre, apellido, t.tipoEmpleado
from Empleados e join TiposEmpleados t
on e.idTipoEmpleado=t.idTipoEmpleado
where usuarios = @usuario and contrasena=@contrasena

select*from Empleados

update TiposEmpleados set tipoEmpleado='ADMINISTRADOR' where idTipoEmpleado=1

--PROCEDIMIENTO GRAFICO

create proc sp_GraficoVentas
as
select year(fecha)Año, count(*)CantidadVentas
from facturas
group by year(fecha)
order by 1 asc

select*from clientes	








select f.fecha, f.numeroFactura, idDetalleFactura
from facturas f join DetallesFacturas d
on f.numeroFactura=d.numeroFactura
order by 1 desc

