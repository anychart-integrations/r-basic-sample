library(shiny)
library(RMySQL)
library(jsonlite)

db = dbConnect(MySQL(),
  dbname = "anychart_db",
  host = "localhost", 
  port = 3306, 
  user = "anychart_user", 
  password = "anychart_pass")

loadData = function(){
  dbGetQuery(db, "SELECT from_node, to_node, flow_value FROM web_users_flow")
}

server = function(input, output){}

ui = function(){
  htmlTemplate("index.html",
    title = "Anychart R Shiny template",
    chartTitle = shQuote("Website Users Flow"),
    chartData = toJSON(loadData())
)}

shinyApp(ui = ui, server = server)
