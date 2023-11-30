# Instala los paquetes necesarios si no los tienes instalados
install.packages(c("shiny", "httr"))

library(shiny)
library(httr)

# Specify the application port
options(shiny.host = "0.0.0.0")
options(shiny.port = 8180)

# Define la UI de la aplicación Shiny
ui <- fluidPage(
  titlePanel("Energy Predictor"),
  sidebarLayout(
    sidebarPanel(
      # Entradas para los parámetros de predicción
      textInput("tool", "Tool Used", ""),
      numericInput("cutting_depth_ai", "Cutting Depth (in m)", value = 0),
      numericInput("tool_diameter_d", "Tool Diameter (in m)", value = 0),
      numericInput("diameter_ae", "Diameter (efective cutting diameter in m)", value = 0),
      numericInput("feed_vel_f", "Feed Velocity (in m/s)", value = 0),
      numericInput("revol_n", "Revs", value = 0),
      numericInput("num_of_inserts_z", "Num. of Inserts", value = 0),
      numericInput("feet_per_insert_fz", "Feet per Insert (in m)", value = 0),
      numericInput("cut_vel_vc", "Cutting Velocity (in m/min)", value = 0),
      numericInput("power", "Power (in W)", value = 0),
      numericInput("time", "Time (in s)", value = 0),
      numericInput("distance", "distance (in m)", value = 0),
      # Agrega más entradas según los parámetros necesarios
      actionButton("predictButton", "Predict")
    ),
    mainPanel(
      # Resultado de la predicción
      verbatimTextOutput("prediction")
    )
  )
)

# Define el servidor
server <- function(input, output) {
  observeEvent(input$predictButton, {
    # Crear el cuerpo de la solicitud con los datos ingresados por el usuario
    req_body <- list(
      tool = input$tool,
      cutting_depth_ai = input$cutting_depth_ai,
      tool_diameter_d = input$tool_diameter_d,
      diameter_ae = input$diameter_ae,
      feed_vel_f = input$feed_vel_f,
      revol_n = input$revol_n,
      num_of_inserts_z = input$num_of_inserts_z,
      feet_per_insert_fz = input$feet_per_insert_fz,
      cut_vel_vc = input$cut_vel_vc,
      power = input$power,
      time = input$time,
      distance = input$distance
      # Agrega más parámetros según corresponda
    )
    
    # Realizar la solicitud POST a la API Plumber
    response <- POST("http://localhost:8000/energy", body = req_body, encode = "json")
    
    # Obtener y mostrar la respuesta
    if (http_status(response)$category == "Success") {
      output$prediction <- renderText({
        content(response, "text")
      })
    } else {
      output$prediction <- renderText({
        "Error en la solicitud."
      })
    }
  })
}

# Ejecutar la aplicación Shiny
shinyApp(ui = ui, server = server)

