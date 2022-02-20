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

export const putUsuario = async (req: Request, resp: Response) => {

    const id = Number(req.params.id)

    try {

        const usuario = await prisma.usuario.findUnique({
            where: { id_usuario: id },
            include: {
                Tienda: true,
                Venta: true
            }
        })
        if (!usuario) {
            return resp.status(404).json({
                msg: 'No existe un usuario con el id '+id,
            })
        }

        const result = await prisma.usuario.update({
            where: { id_usuario: id },
            data: req.body
        })
        resp.json(result)
    } catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        })
    }
}
//Eliminación Fisica, se recomienda eliminación logica
export const deleteUsuario = async (req: Request, resp: Response) => {

    const id = Number(req.params.id)

    try {

        const usuario = await prisma.usuario.findUnique({
            where: { id_usuario: id },
            include: {
                Tienda: true,
                Venta: true
            }
        })
        if (!usuario) {
            return resp.status(404).json({
                msg: 'No existe un usuario con el id '+id,
            })
        }

        const result = await prisma.usuario.delete({
            where: { id_usuario: id },
        })
        resp.json(result)
    } catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        })
    }
}
