# frozen_string_literal: true

class FixTypoOnTreinamentos < ActiveRecord::Migration[7.2]
  def change
    rename_column :treinamentos, :destaqueHome, :destaque_home
  end
end
