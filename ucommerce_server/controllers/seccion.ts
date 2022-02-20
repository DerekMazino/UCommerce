import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

//Retorno de todas las tindas que estan en U-Commerce
export const getSeccionesTienda = async (req: Request, resp: Response) => {
    const id_search = Number(req.params.id_tienda);
    const secciones = await prisma.seccion.findMany({
        include: {
            Tienda: false
        },
        where: { tienda_id: id_search },
    })
    resp.json({
        secciones
    })
}

//Retorno de una unica seccion por id
//TODO: Corregir error más adelante - parametros que no existen
export const getSeccionTienda = async (req: Request, resp: Response) => {
    const id_search_tienda = Number(req.params.id_tienda);
    const id_search_seccion = Number(req.params.id_seccion);
    const seccion = await prisma.seccion.findMany({
        include: {
            Tienda: false
        },
        where: { tienda_id: id_search_tienda, id_seccion: id_search_seccion },
    })
    if (seccion)
        resp.json({ seccion })
    else
        resp.status(404).json({ message: 'Tienda no encontrada!' })
}

export const postSeccion = async (req: Request, resp: Response) => {

    const { nombre, descripcion, tienda_id } = req.body
    
    try {
        const result = await prisma.seccion.create({
            data: {
                nombre,
                descripcion,
                tienda_id
            },
        })
        resp.json(result)
    } catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador!',
        })
    }
}

export const putSeccion = async (req: Request, resp: Response) => {

    const id = Number(req.params.id)

    try {

        const seccion = await prisma.seccion.findUnique({
            where: { id_seccion: id },
            include: {
                Tienda: false
            }
        })
        if (!seccion) {
            return resp.status(404).json({
                msg: 'No existe una seccion con el id '+id,
            })
        }

        const result = await prisma.seccion.update({
            where: { id_seccion: id },
            data: req.body
        })
        resp.json(result)
    } catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        })
    }
}
