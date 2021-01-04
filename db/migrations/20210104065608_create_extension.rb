class CreateExtension < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE EXTENSION IF NOT EXISTS "uuid-ossp"
    SQL
  end

  def down
    execute <<-SQL
      DROP EXTENSION IF EXISTS "uuid-ossp"
    SQL
  end
end
