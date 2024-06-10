import tablaClient from "../models/ClientModel.js"

//Mostrar todos los registros

export const getAllClient = async (req, res) =>{
    try {
        const clients = await tablaClient.findAll()
        res.json(clients)
    } catch (error) {
        res.json({message: error.message})
    }
}

// Mostrar un registro
export const getClient = async (req, res) => {
    try {
        const client = await tablaClient.findByPk(req.params.id_cliente);
        if (client) {
            res.json(client);
        } else {
            res.status(404).json({ message: "Cliente no encontrado" });
        }
    } catch (error) {
        res.json({ message: error.message });
    }
};