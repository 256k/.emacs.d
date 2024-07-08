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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono" :foundry "nil" :slant normal :weight regular :height 160 :width normal)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("317754d03bb6d85b5a598480e1bbee211335bbf496d441af4992bbf1e777579e" "4343cbc036f09361b2912119c63573433df725f599bfbdc16fb97f1e4847a08b" "1ea82e39d89b526e2266786886d1f0d3a3fa36c87480fad59d8fab3b03ef576e" "c5878086e65614424a84ad5c758b07e9edcf4c513e08a1c5b1533f313d1b17f1" default))
 '(package-selected-packages
   '(workgroups2 ef-themes modus-themes embark which-key vertico try treesit-auto solo-jazz-theme slime org-bullets norns marginalia magit lsp-ui json-mode highlight-indent-guides git-gutter forth-mode flycheck-eglot expand-region exec-path-from-shell evil doom-themes consult-lsp company atom-one-dark-theme acme-theme)))
