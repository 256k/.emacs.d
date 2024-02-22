(setq backup-directory-alist '(("" . "~/.emacs.d/backup/")))
(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 5    ; keep some new versions
      kept-old-versions 2)   ; and some old ones, too

(defvar elpaca-installer-version 0.6)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil
                              :files (:defaults (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (call-process "git" nil buffer t "clone"
                                       (plist-get order :repo) repo)))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))


;; Install use-package support
(elpaca elpaca-use-package
  ;; Enable :elpaca use-package keyword.
  (elpaca-use-package-mode)
  ;; Assume :elpaca t unless otherwise specified.
  (setq elpaca-use-package-by-default t))

;; Block until current queue processed.
(elpaca-wait)

;;When installing a package which modifies a form used at the top-level
;;(e.g. a package which adds a use-package key word),
;;use `elpaca-wait' to block until that package has been installed/configured.
;;For example:
;;(use-package general :demand t)
;;(elpaca-wait)

;; Expands to: (elpaca evil (use-package evil :demand t))

;; (use-package evil
;;      :init      ;; tweak evil's configuration before loading it
;;      (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
;;      (setq evil-want-keybinding nil)
;;      (setq evil-vsplit-window-right t)
;;      (setq evil-split-window-below t))
;; (add-hook 'prog-mode-hook 'evil-mode)

;; ;;  (use-package evil-collection
;;     :after evil
;;     :config
;;     (setq evil-collection-mode-list '(dashboard dired ibuffer))
;;     (evil-collection-init))
;;   (use-package evil-tutor)

;; ;;Turns off elpaca-use-pa
;;  ckage-mode current declartion
;;Note this will cause the declaration to be interpreted immediately (not deferred).
;;Useful for configuring built-in emacs features.
(use-package emacs :elpaca nil :config (setq ring-bell-function #'ignore))

;; Don't install anything. Defer execution of BODY
;; (elpaca nil (message "deferred"))

(use-package ef-themes
  :config
  (load-theme 'ef-light t))

(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen 1)

(global-display-line-numbers-mode 1)
(global-visual-line-mode t) ;; wraps the text in a buffer

(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(use-package all-the-icons
  
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :hook (dired-mode . (lambda () (all-the-icons-dired-mode t))))

(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'org-tempo)
;; allows the ability to generate #+begin blocks using `<s or q or e...etc

(use-package transient)
  (use-package magit
    :after transient)

(use-package consult)
;; consult is kindof like telescope. it is able to list various
;; types of things like buffers or files or search words
;; using fuzzy finding
;; this would be really helpful for better navigation around
;; must map a bunch of its functions to commands

(use-package which-key
  :init
    (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
	which-key-sort-order #'which-key-key-order-alpha
	which-key-sort-uppercase-first nil
	which-key-add-column-padding 1
	which-key-max-display-columns nil
	which-key-min-display-lines 6
	which-key-side-window-slot -10
	which-key-side-window-max-height 0.25
	which-key-idle-delay 0.2
	Which-key-max-description-length 25
	which-key-allow-imprecise-window-fit t
	which-key-separator " → " ))

(use-package counsel
  :after ivy
  :config (counsel-mode))

(use-package ivy
  :bind
  ;; ivy-resume resumes the last Ivy-based completion.
  (("C-c C-r" . ivy-resume)
   ("C-x C-b" . ivy-switch-buffer-other-window))
  :custom
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode))

(use-package all-the-icons-ivy-rich

  :init (all-the-icons-ivy-rich-mode 1))

(use-package ivy-rich
  :after ivy

  :init (ivy-rich-mode 1) ;; this gets us descriptions in M-x.
  :custom
  (ivy-virtual-abbreviate 'full
   ivy-rich-switch-buffer-align-virtual-buffer t
   ivy-rich-path-style 'abbrev)
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))

(use-package company

  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay .1)
  (company-minimum-prefix-length 1)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
   (global-company-mode t))

(use-package company-box
  :after company
  :diminish
  :hook (company-mode . company-box-mode))

(use-package flycheck
  :defer t
  :diminish
  :init (global-flycheck-mode))

(setq treesit-font-lock-level 4)
(use-package treesit-auto
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))

(use-package vterm
:config
(setq shell-file-name "/bin/sh"
      vterm-max-scrollback 5000))

(use-package vterm-toggle
  :after vterm
  :config
  (setq vterm-toggle-fullscreen-p nil)
  (setq vterm-toggle-scope 'project)
  (add-to-list 'display-buffer-alist
               '((lambda (buffer-or-name _)
                     (let ((buffer (get-buffer buffer-or-name)))
                       (with-current-buffer buffer
                         (or (equal major-mode 'vterm-mode)
                             (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                  (display-buffer-reuse-window display-buffer-at-bottom)
                  ;;(display-buffer-reuse-window display-buffer-in-direction)
                  ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                  ;;(direction . bottom)
                  ;;(dedicated . t) ;dedicated is supported in emacs27
                  (reusable-frames . visible)
                  (window-height . 0.4))))

(use-package spacious-padding
  :config
  (setq spacious-padding-widths
        '(:internal-border-width 60 :right-divider-width 30 :scroll-bar-width 8))
        (spacious-padding-mode 1))

(use-package norns
  :bind (
       ("C-c e b" . norns-load-current-script)
       ("C-c e s" . norns-send-selection)
       ("C-c e r" . norns-rerun)
       ("C-." . norns-sc-stop))

  :config
  (add-hook 'lua-mode-hook #'norns-mode-maybe-activate)
  (add-hook 'sclang-mode-mode-hook #'norns-mode-maybe-activate))

(use-package uxntal-mode
  :bind (("C-c C-." . uxntal-explain-word)))

(use-package rust-mode
  :interpreter ("rust" . rust-mode))

(use-package lua-mode
  :interpreter ("lua" . lua-mode)
  :custom
  (lua-indent-level 2))

(use-package typescript-mode
  :interpreter ("ts" . typescript-mode))

(use-package zig-mode)

(use-package go-mode
  :ensure t

  :config
  (add-to-list 'exec-path "/Users/fayekhelmi/go/bin")
  (setenv "PATH" (concat (getenv "PATH") ":/Users/fayekhelmi/go/bin")))
