import express, {Application} from 'express';
import usuarioRutas from '../routes/usuario';
import cors from 'cors';
class Server{

    private app: Application;
    private port: string;
    private apiPaths = {
        usuarios: '/api/usuarios'
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
        this.app.use(this.apiPaths.usuarios, usuarioRutas)
    }

    listen(){
        this.app.listen(this.port, () =>{
            console.log('Servidor corriendo en puerto ' + this.port);
        })
    }

}

export default Server;