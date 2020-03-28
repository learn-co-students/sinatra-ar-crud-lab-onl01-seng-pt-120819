class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :article_title
      t.string :article_content

    end
  end
end
