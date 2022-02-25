use U_CommerceBD;
insert into Producto (nombre, descripcion, precio, imagen, seccion_id, clasificacion_id) values ("Galletas Rojas", "Galletas Red Velvet con chispas de chocolate", 1500, "https://www.fabricadeantojos.com/wp-content/uploads/2018/09/201805-24-Galletas-Red-Velvet-02.jpg",1, 1);
select * from Producto;
ALTER TABLE Producto ADD imagen VARCHAR(500) AFTER precio;
ALTER TABLE Producto MODIFY COLUMN nombre VARCHAR(50);
ALTER TABLE Seccion MODIFY COLUMN nombre VARCHAR(50);
select * from Clasificacion;
ALTER TABLE Venta MODIFY COLUMN fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ;
insert into Venta (tienda_id, cliente_id) values (1, 5);
select * from Producto;
select * from Venta;
select * from DetalleVenta;
select nombre, descripcion, sum(total_pagar) as 'Ventas totales' from Tienda
 join Venta on id_tienda=tienda_id 
 where fecha_venta BETWEEN CAST("2022-02-22" as DATE) AND CAST("2022-02-25" as DATE) 
 group by nombre, descripcion
 order by sum(total_pagar) asc limit 10;
 
select t.nombre as "Tienda" ,p.nombre as "Producto", p.descripcion as "Descripcion", sum(precio_unitario*cantidad) as "Ventas totales"
 from Producto as p join DetalleVenta as dt 
 on p.id_producto=dt.producto_id
 join Venta as v on dt.venta_id=v.id_venta
 join Tienda as t on v.tienda_id=t.id_tienda
 where v.fecha_venta BETWEEN CAST("2022-02-22" as DATE) AND CAST("2022-02-25" as DATE) 
 group by t.nombre, p.nombre, p.descripcion
 order by sum(precio_unitario*cantidad) desc limit 10;
 
 select t.nombre as "Tienda" ,p.nombre as "Producto", p.descripcion as "Descripcion", sum(precio_unitario*cantidad) as "Ventas totales" from Producto as p join DetalleVenta as dt on p.id_producto=dt.producto_id join Venta as v on dt.venta_id=v.id_venta join Tienda as t on v.tienda_id=t.id_tienda where v.fecha_venta BETWEEN CAST("2022-02-22" as DATE) AND CAST("2022-02-25" as DATE) group by t.nombre, p.nombre, p.descripcion order by sum(precio_unitario*cantidad) desc limit 10;