"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const reporte_tiendas_venden_menos_1 = require("../controllers/reporte_tiendas_venden_menos");
const router = (0, express_1.Router)();
router.get('/:fecha_inicio/:fecha_fin', reporte_tiendas_venden_menos_1.getReporteVentas);
exports.default = router;
//# sourceMappingURL=reporte_tiendas_venden_menos.js.map