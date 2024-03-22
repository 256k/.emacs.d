(defun flip-window-leftright-256k ()
  (interactive)
  (split-root-window-right)
  (delete-window)
  (window-swap-states))

(defun flip-window-updown-256k ()
  (interactive)
  (split-root-window-below)
  (delete-window)
  (window-swap-states))




