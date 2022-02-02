import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const getMetodosPago = async (req: Request, resp: Response) => {
    const metodosPago = await prisma.metodoPago.findMany({
        include: {
            Venta: false,
        }
    })
    resp.json({
        metodosPago
    })
}