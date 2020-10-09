class CreateRedirects < ActiveRecord::Migration[6.0]
  def change
    create_table :redirects do |t|
      t.string :token
      t.text :full_url

      t.timestamps
    end
  end
end
