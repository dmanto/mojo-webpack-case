# Alternatives to use images on Mojolicious::Plugin::Webpack
![GitHub repo size](https://img.shields.io/github/repo-size/dmanto/mojo-webpack-case)

This repo shows some alternatives (on different branches) to work with images on the amaizing real-time web framework [Mojolicious](https://metacpan.org/pod/Mojolicious), using its official [Webpack Plugin](https://metacpan.org/pod/Mojolicious::Plugin::Webpack)

This is the master branch, it shows a non working example, because the image to be incorporated (in ```assets/images/wave.jpg```) is not refered from any loaded Webpack plugin, so it is not copied to the ```public``` directory at all.

This can be easily fixed adding a suitable plugin, and pointing the src attribute of the image to the destination file.

Please refer to the [using-copy-webpack-plugin branch](https://github.com/dmanto/mojo-webpack-case/tree/using-copy-webpack-plugin) to see a working example.