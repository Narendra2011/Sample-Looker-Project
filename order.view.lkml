view: order {
  sql_table_name: dbo."Order" ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.CustomerId ;;
  }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.OrderDate ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.OrderNumber ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.TotalAmount ;;
  }
  dimension:order_amount_range  {
    type: tier
    tiers: [0,1000,2000,3000,4000,5000,6000,7000,8000,9000,10000]
    style: relational
    sql: ${total_amount} ;;
  }
  measure: total_customer_amount {
    type: sum
    sql: ${total_amount} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, customer.id, customer.first_name, customer.last_name]
  }
}
