# models/my_spark_model.py
from snowflake.snowpark.functions import lit


# models/dimension/tut.py
def model(dbt, session):
    dbt.config(
        materialized="incremental",
        unique_key="host_id",full_refresh=True
    )
    
    df = dbt.ref("stg_host")
    
    if dbt.is_incremental:
        # Fetch the max date from the existing target table using dbt.this
        max_date_df = session.sql(f"select max(updated_at) from {dbt.this}")
        max_date = max_date_df.collect()[0][0]
        
        # Filter for only new records
        df = df.filter(df["updated_at"] > max_date)
        
    return df
