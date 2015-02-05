#!/usr/bin/env ruby
require_relative "../lib/connect_four"

puts "Welcome to connect four"
dominik = ConnectFour::Player.new({ token: "\u25cf", name: "Dominik" })
lukasz = ConnectFour::Player.new({ token: "\u25cb", name: "Łukasz" })
players = [dominik, lukasz]
ConnectFour::Game.new(players).play
