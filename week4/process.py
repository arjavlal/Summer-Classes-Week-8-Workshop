import pandas as pd

# --- Transformation Step (Example) ---
# Replacing this dummy data with your actual transformed DataFrame:
df = pd.DataFrame({
    "product_id": [101, 102, 103],
    "product_name": ["Widget A", "Widget B", "Widget C"],
    "price": [19.99, 29.99, 49.99]
})

# --- Load Step ---
# 1. Export your final data asset into compressed columnar storage
df.to_parquet("clean_served_products.parquet", index=False)

# 2. Read optimized file back from disk to verify data integrity
validation_df = pd.read_parquet("clean_served_products.parquet")

# 3. Output verification summary
print("Pipeline Completed. Transformed warehouse table successfully loaded:")
print(validation_df)