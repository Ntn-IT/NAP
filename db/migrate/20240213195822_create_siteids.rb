class CreateSiteids < ActiveRecord::Migration[7.0]
  def change
    create_table :siteids do |t|
      t.integer :site_ID
      t.text :site_Region
      t.text :site_Country
      t.text :site_Town
      t.text :site_Street
      t.integer :site_NStreet
      t.integer :site_Postal

      t.timestamps
    end
  end
end
