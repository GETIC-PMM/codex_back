class AddThumbnailToTreinamentos < ActiveRecord::Migration[7.2]
  def change
    add_column :treinamentos, :thumbnail, :string
  end
end
