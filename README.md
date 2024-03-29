# Steps

* Install makefile: `apt install makefile`
* Install apps: `make apps`
* Install vim: `make vim`
* Install cmake: `make cmake`
* Install z: `make z`
* Install chrome
* Install miniconda
* Install mendeley
* Install spotify
* Ipython startup scripts: `make ipython_startup`

# My Vim Configuration

## Install:

* `git submodule init vim-config`
* `cd vim-config`
* `sh install.sh`
* Iniciar vim.
* `:BundleInstall`
* Compilar _YouCompleteMe_: `cd ~/.vim/bundle/YouCompleteMe && python install.py`

## Plugins:

* *pathogen* for easy plugin install
* *ctrlp* for fuzzy file search. _Bindings:_
   * `<leader> e` opens fuzzy search
   * `<c-t>` opens fuzzy search file in new tab
* *vim-powerline* for fancier information line
   * *VOoM* for python outline
   * `<leader> op` opens outline. outlines is configure take up as much
          space as possible
* *YouCompleteMe* for authomatic fuzzy autocompletion
* *python-mode* for pep8, definition search
   * pep8 checks are enabled on save
   * `,d` maps to _go to definition_
