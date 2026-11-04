from pyspark.sql import SparkSession

# Initialize Spark
spark = SparkSession.builder.getOrCreate()

# Read raw sales data from Bronze
df = spark.table("`cat-sales`.bronze.raw_sales")

# Remove invalid transactions
# Only transactions with positive amounts are retained
clean_df = df.filter("amount > 0")

# Write cleaned data to the Silver layer
clean_df.write \
    .format("delta") \
    .mode("overwrite") \
    .saveAsTable("`cat-sales`.silver.clean_sales")

print("Silver complete")
