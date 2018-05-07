library(rmarkdown)
survey_data_xl_path <- "/home/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/HighLevelResults-27Mar2018/High level survey of climate adaptation v2 aggregated.xlsx"
out_dir <- "/home/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/HighLevelSurveyReports"
utility_name <- 'Water Corporation'
render("ComparisonAnalysisTemplate.Rmd", output_format = 'pdf_document',  output_dir=out_dir, output_file=paste(utility_name, ".pdf"))
render("ComparisonAnalysisTemplate.Rmd", output_format = 'html_document',  output_dir=out_dir, output_file=paste(utility_name, ".html"))
render("ComparisonAnalysisTemplate.Rmd", output_format = 'word_document',  output_dir=out_dir, output_file=paste(utility_name, ".doc"))
utility_name <- 'Barwon Water'
render("ComparisonAnalysisTemplate.Rmd", output_format = 'pdf_document',  output_dir=out_dir, output_file=paste(utility_name, ".pdf"))
render("ComparisonAnalysisTemplate.Rmd", output_format = 'html_document',  output_dir=out_dir, output_file=paste(utility_name, ".html"))
render("ComparisonAnalysisTemplate.Rmd", output_format = 'word_document',  output_dir=out_dir, output_file=paste(utility_name, ".doc"))
utility_name <- 'City West Water'
render("ComparisonAnalysisTemplate.Rmd", output_format = 'pdf_document',  output_dir=out_dir, output_file=paste(utility_name, ".pdf"))
render("ComparisonAnalysisTemplate.Rmd", output_format = 'html_document',  output_dir=out_dir, output_file=paste(utility_name, ".html"))
render("ComparisonAnalysisTemplate.Rmd", output_format = 'word_document',  output_dir=out_dir, output_file=paste(utility_name, ".doc"))
utility_name <- 'Coliban Water'
render("ComparisonAnalysisTemplate.Rmd", output_format = 'pdf_document',  output_dir=out_dir, output_file=paste(utility_name, ".pdf"))
render("ComparisonAnalysisTemplate.Rmd", output_format = 'html_document',  output_dir=out_dir, output_file=paste(utility_name, ".html"))
render("ComparisonAnalysisTemplate.Rmd", output_format = 'word_document',  output_dir=out_dir, output_file=paste(utility_name, ".doc"))
utility_name <- 'Melbourne Water'
render("ComparisonAnalysisTemplate.Rmd", output_format = 'pdf_document',  output_dir=out_dir, output_file=paste(utility_name, ".pdf"))
render("ComparisonAnalysisTemplate.Rmd", output_format = 'html_document',  output_dir=out_dir, output_file=paste(utility_name, ".html"))
render("ComparisonAnalysisTemplate.Rmd", output_format = 'word_document',  output_dir=out_dir, output_file=paste(utility_name, ".doc"))
utility_name <- 'South East Water'
render("ComparisonAnalysisTemplate.Rmd", output_format = 'pdf_document',  output_dir=out_dir, output_file=paste(utility_name, ".pdf"))
render("ComparisonAnalysisTemplate.Rmd", output_format = 'html_document',  output_dir=out_dir, output_file=paste(utility_name, ".html"))
render("ComparisonAnalysisTemplate.Rmd", output_format = 'word_document',  output_dir=out_dir, output_file=paste(utility_name, ".doc"))


