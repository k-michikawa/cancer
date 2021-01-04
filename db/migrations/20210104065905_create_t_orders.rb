class CreateTOrders < ActiveRecord::Migration[6.1]
  def up
    create_table :t_orders, id: :uuid do |t|
      t.uuid    :product_id, null: false
      t.uuid    :orderer_id, null: false
      t.uuid    :seller_id,  null: false
      # timestampsつけとけば勝手にやってくれるので任せておく
      # t.date    :created_at, null: false
      # t.date    :updated_at
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end

    execute <<-SQL
      GRANT INSERT, SELECT, UPDATE, DELETE ON public.t_orders TO cancer;
    SQL
  end

  def down
    drop_table :t_orders
  end
end
