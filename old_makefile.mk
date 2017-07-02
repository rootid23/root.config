.PHONY: git_config git_del git_push_master ssh_update vim_update java_update get_home vim_boot vim_ln_update 

HOME_DIR = ${HOME}
CWD = ${PWD}

conf_update :
	ln -sf $(CWD)/tmux.conf $(HOME_DIR)/.tmux.conf
	ln -sf $(CWD)/ack.conf $(HOME_DIR)/.ackrc
	ln -sf $(CWD)/git.conf $(HOME_DIR)/.gitconfig

vim_ln_update :
	ln -sf $(CWD)/conf.vim $(HOME_DIR)/.vimrc
	ln -sf $(CWD)/vim.addons $(HOME_DIR)/.vim/vim.addons
	ln -sf $(CWD)/vim.plugins $(HOME_DIR)/.vim/bundle 
	ln -sf $(CWD)/vim.testplugins $(HOME_DIR)/.vim/testbundle 
	ln -sf $(CWD)/vim.addons $(HOME_DIR)/.vim/vim.addons
	ln -sf $(CWD)/autoload $(HOME_DIR)/.vim/autoload
	ln -sf $(CWD)/vim.snippets/ultisnips-vim $(HOME_DIR)/.vim/UltiSnips 
	ln -sf $(CWD)/vim.colors $(HOME_DIR)/.vim/colors
	ln -sf $(CWD)/ftplugin.vim/ftdetect $(HOME_DIR)/.vim/ftdetect
	ln -sf $(CWD)/ftplugin.vim/ftplugin $(HOME_DIR)/.vim/ftplugin
	ln -sf $(CWD)/vim.snippets $(HOME_DIR)/.vim/UltiSnips

vim_ln_clear:
	unlink $(HOME_DIR)/.vim/bundle 	
	unlink $(HOME_DIR)/.vim/testbundle 	
	

git_config :
	git config user.email "vXXXXXXXX@gmail.com"
	git config user.name "rootid"

git_del :
	git status | grep 'deleted' | cut -d ":" -f2 | xargs git rm

git_push_master :
	git push -u origin master

ssh_update :
	ln -s $(CWD)/ssh_config $(HOME_DIR)/.ssh/config

java_update :
	ln -s /usr/java/jdk1.7.0_79 /usr/java/latest

bash_ln_update :
	mkdir -p $(HOME_DIR)/.vi.bash
	ln -sf $(CWD)/bash.addons/default.shrc $(HOME_DIR)/.vi.bash/default.shrc
	ln -sf $(CWD)/bash.addons/git.shrc $(HOME_DIR)/.vi.bash/git.shrc
	ln -sf $(CWD)/bash.addons/search.shrc $(HOME_DIR)/.vi.bash/search.shrc
	ln -sf $(CWD)/bash.addons/trash.shrc $(HOME_DIR)/.vi.bash/trash.shrc
	# Update .bahsrc/.profile with
	# source ~/.vi.bash/default.shrc

ub_install_ctags :
	sudo apt-get install exuberant-ctags


DOT_FILES = .zshenv .zprofile .zshrc .vimrc .vim .vim.login

VIM_FILES = bundle testbundle autoload UltiSnips colors ftdetect ftplugin 

all: zsh vim

zsh: $(foreach f, $(filter .z%, $(DOT_FILES)), link-dot-file-$(f))

vim: $(foreach f, $(filter .vi%, $(DOT_FILES)), link-dot-file-$(f))

.PHONY: clean
clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))

link-dot-file-%: %
	@echo "Create Symlink $< => $(HOME)/$<"
	#@ln -snf $(CURDIR)/$< $(HOME)/$<

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/$<"
	#@$(RM) $(HOME)/$<
