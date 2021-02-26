#!/usr/bin/env perl
use Mojolicious::Lite;
use FindBin;
BEGIN { unshift @INC, "$FindBin::Bin/../../lib" }

plugin Webpack => {process => [qw(js css sass)]};
get '/'        => 'index';
app->start;

__DATA__
@@ index.html.ep
<!DOCTYPE html>
<html>
  <head>
    <title>Mojolicious ♥ Webpack</title>
    %= asset 'example.js'
    %= asset 'example.css'
  </head>
  <body>
    <h1>Mojolicious ♥ Webpack</h1>
    <p>
      This is a demo for using <a href="https://webpack.js.org/">Webpack</a>
      together with <a href="https://mojolicious.org/">Mojolicious</a>.
    </p>
    %= image 'asset/wave.jpg'
    %#= image 'asset/wave-faad2aefeace0ad5b207e8c98530a001.jpg'
  </body>
</html>
