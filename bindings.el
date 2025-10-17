(defun 256k/edit-config ()
  "edit config files"
  (interactive)
  (find-file "~/.emacs.d/config-minimal.org"))

(defun dn/today ()
    (interactive)
    (setq  today (format-time-string "%Y%m%d")) ;; set today's date
    (find-file (format "~/.emacs.d/dailynotes/%s.org" today ))
    (if (or (= (length (buffer-string)) 0)
            (not (equal (dn/get-first-line) today)))
        (progn
          (beginning-of-buffer)
          (insert (format "%s\n========\n\n" today))))
    (end-of-buffer))

  ;; define keymap
  (keymap-global-set "C-c d" 'dn/today)

(defun dn/get-first-line ()
  (substring-no-properties (car (split-string (buffer-string) "\n"))))

  (defun dn/inc-days ()
        (setq  today (format-time-string "%Y%m%d")) ;; set today's date
        ;; write logic here to get the date. convert it to number.
        ;; increment it one and check if file exists, if yes open if not, do nothing
        ;; write another function same but for decremental functionality
        )

(keymap-global-set "C-x C-r" 'recentf-open)
(keymap-global-set "C-x C-}" 'flip-window-updown-256k)
(keymap-global-set "C-x C-]" 'flip-window-leftright-256k)
(keymap-global-set "C-x C-/" '256k/edit-config)
(keymap-global-set "C-x t s" '256k/new-scratch-tab)
(keymap-global-set "M-TAB" 'dabbrev-expand)
(keymap-global-set "C-;" 'execute-extended-command) ;; replaces M-x as an easier solution.
(keymap-global-set "C-," 'revert-buffer)
(keymap-global-set "C-x C-." '256k/toggle-font-size)
(keymap-global-set "C-c C-b C-b" 'browse-url-of-buffer)
(keymap-global-set "C-c w" 'ace-window)
