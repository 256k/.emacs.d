;; (toggle-frame-maximized)	
;; (toggle-frame-fullscreen)	     

(org-babel-load-file
 (expand-file-name
  "config.org"
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
   '("f5e666fba0ded6ae9be004314ecf5f7feb605cdb84711b5c5ffd81acfb831183" "a0997c8cd72b848c675e66531265b68845cfdb222b32762ac8773c1dc957d10a" "f5661fd54b1e60a4ae373850447efc4158c23b1c7c9d65aa1295a606278da0f8" "0af489efe6c0d33b6e9b02c6690eb66ab12998e2649ea85ab7cfedfb39dd4ac9" "ed3b4cacc4e8f7fc8846f5d13813c13862af94dc3391bbaa92d95099a9a24885" "553a6676b68142a652c034cfe2179a2271240bc1e33611c2de3a7207ce7608ca" "54dfd03eab9edebfb8c5e66b1912dad789ed2a9a0ce43e8ac11ee6cc45731e66" default))
 '(package-selected-packages
   '(eglot transient-cycles spacious-padding monomelight-theme company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono for Powerline" :foundry "nil" :slant normal :weight regular :height 160 :width normal))))
 '(fringe ((t :background "whitesmoke")))
 '(header-line ((t :box (:line-width 4 :color "grey90" :style nil))))
 '(header-line-highlight ((t :box (:color "black"))))
 '(keycast-key ((t)))
 '(line-number ((t :background "whitesmoke")))
 '(mode-line ((t :box (:line-width 4 :color "gray75" :style nil))))
 '(mode-line-active ((t :box (:line-width 4 :color "gray75" :style nil))))
 '(mode-line-highlight ((t :box (:color "black"))))
 '(mode-line-inactive ((t :box (:line-width 4 :color "gray40" :style nil))))
 '(tab-bar-tab ((t :box (:line-width 4 :color "grey85" :style nil))))
 '(tab-bar-tab-inactive ((t :box (:line-width 4 :color "grey75" :style nil))))
 '(window-divider ((t :background "whitesmoke" :foreground "whitesmoke")))
 '(window-divider-first-pixel ((t :background "whitesmoke" :foreground "whitesmoke")))
 '(window-divider-last-pixel ((t :background "whitesmoke" :foreground "whitesmoke"))))
