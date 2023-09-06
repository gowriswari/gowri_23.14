
view: testing_demo {
  derived_table: {
    sql: SELECT
          order_items.id  AS `order_items.id`,
          order_items.inventory_item_id  AS `order_items.inventory_item_id`,
          COUNT(*) AS `order_items.count`,
          COUNT(DISTINCT order_items.id ) AS `count_distint_id`
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

  dimension: order_items_id {
    type: number
    sql: ${TABLE}.`order_items.id` ;;
  }

  dimension: order_items_inventory_item_id {
    type: number
    sql: ${TABLE}.`order_items.inventory_item_id` ;;
  }

  dimension: order_items_count {
    type: number
    sql: ${TABLE}.`order_items.count` ;;
  }

  dimension: count_distint_id {
    type: number
    sql: ${TABLE}.count_distint_id ;;
  }

  measure: aveg_count{
    type: average
    sql: ${count} ;;
  }
  set: detail {
    fields: [
        order_items_id,
  order_items_inventory_item_id,
  order_items_count,
  count_distint_id
    ]
  }
}
