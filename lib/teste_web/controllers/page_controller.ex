defmodule TesteWeb.PageController do
  import Ecto.Query
  alias Teste.{Repo, Artista, Querie, Imagem, Artista}
  use TesteWeb, :controller

  def index(conn, _params) do
    artistas = Querie.art()

    arte =
      Enum.map(artistas, fn art ->
        case art.miniatura_art do
          "" ->
            Map.put(
              art,
              :miniatura_art,
              "data:image/jpeg;base64,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"
            )

          _ ->
            art
        end
      end)

    conn
    |> put_status(200)
    |> render("index.html", %{artistas: arte})
  end

  def show(conn, _params) do
    conn
    |> put_status(200)
    |> render("historia.html")
  end

  def view(conn, params) do
    artista = Querie.artista(params["id"])
    obras = Querie.obras(artista[:id])

    case artista do
      nil ->
        render(conn, "404.html")

      _ ->
        conn
        |> put_status(200)
        |> render("artistas.html", %{info: artista, obras: obras})
    end
  end

  def tenta(conn, params) do
    changeset = Imagem.changeset(%Imagem{}, params)

    conn
    # |>IO.inspect
    |> render("tentativa.html", %{changeset: changeset})
  end

  def create(conn, tentativa) do
    # tentativa["imagem"]

    Repo.insert(%Imagem{
      link_img: tentativa["imagem"]["link_img"],
      artista_id: nome_temp(tentativa["imagem"]["nome_art"]),
      nome_img: tentativa["imagem"]["nome_img"],
      descricao: tentativa["imagem"]["descricao"]
    })

    conn
    |> redirect(to: "/index")
  end

  def cadastro(conn, params, conteudo \\ nil) do
    changeset = Artista.changeset(%Artista{}, params)

    conn
    |> render("cadastro.html", %{changeset: changeset, conteudo: conteudo})
  end

  def login(conn, params, conteudo \\ nil) do
    changeset = Artista.changeset(%Artista{}, params)

    conn
    |> render("login.html", %{changeset: changeset, conteudo: conteudo})
  end

  def save_cad(conn, params) do
    cad = params["artista"]
    # photo= cad["miniatura_cad"]
    # realPhoto = Path.join(photo.path, photo.filename)
    # Plug.Upload.

    Artista
    |> where([cad], cad.nome == ^cad["nome_cad"] and cad.senha == ^cad["senha_cad"])
    |> Repo.exists?()
    |> case do
      false ->
        Repo.insert(%Artista{
          nome: cad["nome_cad"],
          email: cad["email_cad"],
          senha: cad["senha_cad"],
          descricao: cad["descricao_cad"],
          nome_artista: cad["nome_art_cad"],
          miniatura_art: cad["miniatura_cad"]
        })

        conn
        |> redirect(to: "/index")

      true ->
        cadastro(conn, cad, "já temos um usuario cadastrado com essas infromações")
    end
  end

  def login_user(conn, params) do
    log = params["artista"]

    art =
      Repo.get_by(Artista, nome: log["nome_log"], senha: log["senha_log"])
      |> case do
        nil ->
          login(conn, log, "não temos esse usuario cadastrado")

        art ->
          IO.inspect(art)

          conn
          |> IO.inspect()
          |> redirect(to: "/index")
      end
  end

  def nome_temp(name) do
    result = Repo.get_by(Artista, nome_artista: name)

    result
    |> case do
      nil -> nil
      _ -> result.id
    end
  end
end
