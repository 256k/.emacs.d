(setq package-enable-at-startup t)
(setq lexical-binding t)
(setq backup-directory-alist '(("" . "~/.emacs.d/backup/")))
(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 5    ; keep some new versions
      kept-old-versions 2)   ; and some old ones, too
(setq use-package-always-ensure t)

(require 'package)
(setq package-archives
      '(("gnu-elpa" . "https://elpa.gnu.org/packages/")
	("gnu-elpa-devel" . "https://elpa.gnu.org/devel/")
	("nongnu" . "https://elpa.nongnu.org/nongnu/")
	("melpa" . "https://melpa.org/packages/")))

;; Highest number gets priority (what is not mentioned has priority 0)
(setq package-archive-priorities
      '(("gnu-elpa" . 3)
	("melpa" . 2)
	("nongnu" . 1)))
(package-initialize)

(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen 1)

(global-display-line-numbers-mode 1)
(global-visual-line-mode t) ;; wraps the text in a buffer

(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(require 'org-tempo)
;; allows the ability to generate #+begin blocks using `<s or q or e...etc

(use-package magit :ensure t)
(use-package consult :ensure t)
(use-package vertico
  :ensure t
  :config
  (vertico-mode))
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))
(use-package uxntal-mode
  :ensure t)
(setenv "PATH" (concat (getenv "PATH") ":/Users/fayekhelmi/bin/uxn/bin/"))
(setenv "PATH" (concat (getenv "PATH") ":/Users/fayekhelmi/.nvm/versions/node/v21.3.0/bin/node"))
