# Overview

This is a Jupyter Notebook where I extract data from League of Legends API, transform it and dump that data into Snowflake and CSV files(optional). 
Try to open the jupyter notebook [here](https://github.com/StylesAW/data_modeling/blob/main/data_modeling.ipynb)

**The second part of this project is the repository [data_pipeline](https://github.com/StylesAW/data_pipeline_lol) , where the process is automated using different technologies.**

## Setting Up the Environment

To get started, you can consider to set up a virtual environment and install the required dependencies. Follow these steps:

### 1. Create a Virtual Environment

First, create a virtual environment in your project directory. You can do this by running the following command:

```bash
python -m venv venv
```

### 2. Install Required Packages

With the virtual environment activated, install the dependencies listed in the `requirements.txt` file by running:
```bash
pip install -r requirements.txt
```
This command will install all the necessary libraries to run the Python script.

### 3. Set Up Snowflake

To use this project, you'll need to create an account in Snowflake. Once your account is set up, follow the next:

- **Run the SQL Query**: Execute the query provided in the `query_snowflake.sql` file. This query will set up the necessary architecture in Snowflake to store and manage the data extracted from the League of Legends API. You can find this file [query_snowflake](https://github.com/StylesAW/data_modeling/blob/main/query_snowflake.sql)
