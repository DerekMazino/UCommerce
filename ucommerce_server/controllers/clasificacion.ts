import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const getClasificaciones = async (req: Request, resp: Response) => {
    const clasificaciones = await prisma.clasificacion.findMany({
        include: {
            Producto: true,
        }
    })
    resp.json({
        clasificaciones
    })
}