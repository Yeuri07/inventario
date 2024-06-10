import { Sequelize } from "sequelize";

const db = new Sequelize('inventario', 'root', '1234567',{
    host:'localhost',
    dialect:'mysql'
}) 

export default db