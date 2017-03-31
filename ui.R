library(shiny)
library(shiny.semantic)
library(colourpicker)

logos_img <- list(src = c("appsilon.png"),
       style = c("height: 50px; width: 141px; margin: -8px 10px -6px 0px"))

menu <- div(class = "ui bottom attached segment",
            div(class = "ui", img(src = logos_img$src, style = logos_img$style) %>% shiny::tagList()
            )
)

shinyUI(
  semanticPage(
    title = "Create your Hex logo",
    menu,
    div(style = "ui raised segment",
        div(class = "ui horizontally padded grid",
            div(class = "sixteen wide column",
                HTML("This is a simple Hex Sticker Shiny App using <a href='https://github.com/Appsilon/shiny.semantic'>shiny.sementic</a> package for UI. Create you own sticker with just a few clicks.
                     App is using <a href='https://github.com/GuangchuangYu/hexSticker'>hexSticker</a> package to generate the sticker."),
                p(),
                strong("Have fun!"),
                p(),
                div(class = "ui form",
                    div(class = "three fields",
                        div(class = "ui field", shiny::tags$label("Image url"),
                            uiOutput("img_url")),
                        div(class = "ui field", shiny::tags$label("Sticker name"),
                            uiOutput("name")),
                        div(class = "ui field", shiny::tags$label("Sticker font size"),
                            uiOutput("font_size"))
                    ),
                    div(class = "two fields",
                        div(class = "ui field", shiny::tags$label("Frame color"),
                            colourInput("frame_color", "", "#9b9b9b")),
                        div(class = "ui field", shiny::tags$label("Backgroud color"),
                            colourInput("bg_color", "", "007bcf")),
                        div(class = "ui field", shiny::tags$label("Sticker title color"),
                            colourInput("title_color", "", "black"))
                    )
                )
            )
        )
    ),
    div(align = "center",
        imageOutput("myImage")
    )
  )
)
