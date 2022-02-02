"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const metodos_pago_1 = require("../controllers/metodos_pago");
const router = (0, express_1.Router)();
router.get('/', metodos_pago_1.getMetodosPago);
exports.default = router;
//# sourceMappingURL=metodos_pago.js.map