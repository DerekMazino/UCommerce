"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const reporte_tiendas_venden_mas_1 = require("../controllers/reporte_tiendas_venden_mas");
const router = (0, express_1.Router)();
router.get('/:fecha_inicio/:fecha_fin', reporte_tiendas_venden_mas_1.getReporteTiendasMas);
exports.default = router;
//# sourceMappingURL=reporte_tiendas_venden_mas.js.map