import { Router } from "express";
import {  } from '../controllers/detalle_venta';
import { getReporteTiendasMenos } from "../controllers/reporte_tiendas_venden_menos";

const router = Router();

router.get('/:fecha_inicio/:fecha_fin', getReporteTiendasMenos);

export default router;