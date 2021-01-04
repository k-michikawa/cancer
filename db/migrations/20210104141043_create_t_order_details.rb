class CreateTOrderDetails < ActiveRecord::Migration[6.1]
  def up
    create_table :t_order_details, id: false do |t|
      t.uuid    :order_id,     null: false, index: true
      t.integer :price,        null: false
      t.text    :product_name, null: false
    end
    add_foreign_key :t_order_details, :t_orders, column: :order_id

    execute <<-SQL
      GRANT INSERT, SELECT, UPDATE, DELETE ON public.t_order_details TO cancer;
    SQL
  end

  def down
    drop_table :t_order_details
  end
end
