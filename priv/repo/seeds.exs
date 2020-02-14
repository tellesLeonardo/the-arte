# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Teste.Repo.insert!(%Teste.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Teste.{Repo, Imagem, Artista}

# {_ok, artista_1} =
#   Repo.insert(%Artista{
#     nome: "leonardo",
#     nome_artista: "me chamam de leo",
#     email: "leso@teste.com",
#     senha: "123123",
#     descricao: "o meu amor pelas pessoas me movia, mas hoje o que me move é esse mundo hilário onde nada faz sentido",
#     miniatura_art: "https://i.pinimg.com/originals/e4/7d/7e/e47d7ee351636f267a193419aaeaa084.jpg"
#   })

# {_ok, artista_2} =
#   Repo.insert(%Artista{
#     nome: "leo",
#     nome_artistico: "vc que acha",
#     contato: "027 99943342112",
#     descricao: "eu odeio, mas eu me divirto então sempre é legal ",
#     obra_principal:
#       "https://vignette.wikia.nocookie.net/onepiece/images/2/29/Kaido_Anime_Infobox.png/revision/latest/scale-to-width-down/340?cb=20191222142606&path-prefix=pt"
#   })

Repo.insert(%Imagem{
  link_img:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS2yrl6nkTk8IMw9KgSp0MnExywRBzb73x_WST9BqtX6lhw_vhv",
  descricao:
    "imagem de um homem que perdeu sua vida e sua amor em um jornada não por vingança e sim pela morte",
  nome_img: "shichika hachiretsu",
  artista_id: 1
})

# Repo.insert(%Imagem{
#   link_img:
#     "https://scontent-yyz1-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/82225599_218595899166301_1377012230622001085_n.jpg?_nc_ht=scontent-yyz1-1.cdninstagram.com&_nc_cat=101&_nc_ohc=hn7FIyYG4EUAX8bZaGY&oh=dc0660b0914ec086494554ce3f3042f2&oe=5ED983D1",
#   descricao: "gon e sua furia eterna",
#   nome_img: "Gon em furia",
#   artista_id: 2
# })
