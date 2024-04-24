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
 '(package-selected-packages
   '(atom-one-dark-theme solo-jazz-theme which-key vertico try treesit-auto slime org-bullets norns marginalia magit lsp-ui git-gutter forth-mode flycheck-eglot expand-region exec-path-from-shell evil doom-themes consult-lsp company acme-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono" :foundry "nil" :slant normal :weight regular :height 160 :width normal)))))
