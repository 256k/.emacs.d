;;; monomelight-theme.el --- monomelight
;;; Version: 1.0
;;; Commentary:
;;; A theme called monomelight
;;; Code:


(deftheme monomelight "DOCSTRING for monomelight")
  (custom-theme-set-faces 'monomelight
   '(default ((t (:foreground "#6d6d6d" :background "#ffffff" ))))
   '(cursor ((t (:background "#fd9100" ))))
   '(fringe ((t (:background "#282828" ))))
   '(mode-line ((t (:foreground "#ffffff" :background "#e5e5e5" ))))
   '(region ((t (:background "#ffd99c" ))))
   '(secondary-selection ((t (:background "#d6fdf8" ))))
   '(font-lock-builtin-face ((t (:foreground "#66c7db" ))))
   '(font-lock-comment-face ((t (:foreground "#a5a5a5" ))))
   '(font-lock-function-name-face ((t (:foreground "#b8bb26" ))))
   '(font-lock-keyword-face ((t (:foreground "#fb9b00" ))))
   '(font-lock-string-face ((t (:foreground "#b8bb26" ))))
   '(font-lock-type-face ((t (:foreground "#46b4b4" ))))
   '(font-lock-constant-face ((t (:foreground "#e74470" ))))
   '(font-lock-variable-name-face ((t (:foreground "#83a598" ))))
   '(minibuffer-prompt ((t (:foreground "#29d0ab" :bold t ))))
   '(font-lock-warning-face ((t (:foreground "red" :bold t ))))
   )

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'monomelight)

;;; monomelight-theme.el ends here
