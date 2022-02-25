import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

//Retorno de todas las tindas que estan en U-Commerce
export const getReporteTiendasMas = async (req: Request, resp: Response) => {
    const fecha_inicio = req.params.fecha_inicio;
    const fecha_fin = req.params.fecha_fin;
    const tiendas = await prisma.venta.groupBy({
        by: ['tienda_id'],
        where: {
            fecha_venta: {
                //Que traiga registros con fechas mayores o iguales (gt es solo mayor)
                gte: new Date(fecha_inicio),
                //Que traiga registros con fechas mejor o iguales (lt es solo mayor)
                lte: new Date(fecha_fin),
            }
        },
        _sum: {
            total_pagar: true
        },
        orderBy: {
            _sum: {
                total_pagar: 'desc'
            }
        },
        take: 10
    })
    resp.json({
        tiendas
    })
}

