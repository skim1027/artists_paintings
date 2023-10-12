# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@artist_1 = Artist.create!(name: "Leonardo da Vinci", year_born: 1452, country: 'Italy', alive: false)
@artist_2 = Artist.create!(name: "Edgar Degas", year_born: 1834, country: 'France', alive: false)
@artist_3 = Artist.create!(name: "Vincent van Gogh", year_born: 1853, country: 'Netherlands', alive: false)
@artist_4 = Artist.create!(name: "Paul Klee", year_born: 1879, country: 'Germany', alive: false)
@artist_5 = Artist.create!(name: "Yayoi Kusama", year_born: 1929, country: 'Japan', alive: true)
@artist_6 = Artist.create!(name: "Beatrice Modisett", year_born: 1985, country: 'US', alive: true)


@painting_1 = @artist_1.paintings.create!(name: "Mona Lisa", year_painted: 1516, oil_painting: true)
@painting_2 = @artist_1.paintings.create!(name: "The Last Supper", year_painted: 1498, oil_painting: false)
@painting_3 = @artist_1.paintings.create!(name: "Vitruvian Man", year_painted: 1490, oil_painting: false)
@painting_4 = @artist_2.paintings.create!(name: "La Toilette", year_painted: 1886, oil_painting: false)
@painting_5= @artist_2.paintings.create!(name: "Blue Dancers", year_painted: 1897, oil_painting: false)
@painting_6= @artist_2.paintings.create!(name: "Mary Cassatt Seated, Holding Cards", year_painted: 1884, oil_painting: true)
@painting_7 = @artist_3.paintings.create!(name: "The Starry Night", year_painted: 1889, oil_painting: true)
@painting_8 = @artist_3.paintings.create!(name: "Irises", year_painted: 1889, oil_painting: true)
@painting_9 = @artist_3.paintings.create!(name: "Wheatfield with Crows", year_painted:1890 , oil_painting: true)
@painting_10 = @artist_4.paintings.create!(name: "Hammamet with Its Mosque", year_painted: 1914, oil_painting: false)
@painting_11 = @artist_4.paintings.create!(name: "The Twittering Machine", year_painted: 1922, oil_painting: false)
@painting_12 = @artist_4.paintings.create!(name: "Death and Fire", year_painted: 1940, oil_painting: false)
@painting_13 = @artist_5.paintings.create!(name: "Flowers", year_painted: 1991, oil_painting: false)
@painting_14 = @artist_5.paintings.create!(name: "Pumpkin", year_painted: 1992, oil_painting: false)
@painting_15 = @artist_5.paintings.create!(name: "Infinity-Nets", year_painted: 2017, oil_painting: false)
@painting_16 = @artist_6.paintings.create!(name: "Pewter Clouds Being to Lighten", year_painted: 2022, oil_painting: false)
@painting_17 = @artist_6.paintings.create!(name: "Every Ninth Wave II", year_painted: 2018, oil_painting: true)
@painting_18 = @artist_6.paintings.create!(name: "Deep in the Water", year_painted: 2018, oil_painting: true)
