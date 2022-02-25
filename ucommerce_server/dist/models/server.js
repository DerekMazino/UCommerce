"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const usuario_1 = __importDefault(require("../routes/usuario"));
const categoria_1 = __importDefault(require("../routes/categoria"));
const metodos_pago_1 = __importDefault(require("../routes/metodos_pago"));
const clasificacion_1 = __importDefault(require("../routes/clasificacion"));
const tienda_1 = __importDefault(require("../routes/tienda"));
const seccion_1 = __importDefault(require("../routes/seccion"));
const producto_1 = __importDefault(require("../routes/producto"));
const venta_1 = __importDefault(require("../routes/venta"));
const detalle_venta_1 = __importDefault(require("../routes/detalle_venta"));
const reporte_tiendas_1 = __importDefault(require("../routes/reporte_tiendas"));
const reporte_productos_1 = __importDefault(require("../routes/reporte_productos"));
const cors_1 = __importDefault(require("cors"));
class Server {
    constructor() {
        this.apiPaths = {
            usuarios: '/api/usuarios',
            categorias: '/api/categorias',
            metodosPago: '/api/metodospago',
            clasificaciones: '/api/clasificaciones',
            tiendas: '/api/tiendas',
            secciones: '/api/secciones',
            productos: '/api/productos',
            ventas: '/api/ventas',
            detalleVentas: '/api/detalleventas',
            reporteVentas: '/api/reporteventas',
            reporteProductos: '/api/reporteproductos'
        };
        this.app = (0, express_1.default)();
        this.port = process.env.PORT || '8000';
        this.middlewares();
        //Definir mis rutas
        this.routes();
    }
    //Función que se ejecuta antes del que las rutas
    middlewares() {
        //CORS
        this.app.use((0, cors_1.default)());
        //Lectura del Body
        this.app.use(express_1.default.json());
        //Carpeta Publica
        this.app.use(express_1.default.static('public'));
    }
    routes() {
        this.app.use(this.apiPaths.usuarios, usuario_1.default);
        this.app.use(this.apiPaths.categorias, categoria_1.default);
        this.app.use(this.apiPaths.metodosPago, metodos_pago_1.default);
        this.app.use(this.apiPaths.clasificaciones, clasificacion_1.default);
        this.app.use(this.apiPaths.tiendas, tienda_1.default);
        this.app.use(this.apiPaths.secciones, seccion_1.default);
        this.app.use(this.apiPaths.productos, producto_1.default);
        this.app.use(this.apiPaths.ventas, venta_1.default);
        this.app.use(this.apiPaths.detalleVentas, detalle_venta_1.default);
        this.app.use(this.apiPaths.reporteVentas, reporte_tiendas_1.default);
        this.app.use(this.apiPaths.reporteProductos, reporte_productos_1.default);
    }
    listen() {
        this.app.listen(this.port, () => {
            console.log('Servidor corriendo en puerto ' + this.port);
        });
    }
}
exports.default = Server;
//# sourceMappingURL=server.js.map