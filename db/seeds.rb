require 'json'
require 'open-uri' #leer un enlace
url = 'https://tmdb.lewagon.com/movie/top_rated'
html_doc = URI.open(url).read  #abre el enlace y leelo, transformandolo en un texto como string
movies = JSON.parse(html_doc)["results"] #json.parse pasa el string para hash (el html_doc es un string) otorgandonos un ruby hash


movies.each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end
