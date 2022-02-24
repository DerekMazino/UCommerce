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
exports.deleteVenta = exports.putVenta = exports.postVenta = void 0;
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
const postVenta = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const { id_venta, tienda_id, cliente_id, fecha_venta } = req.body;
    try {
        const result = yield prisma.venta.create({
            data: {
                id_venta,
                tienda_id,
                cliente_id
            },
        });
        resp.json(result);
    }
    catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        });
    }
});
exports.postVenta = postVenta;
const putVenta = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const id = Number(req.params.id);
    try {
        const venta = yield prisma.venta.findUnique({
            where: { id_venta: id },
            include: {
                Tienda: false,
                Usuario: false
            }
        });
        if (!venta) {
            return resp.status(404).json({
                msg: 'No existe una venta con el id ' + id,
            });
        }
        const result = yield prisma.venta.update({
            where: { id_venta: id },
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
exports.putVenta = putVenta;
//Eliminación Fisica, se usará cuando se cancele una venta
const deleteVenta = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const id = Number(req.params.id);
    try {
        const venta = yield prisma.venta.findUnique({
            where: { id_venta: id },
            include: {
                Tienda: false,
                Usuario: false
            }
        });
        if (!venta) {
            return resp.status(404).json({
                msg: 'No existe una venta con el id ' + id,
            });
        }
        const result = yield prisma.venta.delete({
            where: { id_venta: id },
        });
        resp.json(result);
    }
    catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        });
    }
});
exports.deleteVenta = deleteVenta;
//# sourceMappingURL=venta.js.map