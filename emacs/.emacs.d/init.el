;;; init.el --- Personal configuration of Evangelos Vandoros -*- lexical-binding: t; -*-
;; Author: Evangelos Vandoros
;; Package-Requires: ((emacs "30.0"))


;;; Commentary:
;; This is my personal configuration
;; Inspired mostly by:
;; https://github.com/LionyxML/emacs-kick/blob/master/init.el


;;; Code:

;; Performance hacks

;; Increase the garbage collection threshold
(setq gc-cons-threshold #x40000000)

;; Maximum output size for reading process output
(setq read-process-output-max (* 1024 1024 4))

;; Require default package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(defcustom vandvag-use-nerd-fonts t
  "Configuration for using Nerd Fonts Symbols."
  :type 'boolean
  :group 'appearance)


(use-package emacs
  :ensure nil
  :custom
  (column-number-mode t)
  (auto-save-default nil)
  (create-lockfiles nil)
  (delete-by-moving-to-trash t)
  (delete-selection-mode 1)
  (display-line-numbers-type 'relative)
  (global-auto-revert-non-file-buffers t)
  (history-length 50)
  (inhibit-startup-message t)
  (inhibit-scratch-message t)
  (make-backup-files nil)
  (pixel-scroll-precision-mode t)
  (pixel-scroll-precision-mode-use-momentum nil)
  (ring-bell-function 'ignore)
  (split-width-threshold 300)
  (switch-to-buffer-obey-display-actions t)
  (treesit-font-lock-level 4)
  (truncate-lines t)
  (use-dialog-box nil)
  (use-short-answers t)
  (warning-level-minimum :emergency)
  (help-window-select t)
  (indent-line-function 'insert-tab)
  (tab-always-indent nil)
  (tab-width 4)
  (c-basic-offset tab-width)
  (c-ts-mode-indent-offset tab-width)
  (c++-ts-mode-indent-offset tab-width)

  :hook
  (prog-mode . display-line-numbers-mode)

  :config
  (set-face-attribute 'default nil :family "JetBrainsMono Nerd Font" :height 120)
  (when (eq system-type 'darwin)
	(set-face-attribute 'default nil :family "JetBrainsMono Nerd Font" :height 130))
  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)

  :init
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (when scroll-bar-mode
	(scroll-bar-mode -1))

  (global-hl-line-mode 1)
  (global-auto-revert-mode 1)
  (indent-tabs-mode nil) ;; nil -> Disable the use of tabs for indentation, t -> Enable the use of tabs for indentation
  (recentf-mode 1)
  (savehist-mode 1)
  (save-place-mode 1)
  (winner-mode 1)
  (xterm-mouse-mode 1)
  (file-name-shadow-mode 1)

  (modify-coding-system-alist 'file "" 'utf-8)
  (add-hook 'after-init-hook
            (lambda()
              (message "Emacs has fully loaded. This code runs after startup.")
              (with-current-buffer (get-buffer-create "*scratch*")
                (insert (format
                         ";; Welcome to VanEmacs!
;;
;;    Loading time: %s
;;    Packages    : %s
"
                         (emacs-init-time)
                         (number-to-string (length package-activated-list))))))))

(use-package window
  :ensure nil
  :custom
  (display-buffer-alist
   '(
     ("\\*\\(Backtrace\\|Warnings\\|Compile-Log\\|compilation\\|[Hh]elp\\|Messages\\|Bookmark List\\|Ibuffer\\|Occur\\|eldoc.*\\)\\*"
      ;;(display-buffer-in-side-window)
	  (display-buffer-pop-up-window)
      (window-height . 0.3)
      (side . bottom)
      (slot . 0))

     ("\\*\\(Flycheck errors\\|xref\\|ivy\\|Swiper\\|Completions\\)"
      (display-buffer-in-side-window)
      (window-height . 0.3)
      (side . bottom)
      (slot . 1)))
   ))

(use-package dired
  :ensure nil
  :custom
  (dired-listing-switches "-lah")
  (dired-kill-when-opening-new-dired-buffer t)
  :config
  (when (eq system-type 'darwin)
	(let ((gls (executable-find "gls")))
	  (when gls
		(setq insert-directory-program gls))))
  )

(use-package vc
  :ensure nil
  :defer t
  :bind
  (("C-x v d" . vc-dir)
   ("C-x v =" . vc-diff)
   ("C-x v D" . vc-root-diff)
   ("C-x v v" . vc-next-action))
  :config
  (setq vc-annotate-color-map
        '((20 . "#f5e0dc")
          (40 . "#f2cdcd")
          (60 . "#f5c2e7")
          (80 . "#cba6f7")
          (100 . "#f38ba8")
          (120 . "#eba0ac")
          (140 . "#fab387")
          (160 . "#f9e2af")
          (180 . "#a6e3a1")
          (200 . "#94e2d5")
          (220 . "#89dceb")
          (240 . "#74c7ec")
          (260 . "#89b4fa")
          (280 . "#b4befe"))))

(use-package smerge-mode
  :ensure nil
  :defer t)

(use-package eldoc
  :ensure nil
  :init
  (global-eldoc-mode))


(use-package org
  :ensure nil
  :defer t)

(use-package which-key
  :ensure nil
  :defer t
  :hook
  (after-init . which-key-mode))

(use-package vertico
  :ensure t
  :hook
  (after-init . vertico-mode)
  :custom
  (vertico-count 10)
  (vertico-resize nil)
  (vertico-cycle t)
  :config
  ;; Customize the display of the current candidate in the completion list.
  ;; This will prefix the current candidate with “» ” to make it stand out.
  ;; Reference: https://github.com/minad/vertico/wiki#prefix-current-candidate-with-arrow
  (advice-add #'vertico--format-candidate :around
    (lambda (orig cand prefix suffix index _start)
      (setq cand (funcall orig cand prefix suffix index _start))
      (concat
        (if (= vertico--index index)
          (propertize "» " 'face '(:foreground "#80adf0" :weight bold))
          "  ")
        cand))))


(use-package orderless
  :ensure t
  :defer t
  :after vertico
  :init
  (setq completion-styles '(orderless basic)
		completion-category-defaults nil
		completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :ensure t
  :after vertico
  :hook
  (after-init . marginalia-mode))

(use-package consult
  :ensure t
  :defer t
  :init
  (advice-add #'register-preview :override #'consult-register-window)
  (setq xref-show-xrefs-function #'consult-xref
		xref-show-definitions-function #'consult-xref))

(use-package embark
  :ensure t
  :defer t
  :bind
  (("C-." . embark-act)))


(use-package embark-consult
  :ensure t
  :defer t
  :demand t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;;; LSP Configurations
(use-package lsp-mode
  :ensure t
  :defer t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (
   (bash-ts-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :custom
  (lsp-inlay-hint-enable nil)
  (lsp-completion-provider :none)
  (lsp-session-file (locate-user-emacs-file ".lsp-session"))
  (lsp-log-io nil)
  (lsp-idle-delay 0)
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
  (lsp-semantic-tokens-enable nil)
  )

(use-package cc-mode
  :ensure t
  :defer t
  :hook
  (
   (c++-ts-mode . lsp-deferred)
   (c-ts-mode . lsp-deferred)
   )
  )



(use-package zig-mode
  :ensure t
  :defer t
  :hook (zig-mode . lsp-deferred))


(use-package go-mode
  :ensure t
  :defer t
  :config
  ;; Hack for gopls working on MacOs
  (add-to-list 'exec-path "~/go/bin")
  :hook (go-ts-mode . lsp-deferred))

(use-package rust-mode
  :ensure t
  :defer t
  :hook (rust-ts-mode . lsp-deferred))


(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langsever-command "pyright")
  :hook (python-ts-mode . (lambda ()
						 (require 'lsp-pyright)
						 (lsp))))


(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-code-actions t))


(use-package consult-lsp
  :ensure t
  :defer t)


(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (global-treesit-auto-mode)
  (treesit-auto-add-to-auto-mode-alist 'all))

;;; END: LSP Configurations


(use-package flycheck
  :ensure t
  :after lsp-ui
  :hook (prog-mode . flycheck-mode))

;;; COMPANY
(use-package company
  :defer t
  :ensure t
  :custom
  (company-tooltip-align-annotations t)
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.2)
  (company-tooltip-maximum-width 50)
  :config
  (define-key company-active-map (kbd "C-y")
			  (lambda ()
				(interactive)
				(company-show-doc-buffer)))
  (define-key company-active-map [tab] 'company-complete-selection)
  (define-key company-active-map (kbd "TAB") 'company-complete-selection)
  (define-key company-active-map [ret] 'company-complete-selection)
  (define-key company-active-map (kbd "RET") 'company-complete-selection)
  :hook
  (after-init . global-company-mode)) ;; Enable Company Mode globally after initialization.


;; MAGIT
(use-package magit
  :ensure t
  :defer t)


(use-package diff-hl
  :ensure t
  :defer t
  :hook
  (find-file . (lambda ()
				 (global-diff-hl-mode)
				 (diff-hl-flydiff-mode)
				 (diff-hl-margin-mode)))
  :custom
  (diff-hl-side 'left)
  (diff-hl-margin-symbols-alist '((insert . "+")
								  (delete . "-")
								  (change . "~")
								  (unknown . "?")
								  (ignored . "i"))))


(use-package indent-guide
  :ensure t
  :defer t
  :hook
  (prog-mode . indent-guide-mode)
  :config
  (setq indent-guide-char "|"))

  
(use-package evil
  :ensure t
  :defer t
  :hook
  (after-init . evil-mode)
  :init
  (setq evil-eant-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-u-delete t)
  :config
  (evil-set-undo-system 'undo-tree)
  (setq evil-leader/in-all-states t)
  (setq evil-want-fine-undo t)
  (define-key evil-normal-state-map (kbd "C-.") nil)
  (define-key evil-insert-state-map (kbd "C-.") nil)

  (evil-mode 1))


(use-package evil-collection
  :defer t
  :ensure t
  :custom
  (evil-collection-want-find-usage-bindings t)
  :hook
  (evil-mode . evil-collection-init))

(use-package general
  :ensure t
  :defer t
  :after evil
  :config
  (general-create-definer vandvag/leader-keys
	:keymaps '(normal visual emacs)
	:prefix "SPC"
	:global-prefix "C-SPC")

	;; Buffer key defines
	(general-define-key
	  :states 'motion
	  "] b" 'switch-to-next-buffer
	  "[ b" 'switch-to-prev-buffer)

	(vandvag/leader-keys
	  "b"  '(:ignore t :which-key "buffer")
	  "bd" '(kill-current-buffer :which-key "kill current buffer")
	  "bi" '(ibuffer :which-key "ibuffer")
	  ","  '(consult-buffer :which-key "switch buffer"))

	;;; Diagnostics key defines
	(general-define-key
	  :states 'motion
	  "] d" 'flycheck-next-error
	  "[ d" 'flycheck-previous-error)

	(vandvag/leader-keys
	  "x"  '(:ignore t :which-key "diagnostics")
	  "xx" '(flycheck-list-errors :which-key "show diagnostics"))

	;; Find keys
	(vandvag/leader-keys
	  "f"   '(:ignore t :which-key "Find")
	  "ff"  '(consult-fd :which-key "Find file")
	  "fr"  '(consult-recent-file :which-key "Recent files"))

	;; Search keymaps
	(vandvag/leader-keys
	  "s"  '(:ignore t :which-key "search")
	  "sg" '(consult-ripgrep :which-key "search in files")
	  "sl" '(consult-line :which-key "search for line in buffer"))

	;; Magit key defines
	(vandvag/leader-keys
	  "g"  '(:ignore t :which-key "magit")
	  "gg" '(magit-status :which-key "magit status")
	  "gl" '(magit-log-current :which-key "magit log current")
	  "gd" '(magit-diff-buffer-file :which-key "magit diff current")
	  "gb" '(vc-annotate :which-key "blame current buffer"))

	;; <leader> k key defines
	(vandvag/leader-keys
	  "k"  '(:ignore t :which-key "utilities")
	  "kt" '(consult-theme :which-key "change theme"))
	
	;; projectile
	(vandvag/leader-keys
	  "p"  '(projectile-command-map :which-key "projectile"))

	;; org mode
	(vandvag/leader-keys
	  "o"  '(:ignore t :which-key "org")
	  "ol" '(org-insert-link :which-key "insert link")
	  "ot" '(org-todo :which-key "todo")
	  "o," '(org-insert-structure-template :which-key "structure template"))

	;; lsp
	(general-define-key
	 :states 'motion
	 "gr" 'lsp-find-references
	 "K"  'lsp-describe-thing-at-point)

	(vandvag/leader-keys
	  "c"  '(:ignore t :which-key "lsp")
	  "cl" '(lsp-format-buffer :which-key "format buffer")
	  "cs" '(consult-lsp-symbols :which-key "workspace symbols")
	  "ci" '(lsp-imenu :which-key "lsp-imenu")
	  "cd" '(consult-lsp-diagnostics :which-key "diagnostics"))
	

	;; rest
	(vandvag/leader-keys
	  "u"   '(undo-tree-visualize :which-key "undo tree")
	  "SPC" '(find-file :which-key "find file")
	  "."   '(embark-act :which-key "embark act")
	  "/"   '(consult-line :which-key "consult line"))

	(general-define-key
	 :states 'motion
	 "gc" 'comment-or-uncomment-region)

	(general-define-key
	 "C-." 'embark-act)
  )

(use-package markdown-mode
  :defer t
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)            ;; Use gfm-mode for README.md files.
  :init (setq markdown-command "multimarkdown")) ;; Set the Markdown processing command.

(use-package org)

(use-package undo-tree
  :ensure t
  :defer t
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


(use-package doom-modeline
  :ensure t
  :defer t
  :custom
  (doom-modeline-buffer-filen-name-style 'buffer-name)
  (doom-modeline-project-detection 'project)
  (doom-modeline-buffer-name t)
  (doom-modeline-vcs-max-length 25)
  :config
  (if vandvag-use-nerd-fonts
      (setq doom-modeline-icon t)
    (setq doom-modeline-icon nil))
  (setq doom-modeline-evil t)
  (setq doom-modeline-hud t)
  (setq doom-modeline-project-detection 'auto)
  (setq doom-modeline-battery t)
  :hook
  (after-init . doom-modeline-mode))


(use-package anzu
  :ensure t
  :config
  (global-anzu-mode +1))


(use-package evil-anzu
  :ensure t
  :after (evil anzu)
  :config
  (global-anzu-mode +1))


(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/dev/"))
  :config
  (projectile-mode +1))

(use-package ef-themes
  :ensure t)

(load-theme 'ef-autumn t)

(provide 'init)
;;; init.el ends here
