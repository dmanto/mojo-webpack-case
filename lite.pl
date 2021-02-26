#!/usr/bin/env perl
use Mojolicious::Lite -signatures;
use Mojo::JSON 'decode_json';
use FindBin;
BEGIN { unshift @INC, "$FindBin::Bin/../../lib" }

# this is a just a hack to get the stats json file
$ENV{MOJO_WEBPACK_BUILD} = '--json=mojo-wp.json';
plugin Webpack => {process => [qw(js css sass)]};

# this helper will return the new url after webpack compilation
# it reads webpack's stats file, parses it and then referes the
# result to the public directory
app->helper(
  wp_url => sub ($c, $desc) {
    state $wp_info = decode_json $c->app->home->child('mojo-wp.json')->slurp;
    state %assets  = map { $_->{info}{sourceFilename} => $_->{name} }
      grep { exists $_->{info}{sourceFilename} } @{$wp_info->{assets}};

    # $c->app->log->warn ($c->app->dumper($wp_info->{assets}));
    return '/asset/' . $assets{$desc};
  }
);
get '/' => 'index';
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
    %= image wp_url 'assets/images/wave.jpg'
    %#= image 'asset/wave-faad2aefeace0ad5b207e8c98530a001.jpg'
  </body>
</html>
