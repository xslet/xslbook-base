# xslt-repo-template

A repository template for XSLT application/library in xslet project.

## Usage

1. Modify `app-name` to your project name in `build.xml`.
2. Specify the property `"prodtype"` in `build.xml` to `"application"` or `"library"`.
3. Append `target`s to setup dependency libraries and their `antcall` in `build.xml`.
4. Append necessary namespace declarations in `res/xsl/*.xsl`.
5. Modify `app-name` to your project name and edit descriptions in `docs/index.html` for github-pages.
6. Edit descriptions in `src/xsl/main.xsl` for API document.
7. Remove here, uncomment the following and modify `app-name` to your project in this `README.md`.
8. Execute the command `ant setup` to download dependency libraries and setup this project.
9. Execute the command `ant build` to build this project.

<!--

# [app-name][repo-url] [![Version][ver-image]][api-url] [![Github.io][io-image]][io-url] [![MIT License][mit-image]][mit-url]


## Namespace

`xmlns:prefix="https://github.com/xslet/year/app-name"`


## API

The API document of this program is [here][api-url].


## Usage

The document about usage of app-name is [here][usage-url].


## License

Copyright &copy; 2022 Takayuki Sato

This program is free software under [MIT][mit-url] License.
See the file LICENSE in this distribution for more details.


[repo-url]: https://github.com/xslet/app-name
[io-image]: https://img.shields.io/badge/HP-github.io-ff8888.svg
[io-url]: https://xslet.github.io/app-name
[ver-image]: https://img.shields.io/badge/version-0.1.0-blue.svg
[mit-image]: https://img.shields.io/badge/license-MIT-green.svg
[mit-url]: https://opensource.org/licenses/MIT
[api-url]: https://xslet.github.io/app-name/api/app-name.xml
[usage-url]: https://xslet.github.io/app-name/#usage

-->
