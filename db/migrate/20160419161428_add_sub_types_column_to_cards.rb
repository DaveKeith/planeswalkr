class AddSubTypesColumnToCards < ActiveRecord::Migration
  def change
    add_column :cards, :subtypes, :integer, array: true
  end
end
