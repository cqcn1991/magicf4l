class AddImportantToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :important, :boolean, default: false
  end
end
