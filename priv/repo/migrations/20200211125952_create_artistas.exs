defmodule Teste.Repo.Migrations.CreateArtistas do
  use Ecto.Migration

  def change do
    create table(:artistas) do
      add :nome, :string
      add :nome_artista, :string
      add :senha, :string
      add :email, :string
      add :descricao, :text
      add :miniatura_art, :text

      timestamps()
    end

  end
end
