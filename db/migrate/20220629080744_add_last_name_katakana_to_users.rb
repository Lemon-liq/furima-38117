class AddLastNameKatakanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name_katakana, :string, null: false
  end
end
