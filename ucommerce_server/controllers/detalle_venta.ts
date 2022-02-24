import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();


export const postDetalleVenta = async (req: Request, resp: Response) => {

    const { venta_id, producto_id, precio_unitario, cantidad } = req.body

    try {
        const result = await prisma.detalleVenta.create({
            data: {
                venta_id,
                producto_id,
                precio_unitario,
                cantidad
            },
        })
        resp.json(result)
    } catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        })
    }
}