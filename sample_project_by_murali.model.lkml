connection: "deftdb"

# include all the views
include: "*.view"

datagroup: sample_project_by_murali_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sample_project_by_murali_default_datagroup

explore: order_item{
  join: order {
    type: left_outer
    sql_on: ${order_item.order_id}=${order.id} ;;
    relationship: many_to_one
  }
  join: product {
    type: left_outer
    sql_on: ${order_item.product_id} =${product.id};;
    relationship: many_to_one
  }
  join: customer {
    type: left_outer
    sql_on: ${order.customer_id}=${customer.id} ;;
    relationship: many_to_one
  }
  join: supplier {
    type: left_outer
    sql_on: ${product.supplier_id}=${supplier.id} ;;
    relationship: many_to_one
  }
}

#   joins:
#     - join: order
#       type: left_outer
#       sql_on: ${order_item.order_id} = ${order.id}
#       relationship: many_to_one

#     - join: product
#       type: left_outer
#       sql_on: ${order_item.product_id} = ${product.id}
#       relationship: many_to_one

#     - join: customer
#       type: left_outer
#       sql_on: ${order.customer_id} = ${customer.id}
#       relationship: many_to_one

#     - join: supplier
#       type: left_outer
#       sql_on: ${product.supplier_id} = ${supplier.id}
#       relationship: many_to_one


# - explore: customer

# - explore: order
#   joins:
#     - join: customer
#       type: left_outer
#       sql_on: ${order.customer_id} = ${customer.id}
#       relationship: many_to_one


# - explore: product
#   joins:
#     - join: supplier
#       type: left_outer
#       sql_on: ${product.supplier_id} = ${supplier.id}
#       relationship: many_to_one


# - explore: supplier
