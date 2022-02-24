"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const reportes_1 = require("../controllers/reportes");
const router = (0, express_1.Router)();
router.get('/:fecha_inicio/:fecha_fin', reportes_1.getReporteVentas);
exports.default = router;
//# sourceMappingURL=reportes.js.map