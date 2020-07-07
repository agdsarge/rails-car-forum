class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
        t.belongs_to :user, foreign_key: true
        t.belongs_to :friend
    end
  end
end
