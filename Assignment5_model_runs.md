Part 1 run 1

envdaviddavid@MacBook-Air-david course-project-DavidBakalov21 % dbt run --select fct_assignment5_totals
07:01:35 Running with dbt=1.9.3
07:01:36 Registered adapter: bigquery=1.9.1
07:01:36 Unable to do partial parsing because a project config has changed
07:01:36 [WARNING]: Did not find matching node for patch with name 'week5_transactions_deduplicated_view' in the 'models' section of file 'models/models_staging.yml'
07:01:37 [WARNING]: Test 'test.econ250_2025.test_web_revenue_should_match' (tests/test_web_revenue_should_match.sql) depends on a node named 'week5_transactions_deduplicated_view' in package '' which was not found
07:01:37 [WARNING]: Test 'test.econ250_2025.not_null_week5_transactions_deduplicated_view_transaction_transactionId.440db59426' (models/models_staging.yml) depends on a node named 'week5_transactions_deduplicated_view' in package '' which was not found
07:01:37 [WARNING]: Test 'test.econ250_2025.not_null_week5_transactions_deduplicated_view_transaction_transactionRevenue.4f12dd6f4c' (models/models_staging.yml) depends on a node named 'week5_transactions_deduplicated_view' in package '' which was not found
07:01:37 [WARNING]: Test 'test.econ250_2025.not_null_week5_transactions_deduplicated_view**surrogate_key.8841330118' (models/models_staging.yml) depends on a node named 'week5_transactions_deduplicated_view' in package '' which was not found
07:01:37 [WARNING]: Test 'test.econ250_2025.unique_week5_transactions_deduplicated_view**surrogate_key.27c2109710' (models/models_staging.yml) depends on a node named 'week5_transactions_deduplicated_view' in package '' which was not found
07:01:37 Found 16 models, 1 seed, 11 data tests, 12 sources, 491 macros
07:01:37  
07:01:37 Concurrency: 2 threads (target='dev')
07:01:37  
07:01:38 1 of 1 START sql incremental model dbakalov.fct_assignment5_totals ............. [RUN]
07:01:46 1 of 1 OK created sql incremental model dbakalov.fct_assignment5_totals ........ [CREATE TABLE (2.4m rows, 439.8 MiB processed) in 7.27s]
07:01:46  
07:01:46 Finished running 1 incremental model in 0 hours 0 minutes and 9.16 seconds (9.16s).
07:01:46  
07:01:46 Completed successfully
07:01:46  
07:01:46 Done. PASS=1 WARN=0 ERROR=0 SKIP=0 TOTAL=1

Part1 run2:
envdaviddavid@MacBook-Air-david course-project-DavidBakalov21 % dbt run --select fct_assignment5_totals
07:03:00 Running with dbt=1.9.3
07:03:00 Registered adapter: bigquery=1.9.1
07:03:00 Found 16 models, 1 seed, 11 data tests, 12 sources, 491 macros
07:03:00  
07:03:00 Concurrency: 2 threads (target='dev')
07:03:00  
07:03:02 1 of 1 START sql incremental model dbakalov.fct_assignment5_totals ............. [RUN]
07:03:19 1 of 1 OK created sql incremental model dbakalov.fct_assignment5_totals ........ [SCRIPT (262.5 MiB processed) in 16.72s]
07:03:19  
07:03:19 Finished running 1 incremental model in 0 hours 0 minutes and 18.29 seconds (18.29s).
07:03:19  
07:03:19 Completed successfully
07:03:19  
07:03:19 Done. PASS=1 WARN=0 ERROR=0 SKIP=0 TOTAL=1

PART 2 RUN 1:

envdaviddavid@MacBook-Air-david course-project-DavidBakalov21 % dbt run --select fct_assignment5_l
ookup
07:12:50 Running with dbt=1.9.3
07:12:51 Registered adapter: bigquery=1.9.1
07:12:51 Found 16 models, 1 seed, 11 data tests, 12 sources, 491 macros
07:12:51  
07:12:51 Concurrency: 2 threads (target='dev')
07:12:51  
07:12:53 1 of 1 START sql incremental model dbakalov.fct_assignment5_lookup ............. [RUN]
07:13:01 1 of 1 OK created sql incremental model dbakalov.fct_assignment5_lookup ........ [CREATE TABLE (928.8k rows, 439.8 MiB processed) in 7.88s]
07:13:01  
07:13:01 Finished running 1 incremental model in 0 hours 0 minutes and 9.43 seconds (9.43s).
07:13:01  
07:13:01 Completed successfully
07:13:01  
07:13:01 Done. PASS=1 WARN=0 ERROR=0 SKIP=0 TOTAL=1
envdaviddavid@MacBook-Air-david course-project-DavidBakalov21 %

PART 2 RUN 2:

envdaviddavid@MacBook-Air-david course-project-DavidBakalov21 % dbt run --select fct_assignment5_lookup
07:16:24 Running with dbt=1.9.3
07:16:24 Registered adapter: bigquery=1.9.1
07:16:24 Found 16 models, 1 seed, 11 data tests, 12 sources, 491 macros
07:16:24  
07:16:24 Concurrency: 2 threads (target='dev')
07:16:24  
07:16:26 1 of 1 START sql incremental model dbakalov.fct_assignment5_lookup ............. [RUN]
07:16:37 1 of 1 OK created sql incremental model dbakalov.fct_assignment5_lookup ........ [MERGE (409.7k rows, 140.1 MiB processed) in 11.19s]
07:16:37  
07:16:37 Finished running 1 incremental model in 0 hours 0 minutes and 12.56 seconds (12.56s).
07:16:37  
07:16:37 Completed successfully
07:16:37  
07:16:37 Done. PASS=1 WARN=0 ERROR=0 SKIP=0 TOTAL=1
