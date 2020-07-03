class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|

      t.text :body
      t.string :picture
      t.references :user, null: false, foreign_key: true
      t.string :subject

      t.timestamps
    end
  end
end
