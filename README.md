<div id="top">

<!-- HEADER STYLE: CLASSIC -->
<div align="center">


# AIR-POLLUTANT-RESEARCH

<em>Transforming Air Quality Data into Actionable Insights</em>

<!-- BADGES -->
<img src="https://img.shields.io/github/last-commit/ChristianRodriguez46/Air-Pollutant-Research?style=flat&logo=git&logoColor=white&color=0080ff" alt="last-commit">
<img src="https://img.shields.io/github/languages/top/ChristianRodriguez46/Air-Pollutant-Research?style=flat&color=0080ff" alt="repo-top-language">
<img src="https://img.shields.io/github/languages/count/ChristianRodriguez46/Air-Pollutant-Research?style=flat&color=0080ff" alt="repo-language-count">

<em>Built with the tools and technologies:</em>

<img src="https://img.shields.io/badge/R-276DC3.svg?style=flat&logo=R&logoColor=white" alt="R">

</div>
<br>

---

## Table of Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Usage](#usage)
    - [Testing](#testing)
- [Features](#features)
- [Project Structure](#project-structure)
    - [Project Index](#project-index)

---

## Overview



---

## Features

|      | Component            | Details                                                                                     |
| :--- | :------------------- | :------------------------------------------------------------------------------------------ |
| ⚙️  | **Architecture**     | <ul><li>Modular R scripts for each pollutant analysis (e.g., disparityso2.r, plotpm25.r)</li><li>Sequential data processing pipeline</li><li>Data merging and cleaning via `mergingcsvfilesco.r`</li></ul> |
| 🔩 | **Code Quality**     | <ul><li>Consistent naming conventions for scripts</li><li>Use of R functions for reusability</li><li>Comments and documentation within scripts (assumed)</li></ul> |
| 📄 | **Documentation**    | <ul><li>Placeholder for documentation files (empty `{}`)</li><li>Likely includes analysis methodology and data descriptions</li></ul> |
| 🔌 | **Integrations**     | <ul><li>Extensive use of R scripts for statistical modeling (`lmeso2.r`, `lmeco.r`, `lme_no2.r`, etc.)</li><li>Correlation and disparity analysis scripts (`corr valuespm25.r`, `disparityozone.r`)</li><li>Data merging from CSV files (`mergingcsvfilesco.r`)</li></ul> |
| 🧩 | **Modularity**       | <ul><li>Separate scripts for each pollutant and analysis type</li><li>Reusable functions for plotting, correlation, disparity calculations</li></ul> |
| 🧪 | **Testing**          | <ul><li>No explicit testing framework indicated</li><li>Potential manual or script-based validation</li></ul> |
| ⚡️ | **Performance**      | <ul><li>Likely sufficient for small to medium datasets</li><li>Data merging and modeling scripts optimized for batch processing</li></ul> |
| 🛡️ | **Security**         | <ul><li>No explicit security measures or considerations evident</li></ul> |
| 📦 | **Dependencies**     | <ul><li>Primarily R scripts; no package manager specified</li><li>Relies on R base and common packages for statistical analysis</li></ul> |

---

## Project Structure

```sh
└── Air-Pollutant-Research/
    ├── co
    │   ├── Pop_2000_to_2023.csv
    │   ├── annual_disparities_low_vs_high_co_2000_2023.csv
    │   ├── cali_income.csv
    │   ├── co_abs_disparity_2000_2023.pdf
    │   ├── co_california_2000_2023.csv
    │   ├── co_income_correlations_2000-2023.pdf
    │   ├── co_rel_disparity_2000_2023.pdf
    │   ├── corr plotco.R
    │   ├── corr valuesco.R
    │   ├── diff plotco.R
    │   ├── disparityco.R
    │   ├── lmeco.R
    │   ├── mergingcsvfilesco.R
    │   ├── merginincomedataco.R
    │   ├── plotco.R
    │   ├── plots
    │   └── yearly_correlations_co_income.csv
    ├── no2
    │   ├── Pop_2000_to_2023.csv
    │   ├── annual_disparities_low_vs_high_no2_2000_2023.csv
    │   ├── cali_income.csv
    │   ├── corr plot_no2.R
    │   ├── corr values_no2.R
    │   ├── diff plot_no2.R
    │   ├── disparity_no2.R
    │   ├── lme_no2.R
    │   ├── merginincomedata_no2.R
    │   ├── no2_abs_disparity_2000_2023.pdf
    │   ├── no2_california_2000_2023.csv
    │   ├── no2_income_correlations_2000-2023.pdf
    │   ├── no2_rel_disparity_2000_2023.pdf
    │   ├── plot_no2.R
    │   ├── plots
    │   └── yearly_correlations_co_income.csv
    ├── ozone
    │   ├── Pop_2000_to_2023.csv
    │   ├── annual_disparities_low_vs_high_ozone_2000_2023.csv
    │   ├── cali_income.csv
    │   ├── corr plot_ozone.R
    │   ├── corr values_ozone.R
    │   ├── diff plot_ozone.R
    │   ├── disparity_ozone.R
    │   ├── lme_ozone.R
    │   ├── merginincomedata_ozone.R
    │   ├── ozone_abs_disparity_2000_2023.pdf
    │   ├── ozone_california_2000_2023.csv
    │   ├── ozone_income_correlations_2000-2023.pdf
    │   ├── ozone_rel_disparity_2000_2023.pdf
    │   ├── plot_ozone.R
    │   ├── plots
    │   └── yearly_correlations_ozone_income.csv
    ├── pm25
    │   ├── Pop_2000_to_2023.csv
    │   ├── annual_disparities_low_vs_high_pm25_2000_2023.csv
    │   ├── cali_income.csv
    │   ├── corr plotpm25.R
    │   ├── corr valuespm25.R
    │   ├── diff plotpm25.R
    │   ├── disparitypm25.R
    │   ├── lmepm25.R
    │   ├── merginincomedatapm25.R
    │   ├── plotpm25.R
    │   ├── plots
    │   ├── pm25_abs_disparity_2000_2023.pdf
    │   ├── pm25_california_2000_2023.csv
    │   ├── pm25_income_correlations_2000-2023.pdf
    │   ├── pm25_rel_disparity_2000_2023.pdf
    │   └── yearly_correlations_pm25_income.csv
    └── so2
        ├── Pop_2000_to_2023.csv
        ├── annual_disparities_low_vs_high_so2_2000_2023.csv
        ├── cali_income.csv
        ├── corr plotso2.R
        ├── corr valuesso2.R
        ├── diff plotso2.R
        ├── disparityso2.R
        ├── lmeso2.R
        ├── merginincomedataso2.R
        ├── plotco.R
        ├── plots
        ├── so2_abs_disparity_2000_2023.pdf
        ├── so2_california_2000_2023.csv
        ├── so2_rel_disparity_2000_2023.pdf
        ├── so2income_correlations_2000-2023.pdf
        └── yearly_correlations_so2_income.csv
```

---

### Project Index

<details open>
	<summary><b><code>AIR-POLLUTANT-RESEARCH/</code></b></summary>
	<!-- ozone Submodule -->
	<details>
		<summary><b>ozone</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ ozone</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/ozone/corr plot_ozone.R'>corr plot_ozone.R</a></b></td>
					<td style='padding: 8px;'>- Calculates and visualizes year-over-year Pearson correlations between population-weighted ozone levels across California counties from 2000 to 2023<br>- Highlights trends in relationships among low, mid, and high ozone measurements over time, providing insights into the stability or variability of these associations within the broader ozone data analysis architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/ozone/corr values_ozone.R'>corr values_ozone.R</a></b></td>
					<td style='padding: 8px;'>- Calculates year-wise correlations among low, mid, and high ozone levels to identify relationships over time<br>- Facilitates understanding of how different ozone measurements relate annually, supporting trend analysis and data quality assessment<br>- Optionally outputs the correlation results to a CSV file for further review or integration into broader reporting workflows within the project architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/ozone/disparity_ozone.R'>disparity_ozone.R</a></b></td>
					<td style='padding: 8px;'>- Calculates and visualizes annual disparities between low and high population-weighted ozone levels over time<br>- Produces both absolute and relative disparity metrics, generates corresponding plots, and saves results as CSV and PDF files<br>- Facilitates assessment of ozone inequality trends, supporting environmental health analysis within the broader data architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/ozone/plot_ozone.R'>plot_ozone.R</a></b></td>
					<td style='padding: 8px;'>- Generates comprehensive visualizations of Californias daily ozone levels segmented by income groups, highlighting the percentage of days with low-income exceeding high-income thresholds over time<br>- Incorporates wildfire activity overlays to contextualize environmental impacts, producing multi-faceted plots that facilitate analysis of temporal trends and correlations between air quality disparities and wildfire events from 2000 to 2023.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/ozone/merginincomedata_ozone.R'>merginincomedata_ozone.R</a></b></td>
					<td style='padding: 8px;'>- Aggregates and stratifies California ozone data by income levels, integrating demographic and population data to analyze disparities over time<br>- Facilitates understanding of how ozone pollution varies across socioeconomic groups, supporting environmental justice assessments and policy development by providing a clear view of temporal and spatial pollution disparities.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/ozone/lme_ozone.R'>lme_ozone.R</a></b></td>
					<td style='padding: 8px;'>- Performs statistical analysis of daily ozone disparity data by fitting a linear mixed-effects model with autoregressive correlation to capture temporal and seasonal patterns<br>- It accounts for variations across years and models the influence of seasonal cycles, providing insights into long-term trends and disparities between income groups within the broader ozone monitoring architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/ozone/diff plot_ozone.R'>diff plot_ozone.R</a></b></td>
					<td style='padding: 8px;'>- Generates a visualization of daily ozone differences between low and high-income populations over time<br>- It processes the data to compute daily ozone deltas and creates a line plot highlighting trends and deviations, aiding in the analysis of socioeconomic disparities in ozone exposure within the broader environmental and public health data architecture.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- co Submodule -->
	<details>
		<summary><b>co</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ co</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/co/lmeco.R'>lmeco.R</a></b></td>
					<td style='padding: 8px;'>- Models seasonal and long-term disparities between low-and high-income groups across years by fitting a linear mixed-effects model with autoregressive correlation<br>- It captures temporal patterns and variability within years, providing insights into income-based disparities over time and seasonality, thereby supporting analysis of socioeconomic differences in the broader data architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/co/merginincomedataco.R'>merginincomedataco.R</a></b></td>
					<td style='padding: 8px;'>- Aggregates and stratifies California county data by median household income, integrating population and air quality metrics over time<br>- Facilitates analysis of disparities in air pollution exposure across income groups, enabling insights into socioeconomic environmental inequities within the state’s entire codebase architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/co/corr plotco.R'>corr plotco.R</a></b></td>
					<td style='padding: 8px;'>- Calculates and visualizes year-wise Pearson correlations between low, mid, and high population-weighted CO levels across California counties from 2000 to 2023<br>- Produces a line plot illustrating trends in these correlations over time, facilitating insights into the relationships among different CO measures<br>- The visualization is saved as a PDF for reporting and further analysis within the broader data architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/co/mergingcsvfilesco.R'>mergingcsvfilesco.R</a></b></td>
					<td style='padding: 8px;'>- Aggregates California-specific CO air quality data from daily CSV files spanning 2000 to 2023<br>- It filters for California locations, computes average CO levels per county and date, and consolidates the data into a single summarized dataset<br>- This process supports temporal and spatial analysis of air pollution trends within California across the specified years.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/co/diff plotco.R'>diff plotco.R</a></b></td>
					<td style='padding: 8px;'>- Generates a visualization of daily CO differences between low and high-income populations over time, highlighting trends and deviations<br>- It processes the data to compute daily differences, then creates a clear line plot with annotations and styling for effective temporal analysis within the broader environmental and socioeconomic data architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/co/corr valuesco.R'>corr valuesco.R</a></b></td>
					<td style='padding: 8px;'>- Calculates year-wise correlations among low, mid, and high income categories within the dataset, providing insights into their relationships over time<br>- Results are displayed in the console for review and optionally exported as a CSV file for further analysis, supporting understanding of income category dynamics across different years in the overall data architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/co/disparityco.R'>disparityco.R</a></b></td>
					<td style='padding: 8px;'>- Calculates and visualizes annual disparities between low and high population-weighted PM2.5 levels, emphasizing both absolute and relative differences over time<br>- Generates comprehensive CSV data and PDF plots to facilitate trend analysis and comparison, supporting assessments of environmental inequality and air quality disparities across years.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/co/plotco.R'>plotco.R</a></b></td>
					<td style='padding: 8px;'>- Generates comprehensive visualizations of Californias daily CO levels across income groups from 2000 to 2023, highlighting the percentage of days with low-income exceeding high-income levels<br>- Incorporates wildfire acreage overlays and provides segmented views for different time periods, facilitating analysis of environmental and socioeconomic trends over the specified timeframe.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- pm25 Submodule -->
	<details>
		<summary><b>pm25</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ pm25</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/pm25/lmepm25.R'>lmepm25.R</a></b></td>
					<td style='padding: 8px;'>- Models long-term disparities in air quality between low-and high-income groups by analyzing daily PM2.5 data<br>- Incorporates seasonal and yearly trends, accounting for autocorrelation within years, to provide insights into socioeconomic and temporal patterns affecting air pollution exposure across the broader data architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/pm25/corr valuespm25.R'>corr valuespm25.R</a></b></td>
					<td style='padding: 8px;'>- Calculates year-wise correlations among low, mid, and high PM2.5 measurements to analyze their relationships over time<br>- Facilitates understanding of how different pollution levels co-vary annually, supporting broader assessments of air quality patterns<br>- Results are displayed in the console and optionally exported as a CSV for further analysis within the overall air quality monitoring architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/pm25/merginincomedatapm25.R'>merginincomedatapm25.R</a></b></td>
					<td style='padding: 8px;'>- Aggregates and analyzes PM2.5 air quality data across California counties from 2000 to 2023, integrating median household income and population data to assess disparities<br>- Produces daily weighted mean PM2.5 levels stratified by income groups, highlighting environmental justice concerns through disparity metrics<br>- This supports understanding of socioeconomic influences on air pollution exposure within the broader data architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/pm25/corr plotpm25.R'>corr plotpm25.R</a></b></td>
					<td style='padding: 8px;'>- Calculates and visualizes year-over-year Pearson correlations between different population-weighted PM2.5 measurements across California counties from 2000 to 2023<br>- Highlights the stability and relationships among low, mid, and high PM2.5 levels over time, providing insights into pollution patterns and their consistency, and outputs the results as a comprehensive PDF report for further analysis.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/pm25/disparitypm25.R'>disparitypm25.R</a></b></td>
					<td style='padding: 8px;'>- Calculates and visualizes annual population-weighted disparities in PM2.5 levels between low and high exposure groups over time<br>- Produces summary statistics, disparity metrics, and comparative plots, then saves results as CSV and PDF files<br>- Facilitates understanding of temporal trends in environmental health inequities related to air pollution exposure.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/pm25/diff plotpm25.R'>diff plotpm25.R</a></b></td>
					<td style='padding: 8px;'>- Generates a visualization of daily PM2.5 differences between low and high-income populations over time, highlighting disparities in air quality<br>- The plot facilitates trend analysis from 2000 to 2023, supporting insights into environmental inequality and informing policy or research focused on air pollution impacts across socioeconomic groups within the broader project architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/pm25/plotpm25.R'>plotpm25.R</a></b></td>
					<td style='padding: 8px;'>- Generates comprehensive visualizations of daily PM2.5 levels across California, highlighting income-based disparities and seasonal patterns<br>- Incorporates wildfire activity overlays to contextualize air quality trends from 2000 to 2023, facilitating analysis of environmental and socioeconomic impacts over time<br>- These plots support understanding of pollution dynamics and wildfire influence within the broader data architecture.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- so2 Submodule -->
	<details>
		<summary><b>so2</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ so2</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/so2/diff plotso2.R'>diff plotso2.R</a></b></td>
					<td style='padding: 8px;'>- Generates a visualization of daily SO2 concentration differences between low and high-income populations over time<br>- It processes the data to compute daily differences and produces a clear line plot highlighting temporal trends and disparities, supporting analysis of socioeconomic impacts on SO2 exposure within the broader environmental and public health data architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/so2/lmeso2.R'>lmeso2.R</a></b></td>
					<td style='padding: 8px;'>- Models the disparity in SO2 levels between low-and high-income groups over time by fitting a linear mixed-effects model with seasonal and annual trends<br>- Incorporates autocorrelation to account for temporal dependencies within years, enabling robust analysis of long-term and seasonal patterns in air quality disparities across socioeconomic groups within the broader data architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/so2/disparityso2.R'>disparityso2.R</a></b></td>
					<td style='padding: 8px;'>- Calculates and visualizes annual population-weighted disparities in SO2 levels by comparing low and high concentration estimates over time<br>- Produces CSV summaries and generates plots illustrating both absolute and relative disparities, facilitating trend analysis and reporting on environmental inequality in air quality across years.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/so2/corr valuesso2.R'>corr valuesso2.R</a></b></td>
					<td style='padding: 8px;'>- Calculates year-wise correlations among low, mid, and high SO2 measurements to assess their relationships over time<br>- Facilitates understanding of how these variables co-vary annually, supporting analysis of pollution patterns<br>- Results are displayed in the console and optionally saved as a CSV file for further review within the broader air quality monitoring architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/so2/corr plotso2.R'>corr plotso2.R</a></b></td>
					<td style='padding: 8px;'>- Calculates and visualizes year-wise Pearson correlations between population-weighted SO2 measurements across California counties from 2000 to 2023<br>- Produces a line plot illustrating the temporal stability or variation of relationships among low, mid, and high SO2 levels, facilitating insights into pollution dynamics and their consistency over time within the broader environmental data analysis architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/so2/merginincomedataso2.R'>merginincomedataso2.R</a></b></td>
					<td style='padding: 8px;'>- Aggregates and stratifies air quality data by socioeconomic income groups across California counties from 2000 to 2023<br>- Integrates population and income data to compute weighted mean SO2 levels, highlighting disparities between high-and low-income areas<br>- Facilitates analysis of environmental justice issues by quantifying pollution gaps related to income stratification within the state.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/so2/plotco.R'>plotco.R</a></b></td>
					<td style='padding: 8px;'>- Generates comprehensive visualizations of Californias daily SO2 levels across income groups from 2000 to 2023, highlighting seasonal patterns and annual trends<br>- Incorporates wildfire activity overlays to contextualize pollution fluctuations, producing multi-scale plots for detailed analysis and reporting<br>- These visual summaries support understanding of environmental disparities and wildfire impacts over time within the broader data architecture.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- no2 Submodule -->
	<details>
		<summary><b>no2</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ no2</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/no2/plot_no2.R'>plot_no2.R</a></b></td>
					<td style='padding: 8px;'>- Generates comprehensive visualizations of Californias NO2 pollution trends from 2000 to 2023, highlighting annual percentages of days with low-income populations experiencing higher NO2 levels<br>- Incorporates wildfire activity overlays to explore potential correlations, producing detailed plots for different time periods and saving them as accessible PDF files for analysis and reporting.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/no2/corr plot_no2.R'>corr plot_no2.R</a></b></td>
					<td style='padding: 8px;'>- Calculates and visualizes year-wise Pearson correlations between population-weighted NO2 levels across California counties from 2000 to 2023<br>- The analysis highlights the stability and relationships among different NO2 measurement points over time, providing insights into pollution patterns and their temporal dynamics<br>- The resulting plot facilitates understanding of how these correlations evolve annually within the broader data architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/no2/merginincomedata_no2.R'>merginincomedata_no2.R</a></b></td>
					<td style='padding: 8px;'>- Aggregates and processes air quality and socioeconomic data across California counties from 2000 to 2023<br>- Computes weighted NO2 levels stratified by income groups, integrating population and income data to analyze disparities<br>- Facilitates understanding of spatial and temporal pollution patterns, supporting environmental justice assessments and policy development.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/no2/corr values_no2.R'>corr values_no2.R</a></b></td>
					<td style='padding: 8px;'>- Calculates year-wise correlations among low, mid, and high NO2 concentration levels to identify relationships over time<br>- Facilitates understanding of how different NO2 metrics relate annually, supporting trend analysis and data quality assessment within the broader air quality monitoring architecture<br>- Optionally exports the correlation results for further review or reporting.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/no2/lme_no2.R'>lme_no2.R</a></b></td>
					<td style='padding: 8px;'>- Performs longitudinal analysis of NO2 disparity between income groups by fitting a linear mixed-effects model with seasonal and temporal components<br>- Captures intra-year variability and year-to-year differences, accounting for autocorrelation within each year<br>- Facilitates understanding of how income-related disparities in NO2 levels evolve over time and across seasons, supporting environmental justice and policy assessments within the broader data architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/no2/disparity_no2.R'>disparity_no2.R</a></b></td>
					<td style='padding: 8px;'>- Calculates and visualizes annual disparities between low and high population-weighted PM2.5 levels, highlighting both absolute and relative differences over time<br>- Generates comprehensive plots and exports disparity metrics as CSV and PDF files, supporting analysis of environmental inequality trends from 2000 to 2023 within the broader air quality assessment framework.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/ChristianRodriguez46/Air-Pollutant-Research/blob/master/no2/diff plot_no2.R'>diff plot_no2.R</a></b></td>
					<td style='padding: 8px;'>- Generates a visual comparison of daily NO2 differences between low and high-income populations over time<br>- It processes the data to compute the difference, then creates a line plot highlighting trends and deviations, facilitating analysis of income-related disparities in NO2 exposure across the specified period within the overall air quality monitoring architecture.</td>
				</tr>
			</table>
		</blockquote>
	</details>
</details>

---

## Getting Started

### Prerequisites

This project requires the following dependencies:

- **Programming Language:** R

### Installation

Build Air-Pollutant-Research from the source and install dependencies:

1. **Clone the repository:**

    ```sh
    ❯ git clone https://github.com/ChristianRodriguez46/Air-Pollutant-Research
    ```

2. **Navigate to the project directory:**

    ```sh
    ❯ cd Air-Pollutant-Research
    ```

3. **Install the dependencies:**

[R and Rstudio](https://posit.co/download/rstudio-desktop/)

- Download R, then download the Rstudio IDE that best suits your OS

### Usage

Run the project with: Rstudio IDE

Set working directory to which ever air pollutant inside the project directory under the tab labeled session'

<ol>
	<li>merge income data</li>
	<li>lme{pollutant}</li>
	<li>corr values{pollutant}</li>
	<li>corr plot</li>
	<li>diff plot</li>
	<li>plot{pollutant}</li>
	<li>disparity{pollutant}</li>
</ol>
<!-- comment out this section for now

### Testing

Air-pollutant-research uses the {__test_framework__} test framework. Run the test suite with:

echo 'INSERT-TEST-COMMAND-HERE'

---
-->
<div align="left"><a href="#top">⬆ Return</a></div>

---
