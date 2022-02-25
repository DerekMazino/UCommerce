import { Router } from "express";
import {  } from '../controllers/detalle_venta';
import { getReporteTiendas } from "../controllers/reporte_tiendas";

const router = Router();

router.get('/:fecha_inicio/:fecha_fin/:orden', getReporteTiendas);

export default router;