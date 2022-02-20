import { Router } from "express";
import { getTiendas, getTienda, postTienda, putTienda } from '../controllers/tienda';


const router = Router();

router.get('/', getTiendas);
router.get('/:id', getTienda);
router.post('/', postTienda);
router.put('/:id', putTienda);


export default router;