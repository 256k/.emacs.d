;; -*- lexical-binding: t; -*-
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
        (set-face-attribute 'default nil :height 180)
        (setq big-font-mode nil))
    (progn
      (set-face-attribute 'default nil :height 220)
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

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

  ;; (use-package doom-themes
  ;;   :ensure t
  ;;   :config
  ;;   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
  ;;         doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;;   (doom-themes-visual-bell-config)
  ;;   (doom-themes-org-config))
  ;; (load-theme 'doom-one t)
(load-theme 'ef-spring t)

(use-package spacious-padding
  :ensure t
  :config
  (setq spacious-padding-widths '(:internal-border-width 60 :right-divider-width 30 :scroll-bar-width 8))
        (spacious-padding-mode 1))

(defalias 'list-buffers 'consult-buffer)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(global-visual-line-mode t) ;; wraps the text in a buffer

(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(require 'org-tempo)
;; allows the ability to generate #+begin blocks using `<s or q or e...etc

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets :ensure t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package norns
  :ensure t
  :bind
  (
   :map norns-mode-map
   ("C-c e b" . norns-load-current-script)
   ("C-c e r" . norns-send-selection)

   :map norns-maiden-repl-mode-map
   ("C-c e b" . norns-rerun)

   :map norns-sc-repl-mode-map
   ("C-." . norns-sc-stop))
  )

(use-package golden-ratio
  :ensure
  :bind
  ("C-c g" . golden-ratio-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package evil 
  :ensure t
  :init
  (setq evil-undo-system 'undo-redo)
  (setq evil-disable-insert-state-bindings t)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode))

(use-package try :ensure t)

;; M-x customize-group is a way to find all the variables associated with a package.
  (use-package which-key
    :ensure t
    :config
    (setq which-key-max-display-columns 2)
    ;; (setq which-key-min-column-description-width 0.001)
    ;; (setq which-key-separator ":")
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

(use-package treemacs
  :ensure t
:bind
("C-c b" . treemacs)
  :config
  (treemacs-follow-mode t)
  (treemacs-project-follow-mode t))

(use-package neotree
:ensure t)
(setq neo-window-fixed-size nil)

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

(use-package embark
  :ensure t
  :after
  (use-package embark-consult
    :ensure t))

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl"))

(use-package flycheck-eglot
  :ensure t
  :config
  (global-flycheck-eglot-mode 1))

(add-to-list 'load-path "~/.emacs.d/site-lisp")

(use-package forth-mode
  :ensure t)

(use-package lua-mode 
  :ensure t)

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(setq treesit-font-lock-level 4)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-ts-mode))

;; LSP-mode solution

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (typescript-ts-mode . lsp-deferred)
         (tsx-ts-mode . lsp-deferred))
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))
(fset #'jsonrpc--log-event #'ignore) ;; helps remove laggy typing
(use-package consult-lsp
  :ensure t)


;; ================================================================================

;; eglot solution

;; (use-package eglot
;;   :ensure t)
;; (add-hook 'prog-mode-hook 'eglot-ensure)

;; (fset #'jsonrpc--log-event #'ignore) ;; helps remove laggy typing

(use-package prettier
          :ensure t)
