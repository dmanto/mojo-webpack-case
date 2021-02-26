# Alternatives to use images on Mojolicious::Plugin::Webpack
![GitHub repo size](https://img.shields.io/github/repo-size/dmanto/mojo-webpack-case)

This repo shows some alternatives (on different branches) to work with images on the amaizing real-time web framework [Mojolicious](https://metacpan.org/pod/Mojolicious), using its official [Webpack Plugin](https://metacpan.org/pod/Mojolicious::Plugin::Webpack)

This is ```using-copy-webpack-plugin``` branch, it shows a working example, Uses the plugin to copy images from assets/images to the public/asset directory.

You need to install the plugin before running the developing service, as this:

```shell
npm install --save-dev copy-webpack-plugin
mojo webpack lite.pl
```

If you want to modify image files, this solution will be problematic due to what is called the "caching gotcha". The problem is that your image file was cached on (posible) several places and you will need some way to clear those old caches. This is annoying for both development and production modes.

You can configure the copy-webpack-plugin to change the name of the asset with a content hash of it. That solves the cache problem, but you will need the new name to point your src attribute to the right asset.

Please refer to the [use-hashed-name-on-images branch](https://github.com/dmanto/mojo-webpack-case/tree/use-hashed-name-on-images) to see a non working example (needs to be fixed knowing the final asset url).