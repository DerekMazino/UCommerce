"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deleteUsuario = exports.putUsuario = exports.postUsuario = exports.getUsuario = exports.getUsuarios = void 0;
const getUsuarios = (req, resp) => {
    resp.json({
        msg: 'getUsuarios'
    });
};
exports.getUsuarios = getUsuarios;
const getUsuario = (req, resp) => {
    const { id } = req.params;
    resp.json({
        msg: 'getUsuario',
        id
    });
};
exports.getUsuario = getUsuario;
const postUsuario = (req, resp) => {
    const { body } = req;
    resp.json({
        msg: 'postUsuario',
        body
    });
};
exports.postUsuario = postUsuario;
const putUsuario = (req, resp) => {
    const { id } = req.params;
    const { body } = req;
    resp.json({
        msg: 'putUsuario',
        body
    });
};
exports.putUsuario = putUsuario;
const deleteUsuario = (req, resp) => {
    const { id } = req.params;
    resp.json({
        msg: 'deleteUsuario',
        id
    });
};
exports.deleteUsuario = deleteUsuario;
//# sourceMappingURL=usuario.js.map