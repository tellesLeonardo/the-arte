defmodule Teste.Querie do
  import Ecto.Query
  alias Teste.{Repo, Imagem, Artista}

  def artista(id) do
    Artista
    |> where([art], art.id == ^id)
    |> Repo.all()
    |> Enum.map(fn map -> drop_all(map) end)
    |> case do
      [] -> nil
      query -> hd(query)
    end
  end

  def obras(id) do
    try do
      Imagem
      |> where([img], img.artista_id == ^id)
      |> Repo.all()
      |> Enum.map(fn map -> drop_all(map) end)
    rescue
      Ecto.Query.CastError -> false
      ArgumentError -> false
    end
  end

  def drop_all(map) do
    map
    |> Map.drop([:__meta__, :updated_at, :inserted_at, :__struct__])
  end

  def art() do
    Repo.all(Artista)
    |> Enum.map(fn art -> drop_all(art) end)
  end

  def inser() do
    Repo.insert(%Artista{
      nome: "nome_cad",
      email: "email_cad",
      senha: "senha_cad",
      descricao: "descricao_cad",
      nome_artista: "nome_art_cad"
    })
  end
end
