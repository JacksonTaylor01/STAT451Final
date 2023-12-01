library(tidyverse)
library(dplyr)
library(DT)

function(input, output, session) {
  data <- read.csv("shinydata.csv")
  
  observe({
    choices <- unique(data$region)
    updateSelectInput(session, "State", choices = choices)
  })
  

  output$total_age = renderPlot({
    ggplot(data, aes(x = Age.Group, y = COVID.19.Deaths)) +
      geom_bar(stat = "identity", fill = "black") +
      labs(title = "COVID-19 Mortality by Age Group",
           x = "Age Group",
           y = "COVID-19 Deaths") +
      theme_minimal() +
      theme(axis.text.x = element_text(size = 15), axis.text.y = element_text(size = 12),
            plot.title = element_text(size = 25),
            axis.title = element_text(size = 18)) +
      scale_y_continuous(breaks = c(0, 500000, 1000000, 1500000, 2000000, 2500000, 3000000, 3500000),
                         labels = c("0", "500,000", "1,000,000", "1,500,000", "2,000,000", "2,500,000", "3,000,000", "3,500,000"))
  })
 
  output$us_map = renderPlot({
    total_state_values <- df %>%
      group_by(region) %>%
      summarize(COVID_Deaths = sum(COVID.19.Deaths))
    
    states_map <- map_data("state")
    total_state_values <- total_state_values %>% mutate(region = tolower(region))
    total_state_values$Population <- c(5074296, 733583, 7359197, 3045637, 39029342, 5839926, 3626205, 1018396,
                                       671803, 22244823, 10912876, 1440196, 1939033, 12582032, 6833037, 3200517,
                                       2937150, 4512310, 4590241, 1385340, 6164660, 6981974, 10034113, 5717184,
                                       2940057, 6177957, 1122867, 1967923, 3177772, 1395231, 9261699, 2113344,
                                       19677151, 8335897, 10698973, 779261, 11756058, 4019800, 4240137, 12972008,
                                       3221789, 1093734, 5282634, 909824, 7051339, 30029572, 3380800, 647064,
                                       8683619, 7785786, 1775156, 5892539, 581381)
    states_covid <- states_map %>% left_join(total_state_values)
    
    ggplot(states_covid, aes(x=long, y=lat, group=group)) +
      geom_polygon(aes(fill=(100*COVID_Deaths/Population)), color="black") +
      scale_fill_gradient2(low="cornflowerblue", 
                           high="firebrick", midpoint=2.5,
                           name = "Percentage") + 
      labs(title = "United States by Percentage of COVID Deaths",
           x = NULL, y = NULL) +
      theme(plot.title = element_text(size = 30),
            panel.grid=element_blank(),
            legend.title = element_text(size = 20),
            legend.text = element_text(size = 16),
            axis.text = element_blank(),
            axis.ticks = element_blank())
  })
  
  output$total_condition = renderPlot({
    ggplot(df, aes(x = Condition.Group, y = COVID.19.Deaths)) +
      geom_bar(stat = "identity", fill = "skyblue") +
      labs(title = "COVID-19 Mortality by Condition Group",
           x = "Condition",
           y = "COVID-19 Deaths") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 30, hjust = 1, size = 15),
            axis.text.y = element_text(size = 12),
            plot.title = element_text(size = 25),
            axis.title = element_text(size = 18)) +
      
      scale_y_continuous(breaks = c(0, 500000, 1000000, 1500000, 2000000, 2500000, 3000000, 3500000),
                         labels = c("0", "500,000", "1,000,000", "1,500,000", "2,000,000", "2,500,000", "3,000,000", "3,500,000"))
  })
  
  
  output$state_table = renderDataTable({
    data %>% 
      group_by(Age.Group, Condition.Group) %>%
      select(region, Condition.Group, Age.Group, COVID.19.Deaths) %>%
      datatable(
        colnames = c("State", "Condition Group", "Age Group", "COVID Deaths"),
        caption = "State details",
        filter = "top", 
        options = list(
          pageLength = 15, 
          lengthMenu = c(10, 20, 50)
        )
      )
  })
  
}