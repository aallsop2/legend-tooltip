library(highcharter)

hc <- highchart() %>%
  hc_title(
    text = "Working with JavaScript Syntax in R",
    align = 'center'
  ) %>%
  hc_legend(enabled = TRUE,
            useHTML = TRUE,
            labelFormatter = JS("function () {
        if (this.options.custom && this.options.custom.legendTooltip) {
            return '<span title=\"' + this.options.custom.legendTooltip + '\">' + this.name + '</span>';
        }
        return '<span>' + this.name + '</span>';
    }")) %>%
  hc_plotOptions(
    series = list(
      dataLabels = list(
        enabled = FALSE
      )
    )
  ) %>%
  hc_add_series(
    data = sample(1:40, 100, replace=TRUE),
    type = "spline",
    name = "First Sample",
    custom = list(legendTooltip = "Custom Tooltip for first sample")
  ) %>% 
  hc_add_series(
    data = sample(1:80, 100, replace = TRUE),
    type = "spline",
    name = "Second Sample",
    custom = list(legendTooltip = "Custom tooltip for second sample")
  )

hc
