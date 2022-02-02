"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const clasificacion_1 = require("../controllers/clasificacion");
const router = (0, express_1.Router)();
router.get('/', clasificacion_1.getClasificaciones);
exports.default = router;
//# sourceMappingURL=clasificacion.js.map