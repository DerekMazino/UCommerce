import { Router } from "express";
import { getClasificaciones } from "../controllers/clasificacion";


const router = Router();

router.get('/', getClasificaciones);

export default router;