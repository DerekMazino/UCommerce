import { Router } from "express";
import { getProductoSeccion, getProductosSeccion, postProducto, putProducto } from '../controllers/producto';


const router = Router();

router.get('/:id_seccion', getProductosSeccion);
router.get('/:id_seccion/:id_producto', getProductoSeccion);
router.post('/', postProducto);
router.put('/:id', putProducto);

export default router;