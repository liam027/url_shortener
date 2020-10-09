class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.references  :redirect
      t.string      :ip_address
      t.integer     :count

      t.timestamps
    end
  end
end
