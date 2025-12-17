(toggle-frame-maximized)

(load-file "~/.emacs.d/flip-window-direction.el")
(load-file "~/.emacs.d/new-scratch-tab.el")

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
(setq line-spacing 0.2)
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "JetBrains Mono" :foundry "nil" :slant normal :weight regular :height 160 :width normal))))
;;  '(fringe ((t :background "#f6fff9")))
;;  '(header-line ((t :box (:line-width 4 :color "#e8f0f0" :style nil))))
;;  '(header-line-highlight ((t :box (:color "#34494a"))))
;;  '(keycast-key ((t)))
;;  '(line-number ((t :background "#f6fff9")))
;;  '(mode-line ((t :box (:line-width 4 :color "#90e8b0" :style nil))))
;;  '(mode-line-active ((t :box (:line-width 4 :color "#90e8b0" :style nil))))
;;  '(mode-line-highlight ((t :box (:color "#34494a"))))
;;  '(mode-line-inactive ((t :box (:line-width 4 :color "#e0e6e3" :style nil))))
;;  '(tab-bar-tab ((t :box (:line-width 4 :color "#f6fff9" :style nil))))
;;  '(tab-bar-tab-inactive ((t :box (:line-width 4 :color "#c0c6c3" :style nil))))
;;  '(tab-line-tab ((t)))
;;  '(tab-line-tab-active ((t)))
;;  '(tab-line-tab-inactive ((t)))
;;  '(vertical-border ((t :background "#f6fff9" :foreground "#f6fff9")))
;;  '(window-divider ((t (:background "#f6fff9" :foreground "#f6fff9"))))
;;  '(window-divider-first-pixel ((t (:background "#f6fff9" :foreground "#f6fff9"))))
;;  '(window-divider-last-pixel ((t (:background "#f6fff9" :foreground "#f6fff9")))))

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes
;;    '("bcf36f20d3b751f6a9a437ccf66abbbb1bc4917ebfbd8134683686e3ff39bb49"
;;      "2f1319858fe696d1b58f03ca7d8ee9b3beda100ded1cd8b2c20fd4696091bf4c"
;;      "4825b816a58680d1da5665f8776234d4aefce7908594bea75ec9d7e3dc429753"
;;      "68402fcd2a704e2584ff1ad99de7ad80bf8822e1f6e7a2f997981a7713ba6a70"
;;      "317754d03bb6d85b5a598480e1bbee211335bbf496d441af4992bbf1e777579e"
;;      "4343cbc036f09361b2912119c63573433df725f599bfbdc16fb97f1e4847a08b"
;;      "1ea82e39d89b526e2266786886d1f0d3a3fa36c87480fad59d8fab3b03ef576e"
;;      "c5878086e65614424a84ad5c758b07e9edcf4c513e08a1c5b1533f313d1b17f1"
;;      default))
;;  '(package-selected-packages
;;    '(acme-theme atom-one-dark-theme catppuccin-theme catpuccin-theme
;; 		company consult-lsp doom-themes ef-themes
;; 		eglot-booster embark evil exec-path-from-shell
;; 		expand-region flycheck-eglot forth-mode git-gutter
;; 		golden-ratio highlight-indent-guides json-mode lsp-ui
;; 		magit marginalia modus-themes neotree norns orderless
;; 		org-bullets prettier prettier-rc rainbow-delimiters
;; 		slime smart-comment solo-jazz-theme spacious-padding
;; 		treemacs treesit-auto try vertico which-key
;; 		workgroups2 zenburn-theme
;; 		~/.emacs.d/themes/op1light.el))
;;  '(package-vc-selected-packages
;;    '((eglot-booster :vc-backend Git :url
;; 		    "https://github.com/jdtsmith/eglot-booster"))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1ea82e39d89b526e2266786886d1f0d3a3fa36c87480fad59d8fab3b03ef576e"
     default))
 '(package-selected-packages
   '(acme-theme anti-zenburn-theme atom-one-dark-theme catppuccin-theme
		company consult-lsp doom-themes doric-themes ef-themes
		eglot-booster embark emmet-mode evil
		exec-path-from-shell expand-region flycheck-eglot
		forth-mode git-gutter golden-ratio
		highlight-indent-guides json-mode lsp-ui magit
		marginalia modus-themes neotree norns orderless
		org-bullets prettier prettier-rc rainbow-delimiters
		slime smart-comment solo-jazz-theme spacious-padding
		treemacs treesit-auto try vertico vue-mode which-key
		workgroups2 zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
