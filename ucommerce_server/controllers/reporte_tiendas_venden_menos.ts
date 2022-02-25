import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

//Retorno de todas las tindas que estan en U-Commerce
export const getReporteVentas = async (req: Request, resp: Response) => {
    const fecha_inicio = req.params.fecha_inicio;
    const fecha_fin = req.params.fecha_fin;
    const orderby = req.params.orderby;
    const ventas = await prisma.venta.findMany({
        include: {
            DetalleVenta: false
        },
        where: {
            fecha_venta: {
                //Que traiga registros con fechas mayores o iguales (gt es solo mayor)
                gte: new Date(fecha_inicio),
                //Que traiga registros con fechas mejor o iguales (lt es solo mayor)
                lte: new Date(fecha_fin),
            }
        },
        orderBy: {
            total_pagar: 'asc'
        },
        take: 10
    })
    resp.json({
        ventas
    })
}

