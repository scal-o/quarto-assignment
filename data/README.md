# Data Directory

This directory contains datasets used in the project. 

## Contents

Place your data files here. Common formats include:
- CSV files
- Excel spreadsheets
- JSON files
- SQLite databases
- Parquet files

## Usage

Data files in this directory are accessed by the analysis code in the sections directory. Paths should be referred to using relative paths, for example:

```python
import pandas as pd
data = pd.read_csv("../data/your_file.csv")
```

## Sample Data

You may want to include a small sample of your data for testing or documentation purposes. Ensure any sample data does not contain sensitive information.

## Data Documentation

For each dataset, consider documenting:
- Source
- Date obtained
- Description of variables
- Data preprocessing steps
- Any known issues or limitations