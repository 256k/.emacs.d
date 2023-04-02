;; install and init use-package:
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa")
			 ("elpa" . "https://elpa.gnu.org/packages")))
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
;;;;;;;;;;;;;;;;;;


 ;; sets the font-face size:
(set-face-attribute 'default nil :height 127)
;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; set theme:
(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))


;;(use-package plan9-theme
;;  :config
;;  (load-theme 'plan9 t))
;;;;;;;;;;;;

;; install autocomplete package: Ivy:
(use-package ivy
  :diminish
  :config
  (ivy-mode 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; install which-key:
(use-package which-key
  :config
  (which-key-mode 1))
;;;;;;;;;;;;;;;;;;;;;


;; some default stuff emacs adds to my init i dont know why:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(which-key ivy zenburn-theme use-package plan9-theme)))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
