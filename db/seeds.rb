# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

 url = "https://tmdb.lewagon.com/movie/top_rated"
 movie_serialized = URI.open(url).read
 movie = JSON.parse(movie_serialized)
 movie_result = movie["results"]
 image_url_start =  "https://image.tmdb.org/t/p/original/"

 movie_result.each do |m|
  puts m["title"]
  Movie.create(title: m["title"], poster_url: "#{image_url_start}#{m['poster_path']}", rating: m["vote
    _average"], overview: m["overview"])
 end
