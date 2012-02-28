<?php
/* vim: set ft=php sw=2 ts=2 sts=2 et : */
array_shift($argv);
$argv = array_values($argv);
?>
<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/style.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script type="text/javascript" src="/script.js"></script>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.5.3/modernizr.min.js" async="true"></script>
    <script type="text/javascript">
      var _gaq = [['_setAccount', 'UA-17934068-1'], ['_trackPageview']];
      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    </script>
    <title>nick rinehart</title>
  </head>
  <body>
    <header id="global">
      <hgroup>
        <h1><a href="/" title="nick">nick</a></h1>
        <h2>brought to you by spennifer</h2>
      </hgroup>
      <nav>
        <ul>
          <li><a href="/album/ultra-20">20 week ultrasound</a></li>
          <li><a href="/album/ultra-29">29 week ultrasound</a></li>
          <li><a href="/album/belly">Mommy's Belly</a></li>
          <li><a href="/nursery">Nick's Nursery</a></li>
        </ul>
      </nav>
    </header>
    <section id="body">
<?php
if ( !file_exists(dirname(__FILE__) . "/{$argv[0]}") )
  $argv[0] .= ".php";

include dirname(__FILE__) . "/{$argv[0]}";
?>
    </section>
    <footer>
      Designed by Team Spennifer &copy;<?=date('Y')?>
    </footer>
  </body>
</html>
