require 'bundler'
Bundler.require
ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "hq_dev"
)
require_all 'app'