"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const seccion_1 = require("../controllers/seccion");
const router = (0, express_1.Router)();
router.get('/:id_tienda', seccion_1.getSeccionesTienda);
router.get('/:id_tienda/:id_seccion', seccion_1.getSeccionTienda);
router.post('/', seccion_1.postSeccion);
router.put('/:id', seccion_1.putSeccion);
exports.default = router;
//# sourceMappingURL=seccion.js.map