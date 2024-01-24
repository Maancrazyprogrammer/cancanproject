class CreateBugs < ActiveRecord::Migration[7.1]
  def change
    create_table :bugs do |t|
      t.string :bug_title
      t.string :bug_des
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
