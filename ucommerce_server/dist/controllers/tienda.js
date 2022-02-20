"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.putTienda = exports.postTienda = exports.getTienda = exports.getTiendas = void 0;
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
//Retorno de todas las tindas que estan en U-Commerce
const getTiendas = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const tiendas = yield prisma.tienda.findMany({
        include: {
            Venta: false,
            Usuario: true
        }
    });
    resp.json({
        tiendas
    });
});
exports.getTiendas = getTiendas;
//Retorno de una unica tienda por id
const getTienda = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const id_search = Number(req.params.id);
    const tienda = yield prisma.tienda.findUnique({
        where: { id_tienda: id_search },
        include: {
            Seccion: true
        }
    });
    if (tienda)
        resp.json({ tienda });
    else
        resp.status(404).json({ message: 'Tienda no encontrada!' });
});
exports.getTienda = getTienda;
const postTienda = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const { nombre, descripcion, logo, categoria_id, usuario_id } = req.body;
    try {
        const result = yield prisma.tienda.create({
            data: {
                nombre,
                descripcion,
                logo,
                categoria_id,
                usuario_id,
            },
        });
        resp.json(result);
    }
    catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador!',
        });
    }
});
exports.postTienda = postTienda;
const putTienda = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const id = Number(req.params.id);
    try {
        const tienda = yield prisma.tienda.findUnique({
            where: { id_tienda: id },
            include: {
                Usuario: false,
                Venta: false
            }
        });
        if (!tienda) {
            return resp.status(404).json({
                msg: 'No existe una tienda con el id ' + id,
            });
        }
        const result = yield prisma.tienda.update({
            where: { id_tienda: id },
            data: req.body
        });
        resp.json(result);
    }
    catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        });
    }
});
exports.putTienda = putTienda;
//# sourceMappingURL=tienda.js.map