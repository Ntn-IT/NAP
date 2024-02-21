class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    c :blogs do |t|
      t.text :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
