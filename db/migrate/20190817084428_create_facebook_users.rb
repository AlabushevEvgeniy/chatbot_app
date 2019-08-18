class CreateFacebookUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :facebook_users do |t|
      t.string :user_id

      t.timestamps
    end
  end
end
