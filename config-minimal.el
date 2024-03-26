(setq package-enable-at-startup t)
(setq lexical-binding t)
(setq backup-directory-alist '(("" . "~/.emacs.d/backup/")))
(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 5    ; keep some new versions
      kept-old-versions 2)   ; and some old ones, too
(setq use-package-always-ensure t)
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/auto-save/" t)))
(pending-delete-mode 1) ; when a piece of text is marked, typing will delete and replace that selection.

(require 'package)
(setq package-archives
      '(("gnu-elpa" . "https://elpa.gnu.org/packages/")
        ("gnu-elpa-devel" . "https://elpa.gnu.org/devel/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

                                        ; Highest number gets priority (what is not mentioned has priority 0)
(setq package-archive-priorities
      '(("gnu-elpa" . 3)
        ("melpa" . 2)
        ("nongnu" . 1)))
(package-initialize)

(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq frame-inhibit-implied-resize t) ; disables frame resizing when font resizing happens
(setq inhibit-startup-screen 1)
(electric-pair-mode 1)  ;; (){}""<>[]

(defvar big-font-mode nil)
(defun 256k/toggle-font-size ()
  "Toggle between two font sizes."
  (interactive)
  (if big-font-mode
      (progn
        (set-face-attribute 'default nil :height 160)
        (setq big-font-mode nil))
    (progn
      (set-face-attribute 'default nil :height 200)
      (setq big-font-mode t))))

(setq xref-search-program ;; Prefer ripgrep, then ugrep, and fall back to regular grep.
      (cond
       ((or (executable-find "ripgrep")
            (executable-find "rg"))
        'ripgrep)
       ((executable-find "ugrep")
        'ugrep)
       (t
        'grep)))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; (load-theme 'doom-oksolar-light t)
  ;; (load-theme 'doom-one t)
  (load-theme 'doom-palenight t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(defalias 'list-buffers 'consult-buffer)

(global-display-line-numbers-mode 1)
(global-visual-line-mode t) ;; wraps the text in a buffer

(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(require 'org-tempo)
;; allows the ability to generate #+begin blocks using `<s or q or e...etc

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets :ensure t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package try :ensure t)

(use-package highlight-indent-guides
  :ensure t
  :config
  (progn
    (setq highlight-indent-guides-method 'character)
    (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
    (highlight-indent-guides-mode)))

(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

(use-package consult
  :ensure t)

(use-package magit :ensure t)

(use-package git-gutter
  ;; adds markings for file changes
  :ensure t
  :config
  (global-git-gutter-mode +1))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  (vertico-multiform-mode)
  :config
  (setq vertico-multiform-commands
        '((consult-line buffer))))

(use-package company
  :ensure t
  :bind ("C-." . company-complete)
  :init
  (setq company-minimum-prefix-length 1)
  (add-hook 'after-init-hook 'global-company-mode))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package flycheck-eglot
  :ensure t
  :config
  (global-flycheck-eglot-mode 1))

(add-to-list 'load-path "~/.emacs.d/site-lisp")

(use-package forth-mode
  :ensure t)

(use-package lua-mode 
  :ensure t)

;; (use-package treesit-auto
  ;; :ensure t
  ;; :config
  ;; (treesit-auto-add-to-auto-mode-alist 'all))

(use-package treesit-auto
:custom
(treesit-auto-install 'prompt)
:config
(treesit-auto-add-to-auto-mode-alist 'all)
(global-treesit-auto-mode))

(setq treesit-font-lock-level 4)
(fset #'jsonrpc--log-event #'ignore) ;; helps remove laggy typing
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-ts-mode))
