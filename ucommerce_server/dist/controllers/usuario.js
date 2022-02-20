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
exports.deleteUsuario = exports.putUsuario = exports.postUsuario = exports.getUsuario = exports.getUsuarios = void 0;
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
const getUsuarios = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const usuarios = yield prisma.usuario.findMany({
        include: {
            Tienda: true,
            Venta: true
        }
    });
    resp.json({
        usuarios
    });
});
exports.getUsuarios = getUsuarios;
const getUsuario = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const id_search = Number(req.params.id);
    const usuarioE = yield prisma.usuario.findUnique({
        where: { id_usuario: id_search },
        include: {
            Tienda: true,
            Venta: true
        }
    });
    if (usuarioE)
        resp.json({ usuarioE });
    else
        resp.status(404).json({ message: 'Usuario no encontrado!' });
});
exports.getUsuario = getUsuario;
const postUsuario = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const { nombre, apellido, codigo, email, celular, imagen, user_password } = req.body;
    try {
        const result = yield prisma.usuario.create({
            data: {
                nombre,
                apellido,
                codigo,
                email,
                celular,
                imagen,
                user_password
            },
        });
        resp.json(result);
    }
    catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        });
    }
});
exports.postUsuario = postUsuario;
const putUsuario = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const id = Number(req.params.id);
    try {
        const usuario = yield prisma.usuario.findUnique({
            where: { id_usuario: id },
            include: {
                Tienda: true,
                Venta: true
            }
        });
        if (!usuario) {
            return resp.status(404).json({
                msg: 'No existe un usuario con el id ' + id,
            });
        }
        const result = yield prisma.usuario.update({
            where: { id_usuario: id },
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
exports.putUsuario = putUsuario;
//Eliminación Fisica, se recomienda eliminación logica
const deleteUsuario = (req, resp) => __awaiter(void 0, void 0, void 0, function* () {
    const id = Number(req.params.id);
    try {
        const usuario = yield prisma.usuario.findUnique({
            where: { id_usuario: id },
            include: {
                Tienda: true,
                Venta: true
            }
        });
        if (!usuario) {
            return resp.status(404).json({
                msg: 'No existe un usuario con el id ' + id,
            });
        }
        const result = yield prisma.usuario.delete({
            where: { id_usuario: id },
        });
        resp.json(result);
    }
    catch (error) {
        resp.status(500).json({
            msg: 'Hable con el administrador',
        });
    }
});
exports.deleteUsuario = deleteUsuario;
//# sourceMappingURL=usuario.js.map