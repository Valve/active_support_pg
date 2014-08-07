require 'pg'
require 'yaml'
require 'minitest/spec'
require 'minitest/autorun'
def run_pg_function(function, arg)
  sql = "select #{function}('#{arg}')"
  first_result = exec_sql(sql).first.to_a
  first_result.first.last
end

def exec_sql(sql)
  pg_conn.exec(sql)
end

def db_config
  @db_config ||= YAML::load_file('./database.yml')
end

def pg_conn
  @pg_conn ||= PG::Connection.new(db_config)
end

def read_library_code
  File.read('./src/as.sql')
end
