# ui.R

shinyUI(fluidPage(
  headerPanel("Visualizing parameter performance in GBM"),
  p("NOTE: Please be patient, it may take some time until data is loaded from github."),
  p("Gradient Boosting Machines is an R-package that can be found at http://cran.r-project.org/web/packages/gbm/index.html)"),
  p("This application visualizes Validation Error performance for GBM (on the y axis) vs. number of trees (n.trees) on the x-axis for a user-selected parameter: interactive.depth (depth of trees), shrinkage (learning rate) and n.minobsinnode (number of instances in the tree leaves). The user can choose to visualize in the same plot all values of the selected parameter, by choosing Outer=FALSE, or in different plots, by selecting Outer=TRUE"),
  sidebarPanel(
    #numericInput('id1', 'Numeric input, labeled id1', 0, min = 0, max = 10, step = 1),
    radioButtons("id2", "First parameter",
                       c("interaction.depth" = "interaction.depth",
                         "shrinkage" = "shrinkage",
                         "n.minobsinnode" = "n.minobsinnode")),
    radioButtons("id4", "Outer?",
                        c("TRUE" = "TRUE",
                          "FALSE" = "FALSE")
                       )),
  mainPanel(
    plotOutput("plot")
  )
))
