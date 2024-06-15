import tablaUsuario from '../models/UsuarioModel.js';

export const loginUser = async (req, res) => {

    const { nombre_usuario, contrasena } = req.body;
   
    try {
        const user = await tablaUsuario.findOne({ where: { nombre_usuario } });
        console.log(!user)
        if (!user) {
           
            return res.status(404).send('Usuario no encontrado');
        }
     
        // const passwordIsValid = bcrypt.compareSync(contrasena, user.contrasena);
       
        if (!(user.contrasena === contrasena)) {
            
            return res.status(401).send('Contraseña incorrecta');
        }

        res.json(user)

        // const token = jwt.sign({ id: user.id }, 'tu_secreto_jwt', { expiresIn: 86400 });
        // console.log(token)
        // res.status(200).send({ auth: true, token });
        
    } catch (error) {
        res.status(500).send('Error en el servidor');
    }
};
