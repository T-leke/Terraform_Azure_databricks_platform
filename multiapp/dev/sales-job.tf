resource "databricks_job" "sales_etl" {
  name = "sales-etl-dev"

  run_as {
    service_principal_name = data.terraform_remote_state.platform.outputs.sales_runtime_client_id
  }

  job_cluster {
    job_cluster_key = "sales_etl_cluster"

    new_cluster {
      spark_version = data.databricks_spark_version.latest_lts.id
      node_type_id  = data.databricks_node_type.smallest.id

      num_workers = 1

      data_security_mode = "USER_ISOLATION"
    }
  }

  task {
    task_key = "bronze"

    job_cluster_key = "sales_etl_cluster"

    spark_python_task {
      python_file = "/Workspace/Shared/sales/bronze.py"
    }
  }

  task {
    task_key = "silver"

    depends_on {
      task_key = "bronze"
    }

    job_cluster_key = "sales_etl_cluster"

    spark_python_task {
      python_file = "/Workspace/Shared/sales/silver.py"
    }
  }

  task {
    task_key = "gold"

    depends_on {
      task_key = "silver"
    }

    job_cluster_key = "sales_etl_cluster"

    spark_python_task {
      python_file = "/Workspace/Shared/sales/gold.py"
    }
  }
}