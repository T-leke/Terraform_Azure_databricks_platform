from pyspark.sql import SparkSession
from pyspark.sql.functions import sum, count

# Initialize Spark
spark = SparkSession.builder.getOrCreate()

# Read cleaned sales data from Silver
df = spark.table("`cat-sales`.silver.clean_sales")

# Aggregate sales by city
sales_summary = df.groupBy("city").agg(
    sum("amount").alias("total_sales"),
    count("sale_id").alias("total_transactions")
)

# Write aggregated results to Gold
sales_summary.write \
    .format("delta") \
    .mode("overwrite") \
    .saveAsTable("`cat-sales`.gold.sales_summary")

print("Gold complete")
