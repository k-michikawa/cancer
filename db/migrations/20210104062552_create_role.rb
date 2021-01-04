class CreateRole < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE ROLE cancer LOGIN PASSWORD 'cancer'
    SQL
  end

  def down
    execute <<-SQL
      DROP ROLE cancer
    SQL
  end
end
