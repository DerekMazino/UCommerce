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
exports.getReporteTiendasMas = void 0;
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
//Retorno de todas las tindas que estan en U-Commerce
const getReporteTiendasMas = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const fecha_inicio = req.params.fecha_inicio;
    const fecha_fin = req.params.fecha_fin;
    const query = 'select nombre, descripcion, sum(total_pagar) as "Ventas totales" from Tienda join Venta on id_tienda=tienda_id where fecha_venta BETWEEN CAST("' + fecha_inicio + '" as DATE) AND CAST("' + fecha_fin + '" as DATE) group by nombre, descripcion order by sum(total_pagar) asc LIMIT 10;';
    const tiendas = yield prisma.$queryRawUnsafe(query);
    //where fecha_venta BETWEEN ${fecha_inicio} AND ${fecha_fin}
    resp.json({
        tiendas
    });
});
exports.getReporteTiendasMas = getReporteTiendasMas;
//# sourceMappingURL=reporte_tiendas_venden_mas.js.map