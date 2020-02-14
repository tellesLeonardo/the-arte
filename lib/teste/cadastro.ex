defmodule Teste.Cadastro do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cadastro" do
    field :login, :string
    field :senha, :string

    timestamps()
  end

  @doc false
  def changeset(cadastro, attrs) do
    cadastro
    |> cast(attrs, [:login, :senha])
    |> validate_required([:login, :senha])
  end
end
