module CreateTableCameras

import SearchLight.Migrations: create_table, column, columns, pk, add_index, drop_table, add_indices

function up()
  create_table(:cameras) do
    [
      pk()
      column(:name, :string)
      column(:number, :integer)
      column(:latitude, :float)
      column(:longitude, :float)
    ]
  end

  # Only the :Camera field has to be searched through quickly
  add_index(:cameras, :name)
end

function down()
  drop_table(:cameras)
end

end
