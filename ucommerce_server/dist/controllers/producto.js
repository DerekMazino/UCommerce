"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.putProducto = exports.postProducto = exports.getProductoSeccion = exports.getProductosSeccion = void 0;
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
//Retorno de todas las tindas que estan en U-Commerce
const getProductosSeccion = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const id_search = Number(req.params.id_seccion);
    const productos = yield prisma.producto.findMany({
        include: {
            Seccion: false
        },
        where: { seccion_id: id_search },
    });
    resp.json({
        productos
    });
});
exports.getProductosSeccion = getProductosSeccion;
//Retorno de una unico producto por id
//TODO: Corregir error más adelante - parametros que no existen
const getProductoSeccion = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const id_search_seccion = Number(req.params.id_seccion);
    const id_search_producto = Number(req.params.id_producto);
    const producto = yield prisma.producto.findMany({
        include: {
            Seccion: false
        },
        where: { seccion_id: id_search_seccion, id_producto: id_search_producto },
    });
    if (producto)
        resp.json({ producto });
    else
        resp.status(404).json({ message: 'Producto no encontrado!' });
});
exports.getProductoSeccion = getProductoSeccion;
const postProducto = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const { nombre, descripcion, precio, imagen, seccion_id, clasificacion_id } = req.body;
    try {
        const result = yield prisma.producto.create({
            data: {
                nombre,
                descripcion,
                precio,
                imagen,
                seccion_id,
                clasificacion_id,
            },
        });
        resp.json(result);
    }
    catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador!',
        });
    }
});
exports.postProducto = postProducto;
const putProducto = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const id = Number(req.params.id);
    try {
        const producto = yield prisma.producto.findUnique({
            where: { id_producto: id },
            include: {
                Seccion: false,
                Clasificacion: false
            }
        });
        if (!producto) {
            return resp.status(404).json({
                msg: 'No existe un producto con el id ' + id,
            });
        }
        const result = yield prisma.producto.update({
            where: { id_producto: id },
            data: req.body
        });
        resp.json(result);
    }
    catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        });
    }
});
exports.putProducto = putProducto;
//# sourceMappingURL=producto.js.map