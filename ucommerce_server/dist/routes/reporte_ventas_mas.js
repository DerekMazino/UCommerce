"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const reporte_ventas_mas_1 = require("../controllers/reporte_ventas_mas");
const router = (0, express_1.Router)();
router.get('/:fecha_inicio/:fecha_fin', reporte_ventas_mas_1.getReporteVentas);
exports.default = router;
//# sourceMappingURL=reporte_ventas_mas.js.map