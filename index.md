---
title       : Stock Viewer
subtitle    : Presentation of Stock Viewer application
author      : Hideh Tobita
job         : Atibot Data Analysis Laboratory
logo        : dragon_logo.png
url:
  assets      : ./assets
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, bootstrap,shiny, interactive]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Read-And-Delete

1. Edit YAML front matter
2. Write using R Markdown
3. Use an empty line followed by three dashes to separate slides!

--- .class #id 

## Slide 2

--- &interactive

## Test

<div class="row-fluid">
  <div class="span4">
    <form class="well">
      <label class="control-label" for="sex">Choose Sex</label>
      <select id="sex"><option value="Male" selected>Male</option>
<option value="Female">Female</option></select>
      <script type="application/json" data-for="sex" data-nonempty="">{}</script>
      <label class="control-label" for="type">Choose Type</label>
      <select id="type"><option value="multiBarChart" selected>multiBarChart</option>
<option value="multiBarHorizontalChart">multiBarHorizontalChart</option></select>
      <script type="application/json" data-for="type" data-nonempty="">{}</script>
    </form>
  </div>
  <div class="span8">
    <div id="nvd3plot" class="shiny-html-output nvd3 rChart"></div>
  </div>
</div>

---

## Stock Viewer application

<div class="row-fluid">
  <div class="row-fluid">
    <div class="span4">
      <form class="well">
        <h4>According to the checkbox(On/Off), 
         create and display a monthly stock price chart or
         a monthly return chart of the company specified with it's SYMBOL.
         Information will be collected from Yahoo! in the period from 
         1998-01-01 to 2014-10-31</h4>
        <label for="symbol">Enter SYMBOL</label>
        <input id="symbol" type="text" value="SBUX"/>
        <hr/>
        <button id="goButton" type="button" class="btn action-button">Go!</button>
        <h4>Click the button to update the chart of the sybmol you enter.</h4>
        <hr/>
        <label class="checkbox" for="checkbox">
          <input id="checkbox" type="checkbox"/>
          <span>Price chart (Off) or Return chart (On)</span>
        </label>
        <h4>If checked (On), a chart of monthly continuously compounded returns is displayed 
         along with the expected anual return and volatility in %.
         The red horizaontal line shows the mean of monthly returns.</h4>
      </form>
    </div>
    <div class="span8">
      <div id="chart" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
    </div>
  </div>
</div>

---

## End
