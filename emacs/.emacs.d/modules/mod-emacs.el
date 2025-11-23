(use-package emacs
  :ensure nil
  :custom
  (autoo-save-default nil)
  (create-lockfiles nil)
  (delete-by-moving-to-trash t)
  (delete-selection-mode 1)
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

  :config
  (set-face-attribute 'default nil :family "Iosevka NFM" :height 170)
  (when (eq system-type 'darwin)
	(set-face-attribute 'default nil :family "Iosevka NFM" :height 170))
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

(provide 'mod-emacs)
