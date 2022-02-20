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
exports.putSeccion = exports.postSeccion = exports.getSeccionTienda = exports.getSeccionesTienda = void 0;
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
//Retorno de todas las tindas que estan en U-Commerce
const getSeccionesTienda = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const id_search = Number(req.params.id_tienda);
    const secciones = yield prisma.seccion.findMany({
        include: {
            Tienda: false
        },
        where: { tienda_id: id_search },
    });
    resp.json({
        secciones
    });
});
exports.getSeccionesTienda = getSeccionesTienda;
//Retorno de una unica seccion por id
//TODO: Corregir error más adelante - parametros que no existen
const getSeccionTienda = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const id_search_tienda = Number(req.params.id_tienda);
    const id_search_seccion = Number(req.params.id_seccion);
    const seccion = yield prisma.seccion.findMany({
        include: {
            Tienda: false
        },
        where: { tienda_id: id_search_tienda, id_seccion: id_search_seccion },
    });
    if (seccion)
        resp.json({ seccion });
    else
        resp.status(404).json({ message: 'Tienda no encontrada!' });
});
exports.getSeccionTienda = getSeccionTienda;
const postSeccion = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const { nombre, descripcion, tienda_id } = req.body;
    try {
        const result = yield prisma.seccion.create({
            data: {
                nombre,
                descripcion,
                tienda_id
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
exports.postSeccion = postSeccion;
const putSeccion = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const id = Number(req.params.id);
    try {
        const seccion = yield prisma.seccion.findUnique({
            where: { id_seccion: id },
            include: {
                Tienda: false
            }
        });
        if (!seccion) {
            return resp.status(404).json({
                msg: 'No existe una seccion con el id ' + id,
            });
        }
        const result = yield prisma.seccion.update({
            where: { id_seccion: id },
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
exports.putSeccion = putSeccion;
//# sourceMappingURL=seccion.js.map