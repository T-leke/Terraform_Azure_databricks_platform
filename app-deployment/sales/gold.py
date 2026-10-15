from pyspark.sql import SparkSession
from pyspark.sql.functions import sum

spark = SparkSession.builder.getOrCreate()

df = spark.table("cat-sales.silver.clean_sales")

summary = (
    df.groupBy("city")
      .agg(sum("amount").alias("total_sales"))
)

summary.write \
    .format("delta") \
    .mode("overwrite") \
    .saveAsTable("cat-sales.gold.sales_summary")

print("Gold complete")
