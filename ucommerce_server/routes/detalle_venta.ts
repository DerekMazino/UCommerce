import { Router } from "express";
import { postDetalleVenta } from '../controllers/detalle_venta';

const router = Router();

router.post('/', postDetalleVenta);

export default router;