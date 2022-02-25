import express, {Application} from 'express';
import usuarioRutas from '../routes/usuario';
import categoriaRuta from '../routes/categoria';
import metodosPagoRuta from '../routes/metodos_pago';
import clasificacionRuta from '../routes/clasificacion';
import tiendaRuta from '../routes/tienda';
import seccionRuta from '../routes/seccion';
import productoRuta from '../routes/producto';
import ventaRuta from '../routes/venta';
import detalleVentaRuta from '../routes/detalle_venta';
import reporteVentasRuta from '../routes/reporte_tiendas_venden_mas';
import reporteVentasMenosRuta from '../routes/reporte_tiendas_venden_menos';
import cors from 'cors';
class Server{

    private app: Application;
    private port: string;
    private apiPaths = {
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
        reporteVentasMenos: '/api/reporteventasmenos'
    }

    constructor(){
        this.app = express();
        this.port = process.env.PORT || '8000';

        this.middlewares();
        //Definir mis rutas
        this.routes();
    }

    //Función que se ejecuta antes del que las rutas
    middlewares(){

        //CORS
        this.app.use(cors());
        //Lectura del Body
        this.app.use(express.json());
        //Carpeta Publica
        this.app.use(express.static('public'))
    }

    routes(){
        this.app.use(this.apiPaths.usuarios, usuarioRutas);
        this.app.use(this.apiPaths.categorias, categoriaRuta);
        this.app.use(this.apiPaths.metodosPago, metodosPagoRuta);
        this.app.use(this.apiPaths.clasificaciones, clasificacionRuta);
        this.app.use(this.apiPaths.tiendas, tiendaRuta);
        this.app.use(this.apiPaths.secciones, seccionRuta);
        this.app.use(this.apiPaths.productos, productoRuta);
        this.app.use(this.apiPaths.ventas, ventaRuta);
        this.app.use(this.apiPaths.detalleVentas, detalleVentaRuta);
        this.app.use(this.apiPaths.reporteVentas, reporteVentasRuta);
        this.app.use(this.apiPaths.reporteVentasMenos, reporteVentasMenosRuta);
    }

    listen(){
        this.app.listen(this.port, () =>{
            console.log('Servidor corriendo en puerto ' + this.port);
        })
    }

}

export default Server;