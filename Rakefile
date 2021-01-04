require 'bundler/setup'
require 'active_record'
require 'pg'
require 'yaml'
require 'erb'

include ActiveRecord::Tasks

root_dir = File.dirname(__FILE__)

database_yml_path = File.join(root_dir, 'config', 'database.yml')
database_yml_file = YAML.safe_load(ERB.new(File.read(database_yml_path)).result)

DatabaseTasks.env = 'migrate'
DatabaseTasks.db_dir = File.join(root_dir, 'db')
DatabaseTasks.database_configuration = database_yml_file
DatabaseTasks.migrations_paths = File.join(root_dir, 'db', 'migrations')

task :environment do
  ActiveRecord::Base.configurations = database_yml_file
  ActiveRecord::Base.establish_connection :migrate
end

desc 'migrateファイル生成するやつ'
task :gen_migrate_file, [:filename] do |_, args|
  enhanced_filename = "`date '+%Y%m%d%H%M%S'`_#{args[:filename]}"
  sh "touch #{root_dir}/db/migrations/#{enhanced_filename}.rb"
end

load 'active_record/railties/databases.rake'
