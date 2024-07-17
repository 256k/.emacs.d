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
 '(default ((t (:family "JetBrains Mono" :foundry "nil" :slant normal :weight regular :height 160 :width normal))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "purple"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))
 ;; '(tab-bar-tab ((t :box (:line-width 4 :color "#e3e4e8" :style nil))))
 ;; '(tab-bar-tab-inactive ((t :box (:line-width 4 :color "#eff1f5" :style nil))))
 ;; '(tab-line-tab ((t)))
 ;; '(tab-line-tab-active ((t)))
 ;; '(tab-line-tab-inactive ((t)))
 ;; '(vertical-border ((t :background "#eff1f5" :foreground "#eff1f5")))
 ;; '(window-divider ((t (:background "#eff1f5" :foreground "#eff1f5"))))
 ;; '(window-divider-first-pixel ((t (:background "#eff1f5" :foreground "#eff1f5"))))
 ;; '(window-divider-last-pixel ((t (:background "#eff1f5" :foreground "#eff1f5")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("68402fcd2a704e2584ff1ad99de7ad80bf8822e1f6e7a2f997981a7713ba6a70" "317754d03bb6d85b5a598480e1bbee211335bbf496d441af4992bbf1e777579e" "4343cbc036f09361b2912119c63573433df725f599bfbdc16fb97f1e4847a08b" "1ea82e39d89b526e2266786886d1f0d3a3fa36c87480fad59d8fab3b03ef576e" "c5878086e65614424a84ad5c758b07e9edcf4c513e08a1c5b1533f313d1b17f1" default))
 '(package-selected-packages
   '(treemacs golden-ratio spacious-padding rainbow-delimiters catppuccin-theme catpuccin-theme workgroups2 ef-themes modus-themes embark which-key vertico try treesit-auto solo-jazz-theme slime org-bullets norns marginalia magit lsp-ui json-mode highlight-indent-guides git-gutter forth-mode flycheck-eglot expand-region exec-path-from-shell evil doom-themes consult-lsp company atom-one-dark-theme acme-theme)))
