import { Router } from "express";
import {  } from '../controllers/detalle_venta';
import { getReporteTiendasMas } from "../controllers/reporte_tiendas_venden_mas";

const router = Router();

router.get('/:fecha_inicio/:fecha_fin', getReporteTiendasMas);

export default router;