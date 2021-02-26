# Alternatives to use images on Mojolicious::Plugin::Webpack
![GitHub repo size](https://img.shields.io/github/repo-size/dmanto/mojo-webpack-case)

This repo shows some alternatives (on different branches) to work with images on the amaizing real-time web framework [Mojolicious](https://metacpan.org/pod/Mojolicious), using its oficial [Webpack Plugin](https://metacpan.org/pod/Mojolicious::Plugin::Webpack)

This is ```use-hashed-name-on-images``` branch, it shows a non working example, because the image to be incorporated (in ```assets/images/wave.jpg```) is copied with a different name (wave-faad2aefeace0ad5b207e8c98530a001.jpg), and we have no way to generate a proper url yet.

This can be fixed forcing Webpack to bundle this asset and to generate the right src attribute in some html page and then parse this page with Mojo::DOM.

But what I'm proposing to fix this is to use a standard feature of Webpack, that is to generate a json file with a "stats" object that has all compilation related info. Then we can parse this file to get the corresponding url.

Please refer to the [parsing-stats-file branch](https://github.com/dmanto/mojo-webpack-case/tree/parsing-stats-file) to see a working example.