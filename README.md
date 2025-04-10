Explanation of part4 decisions:

Let's start from partitioning. Partitioning is basicaly dividing table into smaller parts, to optimize query as bigQuery will just skip partitions that are not suitable for filter, thats why I decided to partition by order purchase time_stamp, since all other timestamp columns (except for order_estimated_delivery_date) had nulls, which can create null partions

Next goes clustering, basically sorting within partions. I decided to use customer_id since it repeats across many rows so it will be easisier for bigQuery to sort by it

Then goes many cte's and their joins. From interesting I decided to use inner joins not to have situation where I only got a small part of the data.

Project overview:

This project analyzes olist sales data
It consists of 7 datasets:
olist_customers_dataset.csv- data about customers
olist_order_items_dataset.csv -data about products inside items
olist_order_payments_dataset.csv - how customer paid for his order
olist_orders_dataset.csv - general order data
olist_products_dataset.csv - data about products
olist_sellers_dataset.csv - data about who sell product
product_category_name_translation.csv - names of categories and thier translation to english language

Interesting thing: when I uploaded product_category_name_translation.csv it required skipping first row as header, since BigQUery considered it as data.

Staging:
Can't say much about sellers and customers since no derived columns can be generated from that data

fp_stg_fp_olist_order_items_dataset- casted all numeric values to float, since BigQuery for some reason considered them as a timestamp. Created total_value, which represents total vlaue for item

fp_stg_fp_olist_order_payments_dataset - created to derived columns, one represents whether customer paid with debit card, other shows whether user defined paymnet method

fp_stg_fp_olist_orders_dataset - add column which show how many days it is needed to approve order

fp_stg_fp_olist_products_dataset - added column, to calculate product volume

fp_stg_fp_product_category_name_translation - added columns to define whether category names are identical

Mart models:
fp_customer_behaviour: New vs. returning customers, purchase frequency, customer lifetime value (total amount of revenue received from each customer)

fp_payment_analysis: Payment method trends, installment patterns, regional preferences

fp_order_performance_analysis: monthly order metrics including number of orders, revenue, split by one or more categorical fields
