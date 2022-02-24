import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();


export const postVenta = async (req: Request, resp: Response) => {

    const { id_venta, tienda_id, cliente_id, fecha_venta } = req.body

    try {
        const result = await prisma.venta.create({
            data: {
                id_venta,
                tienda_id,
                cliente_id
            },
        })
        resp.json(result)
    } catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        })
    }
}

export const putVenta = async (req: Request, resp: Response) => {

    const id = Number(req.params.id)

    try {

        const venta = await prisma.venta.findUnique({
            where: { id_venta: id },
            include: {
                Tienda: false,
                Usuario: false
            }
        })
        if (!venta) {
            return resp.status(404).json({
                msg: 'No existe una venta con el id '+id,
            })
        }

        const result = await prisma.venta.update({
            where: { id_venta: id },
            data: req.body
        })
        resp.json(result)
    } catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        })
    }
}
//Eliminación Fisica, se usará cuando se cancele una venta
export const deleteVenta = async (req: Request, resp: Response) => {

    const id = Number(req.params.id)

    try {

        const venta = await prisma.venta.findUnique({
            where: { id_venta: id },
            include: {
                Tienda: false,
                Usuario: false
            }
        })
        if (!venta) {
            return resp.status(404).json({
                msg: 'No existe una venta con el id '+id,
            })
        }

        const result = await prisma.venta.delete({
            where: { id_venta: id },
        })
        resp.json(result)
    } catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        })
    }
}
