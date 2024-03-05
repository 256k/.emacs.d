(defun 256k/edit-config ()
  "edit config files"
  (interactive)
  (find-file-other-tab "~/.emacs.d/config-minimal.org"))

(keymap-global-set "C-x C-r" 'recentf-open)
(keymap-global-set "C-x C-]" 'window-swap-states)
(keymap-global-set "C-x C-/" '256k/edit-config)

;; set 2 themes to toggle between
;; (setq ef-themes-to-toggle '(ef-light ef-night))
;; (keymap-global-set "C-x C-." 'ef-themes-toggle)
;; (keymap-global-set "C-`" 'vterm-toggle)
