(add-to-list 'load-path "~/.emacs.d/modules")

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(setq auto-save-default nil)
(setq create-lockfiles nil)

(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Emacs configuration
(use-package emacs
  :ensure nil
  :custom
  (autosave-default nil)
  (create-lockfiles nil)
  ;; Default tab width
  (tab-width 4)
  (tab-always-indent nil)
  ;; Disable backup files ~
  (make-backup-files nil)
  ;; Enables context menu.
  (context-menu-mode t)
  (enable-recursive-minibuffers t)
  (use-short-answers t)
  ;; Display a counter showing the number of the current and
  ;; matches. Place it before the prompt, though it can be after it.
  (isearch-lazy-count t)
  (lazy-count-prefix-format "(%s/%s) ")
  (lazy-count-suffix-format nil)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

;; UI stuff
(set-face-attribute 'default nil :family "Iosevka NFM" :height 160)
(when (eq system-type 'darwin)
  (set-face-attribute 'default nil :family "Iosevka NFM" :height 170))

(use-package ef-themes
  :ensure t)

(use-package doric-themes
  :ensure t)

(load-theme 'doric-obsidian t)

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

(use-package keycast
  :ensure t)

;; Here are packages that utilize the minibuffer
(use-package which-key
  :ensure nil
  :defer t
  :hook
  (after-init . which-key-mode))

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
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildchar t)) ;; Emacs 31: partial-completion behaves like a substring

(use-package consult
  :ensure t
  :bind (("M-s M-g" . consult-ripgrep)
	 ("M-s M-b" . consult-buffer)))


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
  :bind ( :map grep-mode-map
	  ("e" . wgrep-change-to-wgrep-mode)
	  ("C-x C-q" . wgrep-change-to-wgrep-mode)
	  ("C-c C-c" . wgrep-finish-edit)))

;;; COMPANY
;; (use-package company
;;   :defer t
;;   :ensure t
;;   :custom
;;   (company-tooltip-align-annotations t)
;;   (company-minimum-prefix-length 1)
;;   (company-idle-delay 0.2)
;;   (company-tooltip-maximum-width 50)
;;   :config
;;   (define-key company-active-map (kbd "C-y")
;; 			  (lambda ()
;; 				(interactive)
;; 				(company-show-doc-buffer)))
;;   (define-key company-active-map [tab] 'company-complete-selection)
;;   (define-key company-active-map (kbd "TAB") 'company-complete-selection)
;;   (define-key company-active-map [ret] 'company-complete-selection)
;;   (define-key company-active-map (kbd "RET") 'company-complete-selection)
;;   :hook
;;   (after-init . global-company-mode)) ;; Enable Company Mode globally after initialization.

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  (setq tab-always-indent 'complete)
  :custom
  (corfu-cycle t)
  (corfu-popupinfo-delay '(0.75 . 0.5))
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.2)
  (corfu-echo-documentation 0.3)
  (corfu-preview-current nil)
  :config
  :hook ((prog-mode . (lambda () (setq-local corfu-auto t)))
		 (shell-mode . corfu-mode)
		 (eshell-mode . corfu-mode)))
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
  (lsp-semantic-tokens-enable nil))

(require 'simpc-mode)
;; Automatically enabling simpc-mode on files with extensions like .h, .c, .cpp, .hpp
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))
(with-eval-after-load 'lsp-mode
  ;; map major mode -> language id
  (add-to-list 'lsp-language-id-configuration '(simpc-mode . "c"))
  (add-to-list 'lsp-language-id-configuration '(simpc-mode . "cpp"))

  (lsp-register-client
   (make-lsp-client
	:new-connection (lsp-stdio-connection "clangd")
	:major-modes '(simpc-mode)
	:server-id 'clangd-simpc)))
(add-hook 'simpc-mode-hook #'lsp)
;; (use-package c-mode
;;   :ensure nil
;;   :defer t
;;   :hook (c-mode . lsp-deferred))

;; (use-package c++-mode
;;   :ensure nil
;;   :defer t
;;   :hook (c++-mode . lsp-deferred))

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


(require 'vandvag-fun)

;; Keybinds
(global-set-key (kbd "C-`") 'vandvag/toggle-line-numbers)
(global-set-key (kbd "C-c y") 'vandvag/copy-line)
(global-set-key (kbd "<f2>") 'vandvag/toggle-whitespace)
