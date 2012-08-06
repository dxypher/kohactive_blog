class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :permalink
      t.references :author

      t.timestamps
    end
    add_index :posts, :author_id
  end
end
