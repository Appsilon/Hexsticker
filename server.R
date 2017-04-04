library(shiny)
library(hexSticker)

validation_reject_msg <- function(label) {
  ""
}

validate_input <- function(input, label){
  validate(
    need(input, validation_reject_msg(label)),
    need(input != "", validation_reject_msg(label))
  )
}

shinyServer(function(input, output) {
  
  output$img_url <- renderUI({ 
    div(class = "ui labeled input",
        div(class ="ui label", "http://"),
        shiny_text_input("img_url", tags$input(type = "text",
                                            style = "width: 8em"))
    )
    })
  
  output$name <- renderUI({ 
    div(class = "ui input",
        shiny_text_input("name", tags$input(type = "text",
                                               style = "width: 8em"))
    )
  })
  
  output$font_size <- renderUI({ 
    div(class = "ui input",
        shiny_text_input("font_size", tags$input(type = "numeric",
                                                   style = "width: 8em"))
    )
  })
  
  
output$myImage <- renderImage({
    
    outfile <- tempfile(fileext='.png')
    validate_input(input[['img_url']])
    validate_input(input[['name']])
    validate_input(input[['font_size']])
    myurl <- paste0(input[['img_url']])
    z <- tempfile(fileext='.png')
    download.file(myurl, z, mode="wb")
    
    png()

    sticker(z, package = input$name,
            p_size = as.numeric(input$font_size), s_x = 1, s_y = 0.75, s_width = .5, p_y = 1.5,
            filename = outfile, p_color = input$title_color,
            h_fill = input$bg_color, h_color = input$frame_color)
    
    file.remove(z)
  
    list(src = outfile,
         contentType = 'image/png',
         width = 518,
         height = 600,
         alt = "hexsticker")
  }, deleteFile = TRUE)


})
