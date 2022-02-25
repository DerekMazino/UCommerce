import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

//Retorno de todas las tindas que estan en U-Commerce
export const getReporteTiendas = async (req: Request, resp: Response) => {
    const fecha_inicio = req.params.fecha_inicio;
    const fecha_fin = req.params.fecha_fin;
    const orden = req.params.orden;
    const query = 'select nombre, descripcion, sum(total_pagar) as "Ventas totales" from Tienda join Venta on id_tienda=tienda_id where fecha_venta BETWEEN CAST("'+fecha_inicio+'" as DATE) AND CAST("'+fecha_fin+'" as DATE) group by nombre, descripcion order by sum(total_pagar) '+orden+' LIMIT 10;';
    const tiendas = await prisma.$queryRawUnsafe(query);
            //where fecha_venta BETWEEN ${fecha_inicio} AND ${fecha_fin}
    resp.json({
        tiendas
    })
}

