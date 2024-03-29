#!/usr/bin/ruby
# vim: set ft=ruby sw=2 ts=2 sts=2 et :
require 'date'
$: << File.expand_path('../', __FILE__)

puts <<EOS
<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/style.css" />
    <title>nick rinehart</title>
  </head>
  <body>
EOS

if ARGV[0] != 'pages/index.html'
  puts <<EOS
    <header id="global">
      <nav>
        <ul>
          <li><a href="/album/ultra-20">20 week ultrasound</a></li>
          <li><a href="/album/ultra-29">29 week ultrasound</a></li>
          <li><a href="/album/belly">Mommy's Belly</a></li>
          <li><a href="/nursery">Nick's Nursery</a></li>
        </ul>
      </nav>
      <hgroup>
        <h1><a href="/" title="nick">nick</a></h1>
        <h2>brought to you by spennifer</h2>
      </hgroup>
    </header>
EOS
end

puts <<EOS
    <section id="body">
EOS

page = ARGV.shift
begin
  require page
rescue LoadError
  File.open(page) {|f|
    print f.read
  }
end

puts <<EOS
    </section>
    <footer>
      Designed by Team Spennifer &copy;#{Date.today.year}
    </footer>
  </body>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js" defer></script>
  <script type="text/javascript" src="/script.js" defer></script>
</html>
EOS
