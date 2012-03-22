require 'rake/clean'

CLOBBER.include('public/*.html', 'public/*.js', 'public/*.css', 'public/ajax', 'public/album')

PAGES = FileList['pages/*']
JAVASCRIPT = FileList['js/*']
CSS = FileList['css/*']
ALBUMS = FileList['albums/*']

task :default => [*PAGES.pathmap('public/%f'), *PAGES.pathmap('public/ajax/%f'), *JAVASCRIPT.pathmap('public/%f'), 'public/style.css', *ALBUMS.pathmap('public/album/%n.json'), *ALBUMS.pathmap('public/album/%n.html'), *ALBUMS.pathmap('public/ajax/album/%n.html')]

directory 'public/album'
directory 'public/ajax/album'

PAGES.each do |source|
  pageout = source.pathmap 'public/%f'
  ajaxout = source.pathmap 'public/ajax/%f'

  if ENV['compress']
    file pageout => ['page.rb', 'util/minifier.js', source] do
      sh "./page.rb #{source} | node util/minifier.js > #{pageout}"
    end

    file ajaxout => ['public/ajax', 'util/minifier.js', source] do
      sh "node util/minifier.js < #{source} > #{ajaxout}"
    end
  else
    file pageout => ['page.rb', source] do
      sh "./page.rb #{source} > #{pageout}"
    end

    file ajaxout => ['public/ajax', source] do
      cp source, ajaxout
    end
  end
end

JAVASCRIPT.each do |source|
  out = source.pathmap 'public/%f'

  file out => [source] do
    if ENV['compress']
      sh "yuicompressor #{source} > #{out}"
    else
      cp source, out
    end
  end
end

file 'public/style.css' => CSS do
  if ENV['compress']
    sh "cat #{CSS.join(' ')} | yuicompressor --type css > public/style.css"
  else
    sh "cat #{CSS.join(' ')} > public/style.css"
  end
end

ALBUMS.each do |source|
  jsonout = source.pathmap "public/album/%f"
  pageout = source.pathmap "public/album/%n.html"
  ajaxout = source.pathmap "public/ajax/album/%n.html"

  file jsonout => ['public/album', source] do
    cp source, jsonout
  end

  if ENV['compress']
    file pageout => ['public/album', 'page.rb', 'album.rb', 'util/minifier.js', source] do
      sh "./page.rb album #{source.pathmap '%n'} | node util/minifier.js > #{pageout}"
    end

    file ajaxout => ['public/ajax/album', 'album.rb', 'util/minifier.js', source] do
      sh "./album.rb #{source.pathmap '%n'} | node util/minifier.js > #{ajaxout}"
    end
  else
    file pageout => ['public/album', 'page.rb', 'album.rb', source] do
      sh "./page.rb album #{source.pathmap '%n'} > #{pageout}"
    end

    file ajaxout => ['public/ajax/album', 'album.rb', source] do
      sh "./album.rb #{source.pathmap '%n'} > #{ajaxout}"
    end
  end
end
