# Changelog

## [1.4.0](https://github.com/felicandalc/UniverseNvim/compare/v1.3.0...v1.4.0) (2024-01-23)


### Features

* **flutter-tools:** add plugin ([c58295d](https://github.com/felicandalc/UniverseNvim/commit/c58295df7419e16c2e613499f3c357bfb56b031c))


### Bug Fixes

* **treesitter:** update plugins ([f2f8239](https://github.com/felicandalc/UniverseNvim/commit/f2f8239182fbcb526e7211a9a32242df97000251))

## [1.3.0](https://github.com/felicandalc/UniverseNvim/compare/v1.2.1...v1.3.0) (2023-11-10)


### Features

* **indent-blankline:** migrate to v3 ([78559ad](https://github.com/felicandalc/UniverseNvim/commit/78559adf2355a7a2e3022bbdc1bee3308664f5f3))
* **mason:** added plugin, bridges and notify ([73abdce](https://github.com/felicandalc/UniverseNvim/commit/73abdce6127021fe38c23b26290190291e368d8f))
* **mason:** replaced lsp-installer ([ae88dc7](https://github.com/felicandalc/UniverseNvim/commit/ae88dc7dad9c27742c5bd0d273e54be2eabb3ef7))

## [1.2.2](https://github.com/felicandalc/UniverseNvim/compare/v1.2.1...v1.2.2) (2023-08-11)


### Bug Fixes

* **nvim-tree:** errors after update on config ([2e2f301](https://github.com/felicandalc/UniverseNvim/commit/2e2f301ba0ef99bddd1299822a5676f6fadd7fa9))
* **treesitter:** ignored objc, throws error on Windows ([4f7f279](https://github.com/felicandalc/UniverseNvim/commit/4f7f2790a8d250d52628872b95de1abb51b57742))

## [1.2.1](https://github.com/felicandalc/UniverseNvim/compare/v1.2.0...v1.2.1) (2023-07-13)


### Bug Fixes

* **markdown-preview:** added `ft` and `lazy` to `markdown-preview.nvim` plugin in `lazy.nvim` table ([fd2addf](https://github.com/felicandalc/UniverseNvim/commit/fd2addf478d39467630074a5611494267ebc3fcd))

## [1.2.0](https://github.com/felicandalc/UniverseNvim/compare/v1.1.0...v1.2.0) (2023-07-13)


### Features

* **lazy.nvim:** added `lazy-lock.json` to source control ([a44f620](https://github.com/felicandalc/UniverseNvim/commit/a44f620e090248428632bf36f1fd495d0cd8484c))

## [1.1.0](https://github.com/felicandalc/UniverseNvim/compare/v1.0.0...v1.1.0) (2023-07-04)


### Features

* **lazy.nvim:** replaced packer with lazy.nvim to lazy load plugins and decrease startup time ([c19dc5f](https://github.com/felicandalc/UniverseNvim/commit/c19dc5f1f07f7efe5c1440f20dcb6a384dc6a2d9))

## 1.0.0 (2023-06-29)


### Features

* **.github:** added PR template and workflow for releases ([2729ba3](https://github.com/felicandalc/nvim/commit/2729ba3ac787b76a8d85e96f27e9c87c20e5a73d))
* **alpha:** added alpha ([4d2ce16](https://github.com/felicandalc/nvim/commit/4d2ce16f218179839a21ec44b323987353586dec))
* **auto format on save:** moved from async to sync because of how it was working ([451adaa](https://github.com/felicandalc/nvim/commit/451adaa9c31c8dda93bd89bf8f742e50b3ef3967))
* **autocommands:** added autocommands ([95a805f](https://github.com/felicandalc/nvim/commit/95a805f804294f6159e4245178c8ad73764d0f7d))
* **autotag:** added auto closing tag for html ([6abd306](https://github.com/felicandalc/nvim/commit/6abd30674708147e64859dafe344de8b40a1a503))
* **bufferline:** added bufferline and keymap to close buffers ([ca8c0d7](https://github.com/felicandalc/nvim/commit/ca8c0d794d5a998a30c306c005e949013249fa9f))
* **cmp nvim_lua:** added nvim_lua completion ([be00ca0](https://github.com/felicandalc/nvim/commit/be00ca02891d646c0e834eafad14f37c78f3be81))
* **easy comments:** added plugin for easily generating comments ([01e67ad](https://github.com/felicandalc/nvim/commit/01e67ad93ab6117eddca8f75efad171a450829ad))
* **formatting:** add formatting keymap ([f7eb740](https://github.com/felicandalc/nvim/commit/f7eb740788878057062de6d23293ac5d022523c7))
* **gitsigns:** add gitsigns configuration ([9be29f2](https://github.com/felicandalc/nvim/commit/9be29f2bbef01908df2991de0e47e040c6c61e7e))
* **gitsigns:** added gitsigns ([3e18960](https://github.com/felicandalc/nvim/commit/3e1896007069b771c634b252ee234535765d54f4))
* **impatient:** added impatient ([6f8341f](https://github.com/felicandalc/nvim/commit/6f8341f4e05250161b75559b15094ef591daef11))
* **indentline:** added indentline ([c03c8a3](https://github.com/felicandalc/nvim/commit/c03c8a3fcb1b413ebccb3a9fd64e15700c5b6983))
* **jenkinsfile-linter:** added plugin, previously fixed legacy warnings ([b793925](https://github.com/felicandalc/nvim/commit/b793925ea5a5d24577cfb396a3958969a23cfdaf))
* **keymaps + null-ls:** force null-ls formatting, added keymap for copying ([04fcbf9](https://github.com/felicandalc/nvim/commit/04fcbf9a1e93990cb37154cc2533cc41a42402d4))
* **keymaps and minors updates:** updated keymaps to prevent conflicts and updated jsonls ([c156623](https://github.com/felicandalc/nvim/commit/c1566233fe1cdb3ed5c4b32ac27ee1eb651a83f1))
* **keymaps:** added keymaps for copy, pasting and moving two lines at a time ([4f6c65a](https://github.com/felicandalc/nvim/commit/4f6c65a5e9814774baa311f8a640a6408a0782ab))
* **lsp configuration:** adding lsp configuration, TODO: fix error ([20c8625](https://github.com/felicandalc/nvim/commit/20c8625a347cc96d5a6726aa6f5661fab3964e5d))
* **lsp:** added support for fmt work on save to gopls server ([874b3a5](https://github.com/felicandalc/nvim/commit/874b3a5a6f4b0a3a6f2432daa3d7546fce03675a))
* **lsp:** finish lsp configuration ([8637fca](https://github.com/felicandalc/nvim/commit/8637fca11be12f24a5411a34503b40c543b0336d))
* **lua configuration:** moved from vimscript to lua configuration ([fd380dd](https://github.com/felicandalc/nvim/commit/fd380dd327ff0b3e4315724e907341a0ebd7b347))
* **lualine:** added lualine ([28d44a3](https://github.com/felicandalc/nvim/commit/28d44a3b95ae069bb753c61247a05ff867d1787d))
* **Markdown:** added markdown-preview plugin ([47c895e](https://github.com/felicandalc/nvim/commit/47c895e782e0d271304f113cd63b5c757ed1ee92))
* **neogen:** added doc generator a.k.a neogen ([57d40d5](https://github.com/felicandalc/nvim/commit/57d40d52aefad3aeab8b369a846baa347be96b80))
* **null ls:** added null ls ([1bcec84](https://github.com/felicandalc/nvim/commit/1bcec84350073b94a8f38ab71bd5ec216caf47ce))
* **null-ls:** support for go imports and go fumpt (stricter than gofmt) ([c9f2c0c](https://github.com/felicandalc/nvim/commit/c9f2c0cb803ec5a5434fdb4862a9c5ae2e440110))
* **nvimtree:** added nvimtree plugin ([b1cc412](https://github.com/felicandalc/nvim/commit/b1cc412c384ded8c463d6c2f38dc48f074ba8900))
* **octo:** added octo, updated config and others ([6857937](https://github.com/felicandalc/nvim/commit/6857937172b572a0d05487d2911d52db90ebd10f))
* **plugins:** added vim-mdx-js ([d8134e1](https://github.com/felicandalc/nvim/commit/d8134e1f63599d1d2a7a1a5b1252fbca6676621c))
* **project:** added project ([1283542](https://github.com/felicandalc/nvim/commit/1283542709993679d3e5af2a341ad79859658f4a))
* **readme:** update ([7a4ddaf](https://github.com/felicandalc/nvim/commit/7a4ddaf375d043f6f3f3a11b9813bc6fc2619a9f))
* **sync formattin:** async formatting was not working ([ead46b5](https://github.com/felicandalc/nvim/commit/ead46b50d8e50d630ada7589ae7bd938df2edc84))
* **table-mode:** added table mode support and mapped || or __ to use it ([53c5ea1](https://github.com/felicandalc/nvim/commit/53c5ea171c7943d1d4cc2f5347803b6702b8f3dd))
* **telescope:** added telescope configuration, keymaps and use plugin ([0fb7c12](https://github.com/felicandalc/nvim/commit/0fb7c120e8a0cbabd1a80edef3de6f92d99dee45))
* **telescope:** hidden files visible ([bc2b034](https://github.com/felicandalc/nvim/commit/bc2b034417167cdd45a1e3923b7fac99b0163dff))
* **toggleterm:** added toggleterm ([776fc07](https://github.com/felicandalc/nvim/commit/776fc07201b5110237c4bea6943e4d89f4713b18))
* **treesitter and autopairs:** added treesitter and autopairs with their minimal configs ([5654260](https://github.com/felicandalc/nvim/commit/565426054a58566c2a3149bff513c8239926d31f))
* **treesitter autopairs:** enabled autopairs in treesitter cofig ([634d70c](https://github.com/felicandalc/nvim/commit/634d70ce9f23c8bd14676a0c8ef57c670a3ccb24))
* **treesitter plugins:** added playground and rainbow brackets ([0344775](https://github.com/felicandalc/nvim/commit/034477530801bbfb914c4db25f35a1dfa075c280))
* **whichkey:** added whichkey ([ef9f1cd](https://github.com/felicandalc/nvim/commit/ef9f1cd3e4b20b59172281b193908ed5b1a59968))


### Bug Fixes

* **bufferline:** change hex value for , error on config ([c454ade](https://github.com/felicandalc/nvim/commit/c454adefe231b54fb2a1f8f086c7487370f9902a))
* **bufferline:** corrected and improved behaviour on closing tabs ([020f27b](https://github.com/felicandalc/nvim/commit/020f27bf9f18c7ec21e98615da46423e2840fe18))
* **lsp handlers:** update on deprecated method ([8378a45](https://github.com/felicandalc/nvim/commit/8378a45e2b1dd0ee7f43aaeed0bb81883b89fc51))
* **lsp:** swap server_capabilities with resolved_capabilities ([56089c0](https://github.com/felicandalc/nvim/commit/56089c008fe0de37ea6ed1c97635c92286eaea4d))
* **lsp:** updated deprecated method on lsp cofiguration ([ecfc620](https://github.com/felicandalc/nvim/commit/ecfc620bf1792d677e9d70302c6e2da9fe50c7e0))
* **nvim tree:** fixed warning from nvim tree update ([66c5dfa](https://github.com/felicandalc/nvim/commit/66c5dfa0502d9b12e9ee10df382f1a4cf98d9d7b))
* **nvim-tree:** update moved setup options ([8deeb0e](https://github.com/felicandalc/nvim/commit/8deeb0ee069b6213be7da84a7a4e00308c04a2cb))
* **nvim-tree:** updated configuration, old config conflicts and auto close ([ad29a8e](https://github.com/felicandalc/nvim/commit/ad29a8eb60e4638477c7fe151b2bf237b965a307))
* **nvim-tree:** updated deprecated config ([3ac451c](https://github.com/felicandalc/nvim/commit/3ac451c256f62c28a563eb06c0290dcc9d20e986))
* **releases.yml:** missing 'n' on `name` key ([9775f7f](https://github.com/felicandalc/nvim/commit/9775f7f1e8808797c2cdf7f46b34898554c3880e))
* resintalled some plugins ([766e0e9](https://github.com/felicandalc/nvim/commit/766e0e95c014da6cee7a3ffe96ec0ab2a506447f))
* **treesitter comment plugin:** added missing treesitter comment plugin ([5ad3e1f](https://github.com/felicandalc/nvim/commit/5ad3e1fdecc4c98195ce3963f62ca12a5d8c3108))
* updated some config keys ([38dbe28](https://github.com/felicandalc/nvim/commit/38dbe28807ae6a13430905506578e4936343a155))
* **workflows:** change release workflow ([8414794](https://github.com/felicandalc/nvim/commit/841479487e49ae6234e5ed312c425e1fd09b8fc9))
* **workflows:** corrected branch name that triggers release ([6ba34ba](https://github.com/felicandalc/nvim/commit/6ba34ba5ec420343847c4922eb7d6c88cbefc9d8))
* **workflows:** provided PULL_REQUEST and BRANCH parameters ([d4993b3](https://github.com/felicandalc/nvim/commit/d4993b3f83e2837c755909129193c62c2f26da15))
* **workflows:** replaced previous action with release-please ([fd090b1](https://github.com/felicandalc/nvim/commit/fd090b1786e18d4626bd0518019aca834f5228c1))
* **workflows:** updated release ([e933ccd](https://github.com/felicandalc/nvim/commit/e933ccdabab573321108230da1612e74563dc79f))
* **workflows:** versions ([66d4887](https://github.com/felicandalc/nvim/commit/66d4887d1df603af0b8f3d7b1a4115c5d97aedb6))
* **workflows:** versions ([f2e106b](https://github.com/felicandalc/nvim/commit/f2e106bf88a70ec525326132086a13e4c0532167))
