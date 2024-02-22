(defun 256k/edit-config ()
  "edit config files"
  (interactive)
  (find-file "~/.emacs.d/config.org"))

(keymap-global-set "C-x C-r" 'recentf-open)

;; change window positions
(keymap-global-set "C-x C-]" 'window-swap-states)

;; set 2 themes to toggle between
(setq ef-themes-to-toggle '(ef-light ef-night))
(keymap-global-set "C-x C-." 'ef-themes-toggle)

(keymap-global-set "C-x C-/" '256k/edit-config)
(keymap-global-set "C-`" 'vterm-toggle)
