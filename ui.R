library(shinydashboard)
library(shiny)
library(DT)

data <- read.csv("shinydata.csv")

header <- dashboardHeader(title = "COVID Deaths in US")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("US Map",
             tabName = "map", 
             icon = icon("globe")),
    menuItem("Summary Charts",
             tabName = "age",
             icon = icon("user")),
    menuItem("Summary Statistics",
             tabName = "summary",
             icon = icon("info-circle"))
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "map",
            fluidRow(
              column(width = 12, plotOutput("us_map", height = "800px"))
            )
    ),
    tabItem(tabName = "age", 
            fluidRow(
              box(width = 12, plotOutput("total_age")),
            ), 
            fluidRow(
              box(width = 12, plotOutput("total_condition")),
            )
    ),
    tabItem(tabName = "summary", 
            box(width = 12, dataTableOutput("state_table"))
    )
  )
)

dashboardPage(header, sidebar, body)
