# STAT451Final
Data: https://catalog.data.gov/dataset/conditions-contributing-to-deaths-involving-coronavirus-disease-2019-covid-19-by-age-group 

Source: U.S. Department of Health & Human Services

How to access: Click on the link provided above and download the "Comma Separated Values File".

Question: "What is the relationship between age groups, specific health conditions, and COVID-19 mortality rates in different U.S. states?"

This question addresses the complex interplay between age, pre-existing health conditions, and COVID-19 outcomes. By analyzing the dataset, we will be able to investigate whether certain age groups are more susceptible to severe outcomes and if the presence of specific health conditions amplifies this risk. Furthermore, we will be able to explore regional variations, as different states may have different healthcare systems, demographics, and policies that impact these relationships. This analysis will provide valuable insights into the factors influencing COVID-19 mortality. In the real world, this could be used in aiding in targeted interventions and healthcare resource allocation.

Data Cleaning

Before we created our preliminary visuals or implemented our data into a Shiny Dashboard we performed the data cleaning operations that can be found in the Data Cleaning in RMD file here in this respository. To reproduce our work simply download our data set above, and perform the data cleaning and you should be left with the exact data set we worked with throughout our project. 

Analysis of Preliminary Visual 1

In the visualization above, we have created a bar chart that shows the COVID-19 mortality rate by age group, using the "COVID.19.Deaths" column for the y-axis and "Age.Group" for the x-axis. Each bar in the chart represents a different age group, and the height of the bars corresponds to the total number of COVID-19 deaths within that age group. This visualization allows us to quickly identify which age groups have the highest mortality rates. As we can see, as age increases, the number of COVID-19 deaths greatly increases. In particular, the number of deaths more than doubles from the 45-54 age group and the 55-64 age group. The number of deaths is highest in the two oldest age groups (75-84 and 85+). We will use this initial analysis to identify patterns and trends that may be of interest for further investigation in the project.

Analysis of Preliminary Visual 2

This visualization allows us to see the distribution of COVID-19 deaths by state, for the 50 states across the United States of America. For each state, the total number of COVID-19 deaths from the dataset that occurred in that state were added up, and the shade of the state on the map corresponds to this total number of deaths. States that are more red had a higher number of deaths, and states that are more white had a lower number of deaths. This allows us to indentify which states and regions had the highest number of deaths. In the visualization, we can see that the greatest number of COVID-19 deaths occurred in California, Texas, and Florida. There was also a high number of deaths in the northeast region of the United States, as well as the southeast region of the country. Finally, we can see that in the northern region of the country, there was a much lower number of COVID-19 deaths.

Analysis of Preliminary Visual 3

This visualization allows us to see the distribution of COVID-19 deaths across different age groups while also considering the contributing health condition groups. By stacking the bars for each condition side-by-side within each individual age group, we can observe the relative proportions of health conditions within each age. For example, it may reveal whether certain health conditions are more prevalent in specific age groups and contribute more to COVID-19 mortality. This can help identify high-risk groups and guide targeted public health interventions. In the visual, we can see that respiratory diseases are the leading cause of COVID-19 deaths among all age groups above 35 years old. We can also see that the "all other" category of conditions is the 2nd leading cause of COVID-19 deaths among those same age groups. Finally, we can see that certain categories such as injury/poisioning, malignant neoplasms, and obesity are not one of the leading contributors to COVID-19 deaths among any of the age groups.

