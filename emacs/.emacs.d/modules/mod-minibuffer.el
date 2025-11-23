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


(provide 'mod-minibuffer)
