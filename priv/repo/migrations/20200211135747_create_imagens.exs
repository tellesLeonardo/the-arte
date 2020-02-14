defmodule Teste.Repo.Migrations.CreateImagens do
  use Ecto.Migration

  def change do
    create table(:imagens) do
      add :link_img, :text
      add :descricao, :text
      add :nome_img, :string
      add :artista_id, references(:artistas, on_delete: :nothing)

      timestamps()
    end

    create index(:imagens, [:artista_id])
  end
end
