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
exports.getReporteProductos = void 0;
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
//Retorno de todas las tindas que estan en U-Commerce
const getReporteProductos = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const fecha_inicio = req.params.fecha_inicio;
    const fecha_fin = req.params.fecha_fin;
    const orden = req.params.orden;
    const query = ' select t.nombre as "Tienda" ,p.nombre as "Producto", p.descripcion as "Descripcion", sum(precio_unitario*cantidad) as "Ventas totales" from Producto as p join DetalleVenta as dt on p.id_producto=dt.producto_id join Venta as v on dt.venta_id=v.id_venta join Tienda as t on v.tienda_id=t.id_tienda where v.fecha_venta BETWEEN CAST("' + fecha_inicio + '" as DATE) AND CAST("' + fecha_fin + '" as DATE) group by t.nombre, p.nombre, p.descripcion order by sum(precio_unitario*cantidad) ' + orden + ' limit 10;';
    const tiendas = yield prisma.$queryRawUnsafe(query);
    //where fecha_venta BETWEEN ${fecha_inicio} AND ${fecha_fin}
    resp.json({
        tiendas
    });
});
exports.getReporteProductos = getReporteProductos;
//# sourceMappingURL=reporte_productos.js.map