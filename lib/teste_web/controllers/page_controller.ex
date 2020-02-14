defmodule TesteWeb.PageController do
  alias Teste.{Repo,Cadastro,Querie, Imagem, Artista}
  use TesteWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(200)
    |> render("index.html")
  end

  def show(conn, params) do
    params |> IO.inspect
    conn
    |> put_status(200)
    |> render("historia.html")
  end

  def view(conn, params) do
    tupla ={}
    artista = Querie.artista(params["id"])  
    obras = Querie.obras(artista[:id])
    
    case artista do
      nil -> render(conn, "404.html")
      _ -> 
        conn
        |> put_status(200)
        |> render("artistas.html", %{info: artista,obras: obras})
    end
    
    
  end

  def tenta(conn, params) do
    params |> IO.inspect
    changeset = Imagem.changeset(%Imagem{}, params)

    conn
    |> render("tentativa.html", %{changeset: changeset})
  end

  

  def create(conn, tentativa) do
    tentativa["imagem"] |> IO.inspect
    
    Repo.insert(%Imagem{
      link_img: tentativa["imagem"]["link_img"],
      artista_id: nome_temp(tentativa["imagem"]["nome_art"]),
      nome_img: tentativa["imagem"]["nome_img"],
      descricao: tentativa["imagem"]["descricao"]
    })

    conn
    |>  render("index.html")

  end
  
  def cadastro(conn, params) do
    changeset = Cadastro.changeset(%Cadastro{}, params)

    conn
    |> render("cadastro.html",%{changeset: changeset})
  end 


  def login(conn, params) do
    changeset = Cadastro.changeset(%Cadastro{}, params)

    conn
    |> render("login.html",%{changeset: changeset,login: :login})
  end 

  def save_cad(conn,params) do
    cad = params["cadastro"] |> IO.inspect
    
      Repo.insert(%Cadastro{
        login: cad["nome_cad"],
        senha: cad["senha_cad"]
      })

    conn
    |> render("index.html")
  end

  def login_user(conn,params) do
    log = params["cadastro"]
    Repo.get_by(Cadastro, login: log["nome_log"],senha: log["senha_log"]) |> IO.inspect

    
    conn
    |> render("index.html")
  end

  
  def nome_temp(name) do 
    map_id=%{"leonardo" => 1, "leo" => 2}

    map_id
    |> Map.get(name)

  end


end
