import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const getUsuarios = async (req: Request, resp: Response) => {
    const usuarios = await prisma.usuario.findMany({
        include: {
            Tienda: true,
            Venta: true
        }
    })
    resp.json({
        usuarios
    })
}

export const getUsuario = async (req: Request, resp: Response) => {

    const id_search = Number(req.params.id);
    const usuarioE = await prisma.usuario.findUnique({
        where: { id_usuario: id_search },
        include: {
            Tienda: true,
            Venta: true
        }
    })
    if (usuarioE)
        resp.json({ usuarioE })
    else
        resp.status(404).json({ message: 'Usuario no encontrado!' })
}


export const postUsuario = async (req: Request, resp: Response) => {

    const { nombre, apellido, codigo, email, celular, imagen, user_password } = req.body

    try {
        const result = await prisma.usuario.create({
            data: {
                nombre,
                apellido,
                codigo,
                email,
                celular,
                imagen,
                user_password
            },
        })
        resp.json(result)
    } catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        })
    }
}

export const putUsuario = (req: Request, resp: Response) => {

    const { id } = req.params;
    const { body } = req;

    resp.json({
        msg: 'putUsuario',
        body
    })
}

export const deleteUsuario = (req: Request, resp: Response) => {

    const { id } = req.params;

    resp.json({
        msg: 'deleteUsuario',
        id
    })
}
