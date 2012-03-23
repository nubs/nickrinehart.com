/* vim: set ft=javascript sw=2 ts=2 sts=2 et : */
function init() {
  $('header#index li').mouseover(function(event) {
    var linkno = $(this).attr('id').substring(5);
    $('img#face').attr('src', '/index-' + linkno + '.jpg');
  });

  $('header a, nav a').click(function(event) {
    event.preventDefault();
    $('section#body').load('/ajax/' + $(this).attr('href'), init);
  });

  initAlbum();
}

function initAlbum() {
  var totalImages = $('.album .main img').size(), currentImage = 0, numImages = Math.min(5, totalImages), margin = 5, i = 0, left = 0, arrowwidth = 60, albummainwidth = $('.album').width() - arrowwidth * 2 - 10, imagewidth = (albummainwidth - (numImages-1) * margin) / (numImages + 1), albummainheight = 100, loadedImages = 0;
  if ( totalImages > 0 )
  {
    $('.album').css('visibility', 'hidden');
    $('.album .main img').load(function() {
      if ( ++loadedImages >= totalImages )
      {

        $('.album .main img').each(function() {
          var thiswidth = imagewidth * (i == Math.floor(numImages/2) ? 2 : 1), thisheight = thiswidth * $(this).height()/$(this).width();
          $(this).css({'position':'absolute', 'left':left, 'width':thiswidth, 'height':thisheight});
          if ( thisheight > albummainheight )
            albummainheight = thisheight;
          i += ( i == Math.floor(numImages/2) ? 2 : 1 );
          left += thiswidth + margin;
        });

        $('.album .main').css({'overflow':'hidden', 'width':albummainwidth, 'height':albummainheight});
        $('.album .arrow').css({'width':arrowwidth, 'height':albummainheight/2, 'line-height':albummainheight/2 + 'px', 'display':'block'});

        $('.album .arrowleft').click(function() {
          currentImage = (currentImage == 0 ? totalImages - 1 : currentImage - 1);
          $($('.album .main img').get(currentImage)).animate({'left':'-=' + ((imagewidth + margin) * (totalImages + 1) - margin)}, 0);

          var i = 0;
          $('.album .main img').each(function() {
            var prevgrowing = i == (Math.floor(numImages/2) + currentImage + 1) % totalImages, growing = i == (Math.floor(numImages/2) + currentImage) % totalImages, thiswidth = imagewidth * ( growing ? 2 : 1), thisheight = thiswidth * $(this).height()/$(this).width();
            $(this).stop(false, true);
            $(this).animate({'left':'+=' + ((imagewidth * (prevgrowing + 1) + margin)), 'width':thiswidth, 'height':thisheight}, 500);
            i++;
          });
        });

        $('.album .arrowright').click(function() {
          var i = 0;
          $('.album .main img').each(function() {
            var growing = i == (Math.floor(numImages/2) + currentImage + 1) % totalImages, thiswidth = imagewidth * ( growing ? 2 : 1), thisheight = thiswidth * $(this).height()/$(this).width();
            $(this).stop(false, true);
            $(this).animate({'left':'-=' + ((imagewidth * (growing + 1) + margin)), 'width':thiswidth, 'height':thisheight}, 500);
            i++;
          });

          $($('.album .main img').get(currentImage)).animate({'left':'+=' + ((imagewidth + margin) * (totalImages + 1) - margin)}, 0);
          currentImage = (currentImage == totalImages-1 ? 0 : currentImage + 1);
        });

        $('.album').css('visibility', 'visible');
      }
    });
  }
}

$(document).ready(init);
