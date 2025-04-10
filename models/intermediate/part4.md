Explanation of part4 decisions:

Let's start from partitioning. Partitioning is basicaly dividing table into smaller parts, to optimize query as bigQuery will just skip partitions that are not suitable for filter, thats why I decided to partition by order purchase time_stamp, since all other timestamp columns (except for order_estimated_delivery_date) had nulls, which can create null partions

Next goes clustering, basically sorting within partions. I decided to use customer_id since it repeats across many rows so it will be easisier for bigQuery to sort by it

Then goes many cte's and their joins. From interesting I decided to use inner joins not to have situation where I only got a small part of the data.
