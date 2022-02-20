"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const tienda_1 = require("../controllers/tienda");
const router = (0, express_1.Router)();
router.get('/', tienda_1.getTiendas);
router.get('/:id', tienda_1.getTienda);
router.post('/', tienda_1.postTienda);
router.put('/:id', tienda_1.putTienda);
exports.default = router;
//# sourceMappingURL=tienda.js.map