
view: derived_table {
  derived_table: {
    sql: SELECT
          order_items.sale_price  AS `order_items.sale_price`,
          order_items.order_id  AS `order_items.order_id`,
          COUNT(*) AS `order_items.count`,
          COALESCE(SUM((0E0 +  order_items.sale_price )), 0) AS `price_sum`
      FROM demo_db.order_items  AS order_items
      GROUP BY
          1,
          2
      ORDER BY
          3 DESC ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_items_sale_price {
    type: number
    sql: ${TABLE}.`order_items.sale_price` ;;
  }

  dimension: order_items_order_id {
    type: number
    sql: ${TABLE}.`order_items.order_id` ;;
  }

  dimension: order_items_count {
    type: number
    sql: ${TABLE}.`order_items.count` ;;
  }

  dimension: price_sum {
    type: number
    sql: ${TABLE}.price_sum ;;
  }

  set: detail {
    fields: [
        order_items_sale_price,
  order_items_order_id,
  order_items_count,
  price_sum
    ]
  }
}
