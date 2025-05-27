class AddDescriptionAndLogoUrlToBrands < ActiveRecord::Migration[8.0]
  def change
    add_column :brands, :description, :text
    add_column :brands, :logo_url, :string
  end
end
