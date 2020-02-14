defmodule Teste.Artista do
  use Ecto.Schema
  import Ecto.Changeset

  schema "artista" do
    field :contato, :string
    field :descricao, :string
    field :nome, :string
    field :nome_artistico, :string
    field :obra_principal, :string

    timestamps()
  end

  @doc false
  def changeset(artista, attrs) do
    artista
    |> cast(attrs, [:nome, :nome_artistico, :contato, :descricao, :obra_principal])
    |> validate_required([:nome_artistico, :contato, :obra_principal])
  end
end
