# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Song.destroy_all
Artist.destroy_all

prince = Artist.create!(name: 'Prince')
rtj = Artist.create!(name: 'Run The Jewels')
caamp = Artist.create!(name: 'Caamp')
jgb = Artist.create!(name: 'Jerry Garcia Band')
billie = Artist.create!(name: 'Billie Eilish')
lcd = Artist.create!(name: 'LCD Soundsystem')

rb = prince.songs.create!(title: 'Raspberry Beret', length: 345, play_count: 34)
pr = prince.songs.create!(title: 'Purple Rain', length: 524, play_count: 19)

lhi = rtj.songs.create!(title: 'Legend Has It', length: 2301, play_count: 2300000)
ttm = rtj.songs.create!(title: 'Talk to Me', length: 2301, play_count: 2300000)

song_26 = caamp.songs.create!(title: '26', length: 940, play_count: 150000)
vag = caamp.songs.create!(title: 'Vagabond', length: 240, play_count: 120000)

anbitbb = jgb.songs.create!(title: 'Aint No Bread In The Breadbox', length: 540, play_count: 12000)
thtc = jgb.songs.create!(title: 'The Harder They Come', length: 240, play_count: 120000)

baf = billie.songs.create!(title: 'bury a friend', length: 340, play_count: 1200000)
bg = billie.songs.create!(title: 'bad guy', length: 240, play_count: 100000)

sg = lcd.songs.create!(title: 'Someone Great', length: 500, play_count: 1000000)
icc = lcd.songs.create!(title: 'I Can Change', length: 640, play_count: 100000)

hanging_out = Playlist.create!(name: "Hanging Out")
cleaning = Playlist.create!(name: "Cleaning")
game_night = Playlist.create!(name: "Game Night")

ho_songs = [lhi, vag, thtc, baf, bg].flatten
hanging_out.songs << ho_songs
cleaning.songs << baf
cleaning.songs << bg
cleaning.songs << rb
cleaning.songs << pr
gn_songs = [icc, sg, baf, bg, rb, pr].flatten
game_night.songs << gn_songs