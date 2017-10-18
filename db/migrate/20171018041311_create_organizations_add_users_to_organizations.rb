class CreateOrganizationsAddUsersToOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name, default: ""
      t.timestamps
    end

    add_reference :users, :organization, foreign_key: true
  end
end
