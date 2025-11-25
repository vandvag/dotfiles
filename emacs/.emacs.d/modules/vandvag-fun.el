(defun vandvag/toggle-line-numbers ()
  "Toggles the display of line numbers. Applies to all buffers."
  (interactive)
  (if (bound-and-true-p display-line-numbers)
      (global-display-line-numbers-mode -1)
    (global-display-line-numbers-mode)))


(defun vandvag/copy-line ()
  "Copy the current line to kill-ring."
  (interactive)
  (kill-ring-save (line-beginning-position) (line-end-position))
  (message "Line copied."))

(defun vandvag/toggle-whitespace ()
  "Toggles whitespace rendering via enabling/disabling whitespace-mode."
  (interactive)
  (if (bound-and-true-p whitespace-mode)
	  (progn
		(message "whitespace-mode: Off")
		(whitespace-mode -1))
	(progn
	  (message "whitespace-mode: On")
	  (whitespace-mode 1))))


(provide 'vandvag-fun)

