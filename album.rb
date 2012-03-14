#!/usr/bin/ruby
# vim: set ft=ruby sw=2 ts=2 sts=2 et :
require 'json'
album = File.open("albums/#{ARGV[0]}.json") {|f| JSON.load(f) }
puts <<EOS
      <h1>#{album['title']}</h1>
      <div class="album">
        <div class="arrow arrowleft">&lt;</div>
        <div class="main">
EOS
album['photos'].each {|photo|
  puts <<EOS
          <img src="/#{photo}" />
EOS
}

puts <<EOS
        </div>
        <div class="arrow arrowright">&gt;</div>
      </div>
EOS
