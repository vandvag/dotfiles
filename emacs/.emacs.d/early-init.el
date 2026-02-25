;;; early-init.el --- Early init configuration of Evangelos Vandoros -*- lexical-binding: t; -*-
;; Author: Evangelos Vandoros
;; Package-Requires: ((emacs "30.0"))

;;; Commentary:
;; This is my personal configuration

;;; Code:

;; Nice Performance hacks
(setq gc-cons-threshold #x40000000)
(setq read-process-output-max (* 1024 1024 16)) ;; 16MB

;; Some startup noise
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; (add-to-list 'default-frame-alist '(font . "Terminess Nerd Font-18"))
(set-face-attribute 'default nil :family "Iosevka NFM" :height 170)


(provide 'early-init)
;;; early-init.el ends here
