class CreateTags < ActiveRecord::Migration[7.2]
  def change
    create_table :tags, id: :uuid do |t|
      t.string :titulo

      t.timestamps
    end
  end
end
