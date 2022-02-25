import { Router } from "express";
import {  } from '../controllers/detalle_venta';
import { getReporteProductos } from "../controllers/reporte_productos";

const router = Router();

router.get('/:fecha_inicio/:fecha_fin/:orden', getReporteProductos);

export default router;