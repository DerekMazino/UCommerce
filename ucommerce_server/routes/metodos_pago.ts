import { Router } from "express";
import { getMetodosPago } from "../controllers/metodos_pago";

const router = Router();

router.get('/', getMetodosPago);

export default router;