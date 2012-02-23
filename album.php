#!/usr/bin/php
<?php
/* vim: set ft=php sw=2 ts=2 sts=2 et : */
$album = json_decode(file_get_contents(dirname(__FILE__) . "/albums/{$argv[1]}.json"), true);
?>
      <h1><?= $album['title'] ?></h1>
      <div class="album">
        <div class="arrow arrowleft">&lt;</div>
        <div class="main">
<?php
foreach ( $album['photos'] as $photo )
{
?>
          <img src="<?= $photo ?>" />
<?php
}
?>
        </div>
        <div class="arrow arrowright">&gt;</div>
      </div>
