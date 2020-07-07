class CreateRemarks < ActiveRecord::Migration[6.0]
  def change
    create_table :remarks do |t|
        t.belongs_to :user
        t.belongs_to :message
        t.text :body
        t.string :picture
    end
  end
end
