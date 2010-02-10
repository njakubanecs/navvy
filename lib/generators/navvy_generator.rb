require 'rails/generators/migration'
class NavvyGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  
  def self.source_root
    File.join(File.dirname(__FILE__), '..', '..', 'generators', 'navvy', 'templates')
  end
  
  def install_navvy
    migration_template(
      'migration.rb',
      'db/migrate/create_navvy_table.rb'
    )
    
    # @jkreeftmeijer
    # I dont know how this generator works, this is what needs to happen though:
    # => template 'script', 'script/navvy', :chmod => 0755
  end
  
  protected
    def next_migration_number(dirname) #:nodoc:
      "%.3d" % (current_migration_number(dirname) + 1)
    end
end
