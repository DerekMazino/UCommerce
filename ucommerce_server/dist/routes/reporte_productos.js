"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const reporte_productos_1 = require("../controllers/reporte_productos");
const router = (0, express_1.Router)();
router.get('/:fecha_inicio/:fecha_fin/:orden', reporte_productos_1.getReporteProductos);
exports.default = router;
//# sourceMappingURL=reporte_productos.js.map