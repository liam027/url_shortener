class ChangeDefaultVisitCount < ActiveRecord::Migration[6.0]
  def change
    change_column :visits, :count, :integer, default: 1
  end
end
