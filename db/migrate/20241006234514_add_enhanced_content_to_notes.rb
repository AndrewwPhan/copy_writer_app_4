class AddEnhancedContentToNotes < ActiveRecord::Migration[7.2]
  def change
    add_column :notes, :enhanced_content, :text
  end
end
