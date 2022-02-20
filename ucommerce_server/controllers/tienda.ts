import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

//Retorno de todas las tindas que estan en U-Commerce
export const getTiendas = async (req: Request, resp: Response) => {
    const tiendas = await prisma.tienda.findMany({
        include: {
            Venta: false,
            Usuario: true
        }
    })
    resp.json({
        tiendas
    })
}

//Retorno de una unica tienda por id
export const getTienda = async (req: Request, resp: Response) => {

    const id_search = Number(req.params.id);
    const tienda = await prisma.tienda.findUnique({
        where: { id_tienda: id_search },
        include: {
            Seccion: true
        }
    })
    if (tienda)
        resp.json({ tienda })
    else
        resp.status(404).json({ message: 'Tienda no encontrada!' })
}

export const postTienda = async (req: Request, resp: Response) => {

    const { nombre, descripcion, logo, categoria_id, usuario_id } = req.body
    
    try {
        const result = await prisma.tienda.create({
            data: {
                nombre,
                descripcion,
                logo,
                categoria_id,
                usuario_id,
            },
        })
        resp.json(result)
    } catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador!',
        })
    }
}

export const putTienda = async (req: Request, resp: Response) => {

    const id = Number(req.params.id)

    try {

        const tienda = await prisma.tienda.findUnique({
            where: { id_tienda: id },
            include: {
                Usuario: false,
                Venta: false
            }
        })
        if (!tienda) {
            return resp.status(404).json({
                msg: 'No existe una tienda con el id '+id,
            })
        }

        const result = await prisma.tienda.update({
            where: { id_tienda: id },
            data: req.body
        })
        resp.json(result)
    } catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        })
    }
}
