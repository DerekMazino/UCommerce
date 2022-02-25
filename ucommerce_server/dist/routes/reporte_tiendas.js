"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const reporte_tiendas_1 = require("../controllers/reporte_tiendas");
const router = (0, express_1.Router)();
router.get('/:fecha_inicio/:fecha_fin/:orden', reporte_tiendas_1.getReporteTiendas);
exports.default = router;
//# sourceMappingURL=reporte_tiendas.js.map