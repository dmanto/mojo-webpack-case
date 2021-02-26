const CopyPlugin = require('copy-webpack-plugin');

module.exports = function (config) {
  config.entry = {
    'example': './assets/js/app.js',
  };
  config.plugins.push(
    new CopyPlugin({ patterns: [{ from: "assets/images" }] })
  );
};
