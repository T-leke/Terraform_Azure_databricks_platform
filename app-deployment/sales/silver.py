from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()

df = spark.table("cat-sales.bronze.raw_sales")

clean_df = df.filter("amount > 0")

clean_df.write \
    .format("delta") \
    .mode("overwrite") \
    .saveAsTable("cat-sales.silver.clean_sales")

print("Silver complete")
