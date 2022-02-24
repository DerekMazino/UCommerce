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
exports.postDetalleVenta = void 0;
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
const postDetalleVenta = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const { venta_id, producto_id, precio_unitario, cantidad } = req.body;
    try {
        const result = yield prisma.detalleVenta.create({
            data: {
                venta_id,
                producto_id,
                precio_unitario,
                cantidad
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
exports.postDetalleVenta = postDetalleVenta;
//# sourceMappingURL=detalle_venta.js.map