(toggle-frame-maximized)
;; install and init use-package:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; basic settings:
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 16)
(setq visible-bell 0)
(tab-bar-mode 1)
(menu-bar--display-line-numbers-mode-absolute)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(setq font-lock-maximum-decoration t)
;;;;;;;;;;;;;;;;;;


 ;; sets the font-face size:
(set-face-attribute 'default nil :height 210)
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set theme:
;;(use-package zenburn-theme
;;  :config
;;  (load-theme 'zenburn t))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-gruvbox t))

;;;;;;;;;;;;

;; install autocomplete package: Ivy:
(use-package ivy
  :diminish
  :config
  (ivy-mode 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; install which-key:
(use-package which-key
  :diminish
  :config
  (setq which-key-idle-delay 0.1)
  (which-key-mode 1))
;;;;;;;;;;;;;;;;;;;;;

;; evil mode:
(use-package evil
  :config
  (evil-mode t))
;; ;;;;;;;;;;;;;

;; LSP mode:
(load "~/.emacs.d/lsp.el")
;;;;;;;;;;;;


;; norns:
(use-package norns
  :config
  (add-hook 'lua-mode-hook #'norns-mode-maybe-activate)
  (add-hook 'sclang-mode-mode-hook #'norns-mode-maybe-activate))
;;;;;;;;;


;; some default stuff emacs adds to my init i dont know why:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(mustache-mode evil lua-mode lsp-ivy rustic company lsp-ui lsp-mode evil-mode doom-themes ivy-rich which-key ivy zenburn-theme use-package plan9-theme)))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; IMPORTS
(load "~/.emacs.d/keymaps.el")
