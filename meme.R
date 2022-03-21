library(magick)

#Part A: What is STATS220 like Meme...

Confused <- image_read("https://i.dailymail.co.uk/1s/2020/02/11/10/24593704-7990639-image-m-13_1581418550899.jpg") %>%
  image_scale(300)

More_Confused <- image_read("https://www.unilad.co.uk/cdn-cgi/image/width=1200,quality=70,format=jpeg,fit=contain,dpr=1/https%3A%2F%2Fwww.unilad.co.uk%2Fwp-content%2Fuploads%2F2018%2F10%2FMr-Bean-A.jpg") %>%
  image_scale(300)

Extremely_Confused <- image_read("https://memegenerator.net/img/images/9786934.jpg") %>%
  image_scale(300)

Title_Text <- image_blank(width = 600, 
                             height = 200, 
                             color = "#FFFFFF") %>%
  image_annotate(text = "What STATS220 is really like...",
                 color = "#FF0000",
                 size = 45,
                 font = "Impact",
                 gravity = "Center")

Lectures_Text <- image_blank(width = 300, 
                             height = 300, 
                             color = "#FFFFFF") %>%
  image_annotate(text = "Lectures",
                 color = "#000000",
                 size = 60,
                 font = "Impact",
                 gravity = "center")

LABS_Text <- image_blank(width = 300, 
                         height = 208, 
                         color = "#000000") %>%
  image_annotate(text = "LABS",
                 color = "#FFFFFF",
                 size = 80,
                 font = "Impact",
                 gravity = "center")

Assignments_Text <- image_blank(width = 300, 
                                height = 208, 
                                color = "#FFFFFF") %>%
  image_annotate(text = "Assignments",
                 color = "#000000",
                 size =40,
                 font = "Impact",
                 gravity = "center")

first_row <- c(Confused, Lectures_Text) %>%
  image_append()

second_row <- c(More_Confused, LABS_Text) %>%
  image_append()

third_row <- c(Extremely_Confused, Assignments_Text) %>%
  image_append()

fourth_row <- c(Title_Text) %>%
  image_append()

c(fourth_row, first_row, second_row, third_row) %>%
  image_append(stack = TRUE)

image_write(c(fourth_row, first_row, second_row, third_row), "my_meme.png")
