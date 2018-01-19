;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; Completion
     helm
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory nil

                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip t

                      auto-completion-enable-snippets-in-popup t
                      )

     spell-checking
     syntax-checking
     semantic
     search-engine
     speed-reading


     ;; Style
     ;; themes-megapack
     (colors :variables
             ;; colors-enable-nyan-cat-progress-bar t
             ;; colors-colorize-identifiers 'variables
             ;; colors-enable-rainbow-identifiers t
             ;; colors-theme-identifiers-sat&light (20 70)
             )


     ;; Languages
     (c-c++ :variables
            c-c++-enable-clang-support t
            c-c++-default-mode-for-headers 'c++-mode
            )
     cscope
     clojure
     d
     emacs-lisp
     ;;;erlang
     (haskell :variables
              haskell-enable-ghc-mod-support t)
     idris
     ;; (java :variables
     ;;       eclimd-default-workspace "~/Workspace/Eclipse/Java/"
     ;;       )
     (javascript :variables
                 js2-basic-offset 2
                 js-indent-level 2
                 )
     (python :variables
             python-sort-imports-on-save t
             )
     ruby
     rust
     ;; scala
     scheme
     ;; extra-langs


     ;; Query languages
     sql


     ;; Text
     asciidoc
     csv
     finance
     markdown
     pandoc
     yaml

     bibtex
     (latex :variables
            latex-enable-folding t
            latex-build-command "LatexMk")

     (org :variables
          ;; Agenda
          org-deadline-warning-days 28
          org-agenda-span 10
          org-agenda-files '(
                             "~/Documents/Self.org"
                             "~/Documents/U.org"
                             "~/Documents/agenda.org"
                             )

          ;; Items
          org-bullets-bullet-list '("⚫" "◉" "○" "⚪" "✸" "✿" "■" "◆" "▲" "▶")
          org-list-allow-alphabetical t

          ;; HTML export
          org-enable-bootstrap-support t

          ;; Reveal.js export
          org-enable-reveal-js-support t
          org-src-fontify-natively t

          ;; LaTeX export
          org-latex-pdf-process '("latexmk -synctex=1 -f -shell-escape -xelatex  %f")
          org-latex-listings 'minted
          org-latex-minted-options '(
                                     ("frame"       "lines")
                                     ("fontsize"    "\\scriptsize")
                                     ("xleftmargin" "\\parindent")
                                     ("linenos"     "")
                                     )
          )


     ;; Web
     html
     restclient


     ;; Version control
     ;; version-control
     (git :variables
          magit-repository-directories '("~/Projects/"))
     github


     ;; Shell
     (shell :variables
            shell-default-width 120
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-term-shell "/usr/bin/fish")
     shell-scripts

     ranger

     systemd
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      sparql-mode

                                      cmake-ide
                                      google-c-style

                                      doom-themes
                                      all-the-icons

                                      fish-mode
                                      protobuf-mode
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '(
                                (bookmarks . 10)
                                (todos . 7)
                                (agenda . 5)
                                (recents . 25)
                                (projects . 15)
                                )
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         spacemacs-dark
                         doom-one
                         ;; twilight-anti-bright
                         ;; ample
                         ;; solarized-light
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '(
                               "Source Code Pro for Powerline"
                               :size   10
                               :weight semi-bold
                               :width  semi-condensed
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ";"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("pt" "ag" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (setq custom-file (concat (file-name-directory dotspacemacs-filepath) "customize.el"))

  ;; Fixes
  (add-hook 'prog-mode-hook 'semantic-mode)
  (add-hook 'd-mode-hook 'flycheck-dmd-dub-set-variables)
  (setq x-select-enable-clipboard nil)
  (setq tramp-use-ssh-controlmaster-options nil)


  ;; Org-mode
  (add-hook 'org-mode-hook
            (lambda ()
              ;; Set up minted
              (add-to-list 'org-latex-packages-alist '("" "minted"))
              ;; Enable fill column indicator
              (fci-mode t)
              (setq fill-column 80)
              ;; Turn off line numbering, it makes org so slow
              (linum-mode -1)
              ;; Enable automatic line wrapping at fill column
              (auto-fill-mode t)
              )
            )
  (setq org-ref-default-bibliography '("~/Documents/Papers/references.bib")
        org-ref-pdf-directory          "~/Documents/Papers/"
        org-ref-bibliography-notes     "~/Documents/Papers/notes.org")

	(with-eval-after-load 'org
		;; Babel
		(org-babel-do-load-languages
		 'org-babel-load-languages
		 '(
			 (emacs-lisp  . t)
			 (haskell  . t)
			 (sql  . t)
			 (sh  . t)
			 (python  . t)
			 (C  . t)
			 ))

		;; LaTeX thesis configuration
		;; TODO: move to dir-locals
		;; Format tags
		(defun org-latex-format-headline-simple-keywords-function
				(todo todo-type priority text tags info)
			(concat
			 (cond
				((string= todo "TODO")   (and todo (format "%s " todo)))
				((string= todo "DONE")   (and todo (format "%s " todo)))
				((string= todo "REVIEW") (and todo (format "%s " todo)))
				)
			 (and priority (format "\\#%c " priority))
			 text
			 (and tags
						(format ":%s:"
										(mapconcat (lambda (tag) (org-latex-plain-text tag info))
															 tags ":")))))

		(setq org-latex-format-headline-function 'org-latex-format-headline-simple-keywords-function)

		;; Define PUC LaTeX class
		(with-eval-after-load 'ox-latex
			(add-to-list 'org-latex-classes
									'("PUC"
										"\\documentclass{pucthesis}"
										("\\chapter{%s}" . "\\chapter*{%s}")
										("\\section{%s}" . "\\section*{%s}")
										("\\subsection{%s}" . "\\subsection*{%s}")
										("\\subsubsection{%s}" . "\\subsubsection*{%s}")
										("\\paragraph{%s}" . "\\paragraph*{%s}")
										;; ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
										))
			)
		)



  ;; Text
  (spacemacs/toggle-truncate-lines-on)
  (add-hook 'text-mode-hook 'spacemacs/toggle-visual-line-navigation-on)

  ;; (setq-default indent-tabs-mode t)
  (setq-default tab-width 2)


  (require 'ox-extra)
  (ox-extras-activate '(ignore-headlines))


  ;; PDF View
  (setq doc-view-continuous t)


  ;; Neotree icons
  (with-eval-after-load 'neotree
    (require 'all-the-icons)
    (setq neo-theme (if window-system 'icons 'arrow))
    )
  (setq neo-hidden-regexp-list '(
                                 "^\\."
                                 "^#.*"
                                 "^\\.git$"

                                 ;; Temporal
                                 "~$"
                                 "^#.*#$"

                                 ;; binaries
                                 "^\\.bin$"
                                 "\\.o$"

                                 ;; LaTeX
                                 "\\.aux$"
                                 "\\.bbl$"
                                 "\\.blg$"
                                 "\\.fdb_latexmk$"
                                 "\\.fls$"
                                 "\\.synctex.gz$"
                                 "\\.log$"
                                 "\\.lof$"
                                 "\\.lot$"
                                 "\\.prv/$"

                                 ;; elisp
                                 "\\.elc$"

                                 ;; python
                                 "^__.*"
                                 "\\.pyc$"
                                 ))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.