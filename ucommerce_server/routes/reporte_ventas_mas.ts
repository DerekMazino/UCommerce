import { Router } from "express";
import {  } from '../controllers/detalle_venta';
import { getReporteVentas } from "../controllers/reporte_ventas_mas";

const router = Router();

router.get('/:fecha_inicio/:fecha_fin', getReporteVentas);

export default router;