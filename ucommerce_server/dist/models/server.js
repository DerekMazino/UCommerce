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
const cors_1 = __importDefault(require("cors"));
class Server {
    constructor() {
        this.apiPaths = {
            usuarios: '/api/usuarios',
            categorias: '/api/categorias',
            metodosPago: '/api/metodospago',
            clasificaciones: '/api/clasificaciones',
            tiendas: '/api/tiendas',
            secciones: '/api/secciones'
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
    }
    listen() {
        this.app.listen(this.port, () => {
            console.log('Servidor corriendo en puerto ' + this.port);
        });
    }
}
exports.default = Server;
//# sourceMappingURL=server.js.map