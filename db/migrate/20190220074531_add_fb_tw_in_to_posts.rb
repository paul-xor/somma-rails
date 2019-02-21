class AddFbTwInToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :post_on_facebook, :boolean
    add_column :posts, :post_on_instagram, :boolean
    add_column :posts, :post_on_twitter, :boolean
  end
end
