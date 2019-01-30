class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.file_field :featured_image
      t.file_field :featured_thumb_image

      t.timestamps
    end
  end
end
