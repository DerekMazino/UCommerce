import { Router } from "express";
import { deleteVenta, postVenta, putVenta } from '../controllers/venta';

const router = Router();

router.post('/', postVenta);
router.put('/:id', putVenta);
router.delete('/:id', deleteVenta);

export default router;