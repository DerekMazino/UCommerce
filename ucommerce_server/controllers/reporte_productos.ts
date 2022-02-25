import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

//Retorno de todas las tindas que estan en U-Commerce
export const getReporteProductos = async (req: Request, resp: Response) => {
    const fecha_inicio = req.params.fecha_inicio;
    const fecha_fin = req.params.fecha_fin;
    const orden = req.params.orden;
    const query = ' select t.nombre as "Tienda" ,p.nombre as "Producto", p.descripcion as "Descripcion", sum(precio_unitario*cantidad) as "Ventas totales" from Producto as p join DetalleVenta as dt on p.id_producto=dt.producto_id join Venta as v on dt.venta_id=v.id_venta join Tienda as t on v.tienda_id=t.id_tienda where v.fecha_venta BETWEEN CAST("'+fecha_inicio+'" as DATE) AND CAST("'+fecha_fin+'" as DATE) group by t.nombre, p.nombre, p.descripcion order by sum(precio_unitario*cantidad) '+orden+' limit 10;';
    const tiendas = await prisma.$queryRawUnsafe(query);
            //where fecha_venta BETWEEN ${fecha_inicio} AND ${fecha_fin}
    resp.json({
        tiendas
    })
}

