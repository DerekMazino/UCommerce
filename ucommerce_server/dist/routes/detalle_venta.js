"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const detalle_venta_1 = require("../controllers/detalle_venta");
const router = (0, express_1.Router)();
router.post('/', detalle_venta_1.postDetalleVenta);
exports.default = router;
//# sourceMappingURL=detalle_venta.js.map