const express = require("express")
const yup = require("yup")

const connection = require("./db") // importar la conexión a la base de datos

const router = express.Router()

const schema = yup.object().shape({
  nombre: yup.string().required("El nombre del producto es obligatorio"),
  descripcion: yup.string().required("La descripcion del producto es obligatoria"),
  precio: yup.string().required("El precio es obligatorio"),
  imagen: yup.string().url("La url es inválida").required("La url es obligatoria"),
})

router.get("/", function (request, response) {
  response.send("Hello My Client")
}) // obtener datos

router.get("/lista", function (request, response) {
  const page = parseInt(request.query.page) || 1
  const limit = parseInt(request.query.perPage) || 10
  connection.query(
    "SELECT * FROM lista ORDER BY id DESC LIMIT ?,?",
    [(page-1)*limit, limit],
    function (error, result) {
      if (error) {
        console.log("Error fetching clients", error)
      } else {
        response.json(result)
      }
    },
  )
})

router.post("/lista", async function (request, response) {
  const datos = request.body

  try {
    const result = await schema.validate(datos) // validamos que el objeto cumpla con el esquema
    console.log(result)

    const query =
      "INSERT INTO lista (nombre, descripcion, precio, imagen) VALUES (?, ?, ?, ?)"

    connection.execute(query, Object.values(datos), function (error, result) {
      if (error) {
        response.status(400).json({
          message: "Error al guardar el producto",
          error: error,
        })
      } else {
        response.json({
          message: "Producto guardado",
          data: result,
        })
      }
    })
  } catch (error) {
    response.status(400).json({
      message: error.message,
    })
  }
})

router.get("/lista/:id", function (request, response) {
  const { id } = request.params

  const query = "SELECT * FROM lista WHERE id = ?"

  connection.query(query, [id], function (error, result) {
    if (error) {
      response.status(400).json({
        message: "Error al obtener el producto",
        error: error,
      })
    } else {
      if (result.length > 0) {
        response.json(result[0])
      } else {
        response.status(404).json({
          message: "Producto no encontrado",
        })
      }
    }
  })
})

router.put("/lista/:id", async function (request, response) {
  const data = request.body
  const { id } = request.params

  //const query = "UPDATE clientes SET ? WHERE id = ?"
  try {
    await schema.validate(data) // validamos que el objeto cumpla con el esquema

    const query =
      "UPDATE lista SET nombre = ?, descripcion = ?, precio = ?, imagen = ? WHERE id = ?"
  
    connection.execute(
      query,
      Object.values(data).concat(id),
      function (error, result) {
        if (error) {
          response.status(400).json({
            message: "Error al actualizar el producto",
            error,
          })
        } else {
          response.json({
            message: "producto actualizado",
            data: result,
          })
        }
      },
    )
  } catch (error) {
    response.status(400).json({
      message: error.message,
    })
  }
}) // cierre del put

router.delete("/lista/:id", function (request, response){
  const {id} = request.params

  const query = "DELETE FROM lista WHERE id = ?"

  connection.execute(query, [id], function(error, result){
    if (error) {
      response.status(400).json({
        message: "Error al eliminar el producto",
        error
      })
    } else {
      response.json({
        message: "Producto eliminado correctamente",
        data: result
      })
    }
  })
})

// desde 200 hasta 299 - OK
// desde 300 hasta 399 - Redirecciones
// desde 400 hasta 499 - Errores del cliente
// desde 500 hasta 599 - Errores del servidor

module.exports = router
