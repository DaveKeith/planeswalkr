class AddSuperTypesColumnToCards < ActiveRecord::Migration
  def change
    add_column :cards, :supertypes, :text, array: true
  end
end
