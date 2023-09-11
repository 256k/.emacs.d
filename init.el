(toggle-frame-maximized)


(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))

(org-babel-load-file
 (expand-file-name
  "bindings.org"
  user-emacs-directory))
(put 'narrow-to-region 'disabled nil)
