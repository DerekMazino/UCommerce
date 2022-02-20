"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const producto_1 = require("../controllers/producto");
const router = (0, express_1.Router)();
router.get('/:id_seccion', producto_1.getProductosSeccion);
router.get('/:id_seccion/:id_producto', producto_1.getProductoSeccion);
router.post('/', producto_1.postProducto);
router.put('/:id', producto_1.putProducto);
exports.default = router;
//# sourceMappingURL=producto.js.map