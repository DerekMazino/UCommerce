import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const getCategorias = async (req: Request, resp: Response) => {
    const categorias = await prisma.categoria.findMany({
        include: {
            Tienda: true,
        }
    })
    resp.json({
        categorias
    })
}