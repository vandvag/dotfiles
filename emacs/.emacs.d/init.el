;;; init.el --- Personal configuration of Evangelos Vandoros -*- lexical-binding: t; -*-
;; Author: Evangelos Vandoros
;; Package-Requires: ((emacs "30.0"))


;;; Commentary:
;; This is my personal configuration
;; This is still a work in progress, as I am learning EMACS
;;
;; REFERENCES/RESOURCES
;; https://github.com/LionyxML/emacs-kick/blob/master/init.el
;; https://protesilaos.com/emacs/
;; https://github.com/jakebox/jake-emacs/tree/main :: for categorizing the info, packages, everything & all key bindings. Still a lot to learn.
;; https://blog.sumtypeofway.com/posts/emacs-config.html :: for good write up.
;; https://www.patrickdelliott.com/emacs.d/
;; https://gitlab.com/s_witcher/witcharch/-/blob/main/dotfiles/emacs/init.el?ref_type=heads
;; https://github.com/caisah/emacs.dz :: repository with several configurations from known community members

;;; Code:

(add-to-list 'load-path "~/.emacs.d/modules")

(require 'package)
(setq package-archives
      '(("melpa"  . "https://melpa.org/packages/")
        ("elpa"   . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))


;; Emacs configuration
(use-package emacs
  :ensure nil
  :init
  (save-place-mode 1)
  (global-auto-revert-mode 1) ;; Keep buffers up-to-date with external changes
  (modify-coding-system-alist 'file "" 'utf-8)
  :hook
  (before-save . delete-trailing-whitespace)
  :config
  ;; Save customizations to a different file and not `init.el'
  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)
  :custom
  (user-full-name "Evangelos Vandoros")
  (autosave-default nil)
  (create-lockfiles nil)
  ;; Default tab width
  (tab-width 4)
  (tab-always-indent nil)
  (indent-tabs-mode nil)
  ;; Disable backup files ~
  (make-backup-files nil)
  ;; Enables context menu.
  (context-menu-mode t)
  (enable-recursive-minibuffers t)
  (confirm-kill-emacs 'yes-or-no-p)
  (use-short-answers t)
  (font-lock-maximum-decoration '((c-mode   . 2)   ;; Nice performace hacks
                                  (c++-mode . 2)
                                  (t        . t))) ;; Max for all other modes
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

(use-package isearch
  :ensure nil
  :custom
  (isearch-lazy-count t)
  (lazy-count-prefix-format "(%s/%s) ")
  (lazy-count-suffix-format nil))

(use-package dired
  :ensure nil
  :defer t
  :custom
  (dired-kill-when-opening-new-dired-buffer t))

(use-package diminish
  :ensure t)

(use-package repeat
  :ensure nil
  :hook (after-init . repeat-mode))

;; UI stuff

(use-package ef-themes :ensure t)
(use-package doric-themes :ensure t)
(use-package catppuccin-theme
  :ensure t
  :custom
  (catppuccin-flavor 'frappe)) ;; or 'latte, 'macchiato, 'mocha
(use-package modus-themes
  :ensure nil
  :custom
  (modus-themes-mode-line '(accented borderless)))

(ef-themes-load-random-dark)

(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package whitespace-mode
  :ensure nil
  :defer t
  :custom
  (whitespace-style '(face
                      tabs
                      spaces
                      space-mark
                      tab-mark)))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-;") 'er/expand-region))

(use-package keycast
  :ensure t
  :diminish)

(use-package eldoc
  :ensure nil
  :diminish
  :init
  (global-eldoc-mode))

;; Here are packages that utilize the minibuffer
(use-package which-key
  :ensure nil
  :diminish
  :defer t
  :hook
  (after-init . which-key-mode)
  :custom
  (which-key-idle-delay 0.3))

(use-package vertico
   :ensure t
   :hook
   (after-init . vertico-mode)
   :config
   (setq vertico-cycle t)
   (setq vertico-resize nil))

(use-package marginalia
  :ensure t
  :after vertico
  :hook
  (after-init . marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)   ;; Disable defaults, use our settings
  (completion-pcm-leading-wildchar t)) ;; Emacs 31: partial-completion behaves like a substring

(use-package consult
  :ensure t
  :defer t
  :bind ("M-s M-g"  . consult-ripgrep)
		 ("M-s M-s" . consult-line)
		 ("M-s M-b" . consult-buffer)
		 ("M-s M-m" . consult-global-mark)
		 ("M-s M-f" . consult-fd)
		 ("M-s M-l" . consult-bookmark)
		 ("M-s M-i" . consult-imenu))


(use-package embark
  :ensure t
  :defer t
  :bind
  (("C-." . embark-act)
   :map minibuffer-local-map
   ("C-c C-e" . embark-export)
   ("C-c C-c" . embark-collect)))

(use-package embark-consult
  :ensure t
  :defer t
  :demand t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package wgrep
  :ensure t
  :bind (:map grep-mode-map
              ("e"       . wgrep-change-to-wgrep-mode)
              ("C-x C-q" . wgrep-change-to-wgrep-mode)
              ("C-c C-c" . wgrep-finish-edit)))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  (corfu-history-mode)
  (setq tab-always-indent 'complete)
  :custom
  (corfu-cycle t)
  (corfu-popupinfo-delay '(0.75 . 0.5))
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.2)
  (corfu-echo-documentation 0.3)
  (corfu-preview-current nil)
  :bind (:map corfu-map
              ("M-SPC" . corfu-insert-separator))
  :hook ((prog-mode   . (lambda () (setq-local corfu-auto t)))
         (shell-mode  . corfu-mode)
         (eshell-mode . corfu-mode)))

;;; LSP Configurations
(use-package lsp-mode
  :ensure t
  :defer t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (bash-ts-mode . lsp)
  (lsp-mode     . lsp-enable-which-key-integration)
  :commands
  (lsp lsp-deferred)
  :custom
  (lsp-inlay-hint-enable nil)
  (lsp-completion-provider :none)
  (lsp-session-file (locate-user-emacs-file ".lsp-session"))
  (lsp-log-io nil)
  (lsp-idle-delay 0.1)
  (lsp-keep-workspace-alive nil)
  (lsp-enable-xref t)
  (lsp-auto-configure t)
  (lsp-eldoc-enable-hover t)
  (lsp-enable-links nil)
  (lsp-enable-file-watchers nil)
  (lsp-enable-folding nil)
  (lsp-enable-imenu t)
  (lsp-enable-indentation nil)
  (lsp-enable-on-type-formatting nil)
  (lsp-enable-suggest-server-download t)
  (lsp-enable-symbol highlighting t)
  (lsp-enable-text-document-color nil)
  (lsp-modeline-code-actions-enable nil)
  (lsp-modeline-diagnostics-enable nil)
  (lsp-modeline-workspace-status-enable t)
  (lsp-signature-doc-lines 1)
  (lsp-eldoc-render-all nil)
  (lsp-completion-enable t)
  (lsp-completion-enable-additional-text-edit t)
  (lsp-enable-snippet nil)
  (lsp-completion-show-kind t)
  (lsp-lens-enable t)
  (lsp-headerline-breadcrumb-enable-symbol-numbers t)
  (lsp-headerline-arrow "▶")
  (lsp-headerline-breadcrumb-enable-diagnostics nil)
  (lsp-headerline-breadcrumb-icons-enable nil)
  (lsp-semantic-tokens-enable nil))

(setq treesit-language-source-alist
   '((cpp "https://github.com/tree-sitter/tree-sitter-cpp")
     (c "https://github.com/tree-sitter/tree-sitter-c")
     (rust "https://github.com/tree-sitter/tree-sitter-rust")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (zig "https://github.com/tree-sitter/zig-tree-sitter")))

(use-package c-ts-mode
  :ensure t
  :mode (("\\.h\\'" . c-ts-mode)
         ("\\.c\\'" . c-ts-mode)
         ("\\.hpp\\'" . c++-ts-mode)
         ("\\.cpp\\'" . c++-ts-mode))
  :hook
  (c-ts-mode . lsp-deferred)
  (c++-ts-mode . lsp-deferred)
  :config
  (setq c-ts-mode-indent-offset 4
        c-ts-mode-indent-style 'bsd))

(use-package cmake-mode
  :ensure t
  :defer t)

(use-package zig-ts-mode
  :ensure t
  :mode "\\.zig\\'"
  :defer t
  :hook
  (zig-ts-mode . lsp-deferred)
  :custom
  (zig-indent-offset 4))

(use-package rust-ts-mode
  :ensure t
  :mode "\\.rs\\'"
  :defer t
  :hook
  (rust-ts-mode . lsp-deferred)
  (rust-ts-mode . (lambda()
                 (setq indent-tabs-mode nil)))
  :custom
  (rust-indent-offset 4))

(use-package go-ts-mode
  :ensure nil
  :defer t
  :mode "\\.go\\'"
  :hook
  (go-ts-mode . lsp-deferred))

(use-package flycheck
  :ensure t
  :after lsp-ui
  :hook (prog-mode . flycheck-mode))

;; MAGIT
(use-package magit
  :ensure t
  :defer t)

(use-package undo-tree
  :ensure t
  :defer t
  :diminish
  :hook
  (after-init . global-undo-tree-mode)
  :init
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t)
  (setq undo-limit 800000)
  (setq undo-strong-limit 1200000)
  (setq undo-outer-limit 12000000)
  :config
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/.cache/undo"))))

(use-package diff-hl
  :ensure t
  :hook
  (prog-mode          . diff-hl-flydiff-mode)
  (dired-mode         . diff-hl-dired-mode)
  (magit-post-refresh . diff-hl-magit-post-refresh)
  :config
  (global-diff-hl-mode)
  :custom
  (diff-hl-side 'left))

(use-package ediff
  :ensure nil
  :custom
  (ediff-window-setup-function 'ediff-setup-windows-plain))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))

(use-package pdf-tools
  :ensure t
  :defer t
  :commands (pdf-loader-install)
  :mode "\\.pdf\\'"
  :init
  (pdf-loader-install)
  :config
  (add-to-list 'revert-without-query ".pdf"))

;; Configurations
(use-package json-mode
  :ensure t)

(use-package toml-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

;; Denote
(use-package denote
  :ensure t
  :hook
  (;; If you use plain text files (.txt), then you want to make the
   ;; Denote links clickable (Org mode and Markdown mode render links
   ;; as buttons right away and provide commands to open them)
   (text-mode . denote-fontify-links-mode)
   ;; Apply colours to Denote names in Dired.  This applies to all
   ;; directories.  Check `denote-dired-directories' for the specific
   ;; directories you may prefer instead.  Then, instead of
   ;; `denote-dired-mode', use `denote-dired-mode-in-directories'.
   (dired-mode . denote-dired-mode))
  :bind
  ( :map global-map
    ("C-c n n" . denote)
    ("C-c n d" . denote-dired)
    ("C-c n g" . denote-grep)
    ("C-c n l" . denote-link)
    ("C-c n L" . denote-add-links)
    ("C-c n b" . denote-backlinks)
    ("C-c n q c" . denote-query-contents-link) ; create link that triggers a grep
    ("C-c n q f" . denote-query-filenames-link) ; create link that triggers a dired
    ("C-c n r" . denote-rename-file)
    ("C-c n R" . denote-rename-file-using-front-matter)

    :map dired-mode-map
    ("C-c C-d C-i" . denote-dired-link-marked-notes)
    ("C-c C-d C-r" . denote-dired-rename-files)
    ("C-c C-d C-k" . denote-dired-rename-marked-files-with-keywords)
    ("C-c C-d C-R" . denote-dired-rename-marked-files-using-front-matter))
  :config
  (denote-rename-buffer-mode 1)
  :custom
  (denote-directory (expand-file-name "~/Documents/notes/"))
  (denote-save-buffers nil)
  ;; (denote-known-keywords '("emacs" "philosophy" "politics" "economics"))
  (denote-infer-keywords t)
  (denote-sort-keywords t)
  (denote-prompts '(title keywords))
  (denote-excluded-directories-regexp nil)
  (denote-keywords-to-not-infer-regexp nil)
  (denote-rename-confirmations '(rewrite-front-matter modify-file-name))
  (denote-date-prompt-use-org-read-date t))

(use-package denote-journal
  :ensure t
  :after denote
  :commands ( denote-journal-new-entry
              denote-journal-new-or-existing-entry
              denote-journal-link-or-create-entry )
  :hook (calendar-mode . denote-journal-calendar-mode)
  :custom
  (denote-journal-directory
        (expand-file-name "journal" denote-directory))
  (denote-journal-keyword "journal")
  (denote-journal-title-format 'day-date-month-year))


;;; Claude code ide
(use-package websocket
  :ensure t)

(use-package eat
  :ensure t)

(use-package claude-code-ide
  :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
  :bind ("C-c C-'" . claude-code-ide-menu) ; Set your favorite keybinding
  :config
  (claude-code-ide-emacs-tools-setup)
  :custom
  (claude-code-ide-terminal-backend 'eat)) ; Optionally enable Emacs MCP tools

(require 'vandvag-fun)

;; Keybinds
(global-set-key (kbd "C-`")   'vandvag/toggle-line-numbers)
(global-set-key (kbd "C-c y") 'vandvag/copy-line)
(global-set-key (kbd "<f2>")  'vandvag/toggle-whitespace)

(provide 'init)
