library(dplyr)
library(dbplyr)
library(utils)
# dotenv::load_dot_env(file='.env')
#get data
url <- "https://docs.google.com/spreadsheets/d/11QyMYrydf7UlFXuNT7DjI_s1vF7Jd2erppHEFdwgVuY/export?format=csv"
df <- read.csv(url)

con <- DBI::dbConnect(
  RPostgreSQL::PostgreSQL(),
  host = Sys.getenv("DB_HOST"),
  user = Sys.getenv("DB_USER"),
  password = Sys.getenv("DB_PASSWORD")
)
copy_to(
  con, df, "monitoreo",
  overwrite=TRUE, temporary = FALSE
)