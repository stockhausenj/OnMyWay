#!/usr/bin/env ruby
require 'rubygems'
require 'json'
print "bottom left X coordinate of bottom left cell: "
xcord = gets
print "bottom left Y coordinate of bottom left cell: "
ycord = gets
print "beginning cube #: "
cubeNum = gets
print "more than 1 quad - yes/no: "
oneQuad = gets
quadCount = 0
if oneQuad.strip == "yes" then
  print "horizontal or vertical expansion - h/v: "
  direction = gets
  if direction.strip == 'h' then
    print "number of additional quads (counting horizontally): "
  else
    print "number of additional quads (counting vertically): "
  end
  quadCount = gets
end
quadCount = (quadCount.to_i + 1).to_i
xcord = xcord.to_i
ycord = ycord.to_i
cubeNum = cubeNum.to_i
geoHash = Hash.new
File.open("/var/www/html/OnMyWay/genVectors.json", "a") do |f|
  quadCount.times do |count|
    geoHash = {'geometry' => {'coordinates' => [[[xcord, ycord], [xcord, ycord + 1], [xcord + 1, ycord + 1], [xcord + 1, ycord]]], 'type' => 'Polygon'}, 
                     'id' => cubeNum, 
             'properties' => {'name' => 'jay'},
                   'type' => 'Feature'}      
    f.write(geoHash.to_json)
    f.puts(",\n")
    cubeNum += 1
    geoHash = {'geometry' => {'coordinates' => [[[xcord + 5, ycord], [xcord + 5, ycord + 1], [xcord + 6, ycord + 1], [xcord + 6, ycord]]], 'type' => 'Polygon'}, 
                     'id' => cubeNum, 
             'properties' => {'name' => 'jay'},     
                   'type' => 'Feature'}      
    f.write(geoHash.to_json)
    f.puts(",\n")
    cubeNum += 1
    geoHash = {'geometry' => {'coordinates' => [[[xcord, ycord + 5], [xcord, ycord + 6], [xcord + 1, ycord + 6], [xcord + 1, ycord + 5]]], 'type' => 'Polygon'}, 
                     'id' => cubeNum, 
             'properties' => {'name' => 'jay'},
                   'type' => 'Feature'}      
    f.write(geoHash.to_json)
    f.puts(",\n")
    cubeNum += 1
    geoHash = {'geometry' => {'coordinates' => [[[xcord + 5, ycord + 5], [xcord + 5, ycord + 6], [xcord + 6, ycord + 6], [xcord + 6, ycord + 5]]], 'type' => 'Polygon'}, 
                     'id' => cubeNum, 
             'properties' => {'name' => 'jay'},
                   'type' => 'Feature'}      
    f.write(geoHash.to_json)
    f.puts(",\n")
    cubeNum += 1
    if direction.strip == 'h' then
      xcord += 13
    else
      ycord += 13
    end
  end
end
