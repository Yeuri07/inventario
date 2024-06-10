import db from "../database/db.js";
import { DataTypes } from "sequelize";

const tablaClient = db.define('clientes', {
    id_cliente: {
        type: DataTypes.INTEGER,
        primaryKey: true,  // Define 'id_cliente' como clave primaria
        autoIncrement: true // Opcional, si quieres que se incremente automáticamente
    },
    nombre: {
        type: DataTypes.STRING,
        allowNull: false // Opcional, si quieres que el campo sea obligatorio
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false // Opcional, si quieres que el campo sea obligatorio
    },
    telefono: {
        type: DataTypes.STRING, // Cambiado a STRING, ya que los números de teléfono suelen tratarse como cadenas
        allowNull: false // Opcional, si quieres que el campo sea obligatorio
    }
}, {
    timestamps: false // Desactiva createdAt y updatedAt si no las necesitas
});

export default tablaClient;
