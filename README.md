# Alternatives to use images on Mojolicious::Plugin::Webpack
![GitHub repo size](https://img.shields.io/github/repo-size/dmanto/mojo-webpack-case)

This repo shows some alternatives (on different branches) to work with images on the amaizing real-time web framework [Mojolicious](https://metacpan.org/pod/Mojolicious), using its oficial [Webpack Plugin](https://metacpan.org/pod/Mojolicious::Plugin::Webpack)

This is the ```parsing-stats-file``` branch, it shows a working example.

It's just a hack example. Besides adding and configuring the copy-webpack-plugin, all changes are inside the app file (lite.pl);

First we force Webpack to build a stats json file, adding:

```perl
$ENV{MOJO_WEBPACK_BUILD} = '--json=mojo-wp.json';
```

before the plugin, so it is called with this option that will generate the "mojo-wp.json" file in the repo's root directory, with all the "stats object" information in it.

Then we install a helper (wp_url) that will return the url of an asset. Official information about the format of the stats object can be found [here](https://webpack.js.org/api/stats/).

The helper just slurps the generated file, json_decode it, and save it the first time it is called. Then parses the array of assets in the ->{assets} key, saving assets that have a {info}{sourceFilename} field, with its corresponding {name} key.

```perl
app->helper(
  wp_url => sub ($c, $desc) {
    state $wp_info = decode_json $c->app->home->child('mojo-wp.json')->slurp;
    state %assets  = map { $_->{info}{sourceFilename} => $_->{name} }
      grep { exists $_->{info}{sourceFilename} } @{$wp_info->{assets}};

    # $c->app->log->warn ($c->app->dumper($wp_info->{assets}));
    return '/asset/' . $assets{$desc};
  }
);
```

Of course this is a hack demostration only, would have to change many things to be included inside the plugin.
