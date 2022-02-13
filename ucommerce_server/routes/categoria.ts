import { Router } from "express";
import { getCategorias } from '../controllers/categoria';

const router = Router();

router.get('/', getCategorias);

export default router;