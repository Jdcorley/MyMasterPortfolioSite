class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.file_field :main_image
      t.file_field :thumb_image

      t.timestamps
    end
  end
end
