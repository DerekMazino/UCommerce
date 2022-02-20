import { Router } from "express";
import { getSeccionesTienda, getSeccionTienda, postSeccion, putSeccion } from '../controllers/seccion';


const router = Router();

router.get('/:id_tienda', getSeccionesTienda);
router.get('/:id_tienda/:id_seccion', getSeccionTienda);
router.post('/', postSeccion);
router.put('/:id', putSeccion);


export default router;