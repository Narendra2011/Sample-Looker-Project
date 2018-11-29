view: product {
  sql_table_name: dbo.Product ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: is_discontinued {
    type: string
    sql: ${TABLE}.IsDiscontinued ;;
  }

  dimension: package {
    type: string
    sql: ${TABLE}.Package ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.ProductName ;;
  }

  dimension: supplier_id {
    type: number
    sql: ${TABLE}.SupplierId ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.UnitPrice ;;
  }

  measure: count {
    type: count
    drill_fields: [id, product_name]
  }
}
