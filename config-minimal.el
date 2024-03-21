(setq package-enable-at-startup t)
(setq lexical-binding t)
(setq backup-directory-alist '(("" . "~/.emacs.d/backup/")))
(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 5    ; keep some new versions
      kept-old-versions 2)   ; and some old ones, too
(setq use-package-always-ensure t)
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
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(global-display-line-numbers-mode 1)
(global-visual-line-mode t) ;; wraps the text in a buffer

(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(require 'org-tempo)
;; allows the ability to generate #+begin blocks using `<s or q or e...etc

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets :ensure t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package highlight-indent-guides
  :ensure t
  :config
  (progn
    (setq highlight-indent-guides-method 'character)
    (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
    (highlight-indent-guides-mode)))

;; I've temporarily removed it because it was causing issues when trying to create new file names that matched existing file names
;; (use-package orderless
;;   :ensure t
;;   :custom
;;   (completion-styles '(orderless basic))
;;   (completion-category-overrides '((file (styles basic partial-completion)))))

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

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package corfu
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode))

;; Enable auto completion and configure quitting
(setq corfu-auto t
      corfu-quit-no-match 'separator) ;; or t
;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))

(use-package project-explorer
  :ensure t
  :bind
  ("C-x C-`" . project-explorer-toggle))

;; Uxntal

;;; Set location of uxntal-mode.el
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;;; If you want to use a different assembler
(setq uxntal-assembler "ruxnasm")

;;; Enable the mode and associate with the .tal extension 
(require 'uxntal-mode)
(add-to-list 'auto-mode-alist '("\\.tal\\'" . uxntal-mode))

(use-package forth-mode
  :ensure t)

(use-package lua-mode 
  :ensure t)

(use-package treesit-auto
  :ensure t
  :config
  (treesit-auto-add-to-auto-mode-alist 'all))
(setq treesit-font-lock-level 4)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-ts-mode))

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (typescript-ts-mode . lsp-deferred))
  :commands lsp)

 (use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
