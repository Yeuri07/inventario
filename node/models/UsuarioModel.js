import db from "../database/db.js";
import { DataTypes } from "sequelize";

const tablaUsuario = db.define('usuarios', {
    id_usuario: {
        type: DataTypes.INTEGER,
        primaryKey: true,  // Define 'id_cliente' como clave primaria
        autoIncrement: true // Opcional, si quieres que se incremente automáticamente
    },
    nombre_usuario: {
        type: DataTypes.STRING,
        allowNull: false // Opcional, si quieres que el campo sea obligatorio
    },
    contrasena: {
        type: DataTypes.STRING,
        allowNull: false // Opcional, si quieres que el campo sea obligatorio
    },
    rol: {
        type: DataTypes.STRING, // Cambiado a STRING, ya que los números de teléfono suelen tratarse como cadenas
        allowNull: false // Opcional, si quieres que el campo sea obligatorio
    }
}, {
    timestamps: false // Desactiva createdAt y updatedAt si no las necesitas
});

export default tablaUsuario;
