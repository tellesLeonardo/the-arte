defmodule Teste.Querie do
    import Ecto.Query
    alias Teste.{Repo,Imagem, Artista}

    def artista(id) do
        query=
        Artista
        |> where([art], art.id == ^id)
        |> Repo.all
        |> Enum.map(fn map -> drop_all(map) end)
        |> case do 
            [] -> nil
            query -> hd(query)
        end 
        
    end


    def obras(id) do
        try do
            query=
            Imagem 
            |> where([img], img.artista_id == ^id)  
            |> Repo.all  
            |> Enum.map(fn map -> drop_all(map) end)
        rescue
            (Ecto.Query.CastError) -> false
            (ArgumentError) -> false
        end
    end

    def drop_all(map) do
        map
        |> Map.drop([:__meta__,:updated_at,:inserted_at,:__struct__])

    end


end


