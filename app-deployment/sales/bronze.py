from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()

data = [
    (1, "London", 1200.0),
    (2, "Glasgow", 850.0),
    (3, "Manchester", 1500.0),
    (4, "Glasgow", -100.0),
]

df = spark.createDataFrame(
    data,
    ["sale_id", "city", "amount"]
)

df.write \
    .format("delta") \
    .mode("overwrite") \
    .saveAsTable("cat-sales.bronze.raw_sales")

print("Bronze complete")

# test
