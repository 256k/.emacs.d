(defun 256k/edit-config ()
  "edit config files"
  (interactive)
  (find-file-other-tab "~/.emacs.d/config-minimal.org"))

(keymap-global-set "C-x C-r" 'recentf-open)
(keymap-global-set "C-x C-]" 'flip-window-updown-256k)
(keymap-global-set "C-x C-}" 'flip-window-leftright-256k)
(keymap-global-set "C-x C-/" '256k/edit-config)
(keymap-global-set "M-TAB" 'dabbrev-expand)
(keymap-global-set "C-;" 'execute-extended-command) ;; replaces M-x as an easier solution.
(keymap-global-set "C-," 'revert-buffer)


;; set 2 themes to toggle between
;; (setq ef-themes-to-toggle '(ef-light ef-night))
;; (keymap-global-set "C-x C-." 'ef-themes-toggle)
;; (keymap-global-set "C-`" 'vterm-toggle)
