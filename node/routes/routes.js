import express from 'express'
import { getAllClient, getClient } from '../controllers/ClientController.js'

const router = express.Router()

router.get('/',getAllClient)
router.get('/:id_cliente',getClient)
export default router