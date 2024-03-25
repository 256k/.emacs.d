(toggle-frame-maximized)

(load-file "~/.emacs.d/flip-window-direction.el")

(org-babel-load-file
 (expand-file-name
  "config-minimal.org"
  user-emacs-directory))

(org-babel-load-file
 (expand-file-name
  "bindings.org"
   user-emacs-directory))
