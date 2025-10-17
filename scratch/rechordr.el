20250125
;; rechordr: 

(display-buffer "buffer-name" '((display-buffer-in-side-window) (side . right)))
(display-buffer-pop-up-window)

(get-buffer-create "rechordr")
(display-buffer "rechordr"
                '((display-buffer-pop-up-window)
                  (window-width . 80)
                  (window-height . 20)))

(defun dailynotes-today ()
  (interactive)
  (setq  today (format-time-string "%Y%m%d")) ;; set today's date
  (find-file (format "~/.emacs.d/dailynotes/%s.org" today ))
  (if (or (= (length (buffer-string)) 0)
	  (not (equal (dailynotes-get-first-line) today)))
      (progn
	(beginning-of-buffer)
	(insert (format "%s\n" today))))
  (end-of-buffer))


(defun dailynotes-get-first-line ()
  (substring-no-properties (car (split-string (buffer-string) "\n"))))


;; testing stuff here:
(defun my-after-command-action ()
  "Run after every command."
  (print "test"))

(remove-hook 'post-command-hook 'my-after-command-action)

(defun my-capture-input ()
  "Capture a single key event and display it."
  (interactive)
  (let ((event (read-event "Press any key: ")))
    (insert "You pressed: %s" (key-description (vector event)))))

