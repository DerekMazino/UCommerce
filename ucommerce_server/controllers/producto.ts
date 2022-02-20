import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

//Retorno de todas las tindas que estan en U-Commerce
export const getProductosSeccion = async (req: Request, resp: Response) => {
    const id_search = Number(req.params.id_seccion);
    const productos = await prisma.producto.findMany({
        include: {
            Seccion: false
        },
        where: { seccion_id: id_search },
    })
    resp.json({
        productos
    })
}

//Retorno de una unico producto por id
//TODO: Corregir error más adelante - parametros que no existen
export const getProductoSeccion = async (req: Request, resp: Response) => {
    const id_search_seccion = Number(req.params.id_seccion);
    const id_search_producto = Number(req.params.id_producto);
    const producto = await prisma.producto.findMany({
        include: {
            Seccion: false
        },
        where: { seccion_id: id_search_seccion, id_producto: id_search_producto },
    })
    if (producto)
        resp.json({ producto })
    else
        resp.status(404).json({ message: 'Producto no encontrado!' })
}

export const postProducto = async (req: Request, resp: Response) => {

    const { nombre, descripcion, precio, imagen, seccion_id, clasificacion_id } = req.body
    
    try {
        const result = await prisma.producto.create({
            data: {
                nombre,
                descripcion,
                precio,
                imagen,
                seccion_id,
                clasificacion_id,
            },
        })
        resp.json(result)
    } catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador!',
        })
    }
}

export const putProducto = async (req: Request, resp: Response) => {

    const id = Number(req.params.id)

    try {

        const producto = await prisma.producto.findUnique({
            where: { id_producto: id },
            include: {
                Seccion: false,
                Clasificacion: false
            }
        })
        if (!producto) {
            return resp.status(404).json({
                msg: 'No existe un producto con el id '+id,
            })
        }

        const result = await prisma.producto.update({
            where: { id_producto: id },
            data: req.body
        })
        resp.json(result)
    } catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        })
    }
}