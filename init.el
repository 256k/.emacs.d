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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("835d934a930142d408a50b27ed371ba3a9c5a30286297743b0d488e94b225c5f" default))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(acme-theme norns evil slime flycheck-eglot treesit-auto lua-mode forth-mode marginalia company vertico exec-path-from-shell expand-region git-gutter magit consult which-key highlight-indent-guides try org-bullets doom-themes))
 '(tab-bar-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono for Powerline" :foundry "nil" :slant normal :weight regular :height 160 :width normal)))))
