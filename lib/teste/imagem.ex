defmodule Teste.Imagem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "imagem" do
    field :descricao, :string
    field :link_img, :string
    field :nome_img, :string
    field :artista_id, :id

    timestamps()
  end

  @doc false
  def changeset(imagem, attrs) do
    imagem
    |> cast(attrs, [:link_img, :descricao, :nome_img])
    |> validate_required([:link_img, :nome_img])
  end
  
end
