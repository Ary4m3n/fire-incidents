# Fire Incidents Toronto (2011-2022)

## Note

Chat-GPT4 was used as an LLM for this paper where the usage was restricted to learning some features of Quarto and R. All the usages have been included in `usage.txt` for reference, with the full chat with the LLM.

## Overview

This repo provides all the work and files used and created while writing the paper titled *An Analysis of a Rising Trend in Dollar Loss in Fire Incidents With and Without Sprinkler Systems in Toronto over a decade (2011-2022)*. To access the PDF of the paper you can find it in `outputs/paper` where it is named as `paper.pdf`. @file-structure outlines each directory and also all relevant material that they contain. Please go through the File Structure Section before accessing the repo to gain all the understanding needed.

To use this folder, click the green "Code" button", then "Download ZIP". The user can then move the folder around to wherever they want to work on it on their own computer.

The repo has been created in a reproducible way for as to allow users to access and reproduce the work easily.

## File Structure {#file-structure}

The repo has been structured in a way to make it accessible to the user. The repo is structured as:

-   `input/data` contains the data sources used in analysis including the raw data.
-   `input/llm` contains the file `usage.txt` that includes the chat with the LLM as reference.
-   `input/sketches` contains two sketches for the datasets and the graphs as reference to what is to be expected in the paper.
-   `outputs/data` contains the cleaned dataset that was constructed.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document, `paper.qmd`, the reference bibliography file, `references.bib` as well as the PDF of the paper, `paper.pdf`. 
-   `scripts` contains the R scripts used to simulate, download and clean data. Kindly read the prerequisites in the R scripts' preamble to be able to reuse and run the code.
