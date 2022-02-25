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
exports.getReporteMas = void 0;
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
//Retorno de todas las tindas que estan en U-Commerce
const getReporteMas = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const fecha_inicio = req.params.fecha_inicio;
    const fecha_fin = req.params.fecha_fin;
    const tiendas = yield prisma.venta.groupBy({
        by: ['tienda_id'],
        where: {
            fecha_venta: {
                //Que traiga registros con fechas mayores o iguales (gt es solo mayor)
                gte: new Date(fecha_inicio),
                //Que traiga registros con fechas mejor o iguales (lt es solo mayor)
                lte: new Date(fecha_fin),
            }
        },
        _sum: {
            total_pagar: true
        },
        orderBy: {
            _sum: {
                total_pagar: 'desc'
            }
        },
        take: 10
    });
    resp.json({
        tiendas
    });
});
exports.getReporteMas = getReporteMas;
//# sourceMappingURL=reporte_productos_venden_mas.js.map