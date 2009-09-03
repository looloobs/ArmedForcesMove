class AddUrlSlugToInstallation < ActiveRecord::Migration
  def self.up
    add_column :installations, :url_slug, :string
  end

  def self.down
    remove_column :installations, :url_slug
  end
end
