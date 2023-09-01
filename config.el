(setq backup-directory-alist '(("" . "~/.emacs.d/backup/")))
(setq backup-by-copying t    ; Don't delink hardlinks
    delete-old-versions t  ; Clean up the backups
    version-control t      ; Use version numbers on backups,
    kept-new-versions 5    ; keep some new versions
    kept-old-versions 2)   ; and some old ones, too

(defvar elpaca-installer-version 0.5)
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
(use-package evil
    :init      ;; tweak evil's configuration before loading it
    (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
    (setq evil-want-keybinding nil)
    (setq evil-vsplit-window-right t)
    (setq evil-split-window-below t)
    (evil-mode))
  (use-package evil-collection
    :after evil
    :config
    (setq evil-collection-mode-list '(dashboard dired ibuffer))
    (evil-collection-init))
  (use-package evil-tutor)

;;Turns off elpaca-use-package-mode current declartion
;;Note this will cause the declaration to be interpreted immediately (not deferred).
;;Useful for configuring built-in emacs features.
(use-package emacs :elpaca nil :config (setq ring-bell-function #'ignore))

;; Don't install anything. Defer execution of BODY
;; (elpaca nil (message "deferred"))

;; (use-package general
;;   :config
;;   (general-evil-setup)

;;   ;; set up 'SPC' as the global leader key
;;   (general-create-definer 256k/leader-keys
;;     :states '(normal insert visual emacs)
;;     :keymaps 'override
;;     :prefix "SPC" ;; set leader
;;     :global-prefix "M-SPC") ;; access leader in insert mode

;;   (256k/leader-keys
;;     "." '(find-file :wk "Find file")
;;     "TAB TAB" '(comment-line :wk "Comment lines"))

;;   (256k/leader-keys
;;     "b" '(:ignore t :wk "buffer")
;;     "b b" '(switch-to-buffer :wk "Switch buffer")
;;     "b i" '(ibuffer :wk "Ibuffer")
;;     "b k" '(kill-this-buffer :wk "Kill this buffer")
;;     "b n" '(next-buffer :wk "Next buffer")
;;     "b p" '(previous-buffer :wk "Previous buffer")
;;     "b r" '(revert-buffer :wk "Reload buffer"))

;;   (256k/leader-keys
;;     "f"   '(:ignore t :wk "terminal")
;;     "f f" '((lambda () (interactive) (find-file "./")) :wk "open file browser")
;;     "f c" '((lambda () (interactive) (find-file "~/.emacs.d/config.org")) :wk "Edit emacs config")
;;     "f r"   '(counsel-recentf :wk "toggle file details")
;;     "d"   '(dired-hide-details-mode :wk "toggle file details"))

;;   (256k/leader-keys
;;     "e" '(:ignore t :wk "Evaluate")    
;;     "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
;;     "e d" '(eval-defun :wk "Evaluate defun containing or after point")
;;     "e e" '(eval-expression :wk "Evaluate and elisp expression")
;;     "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
;;     "e r" '(eval-region :wk "Evaluate elisp in region")) 

;;    (256k/leader-keys
;;     "h" '(:ignore t :wk "Help")
;;     "h f" '(describe-function :wk "Describe function")
;;     "h v" '(describe-variable :wk "Describe variable")
;;     ;; "h r r" '((lambda () (interactive) (load-file "~/.config/emacs/init.el")) :wk "Reload emacs config"))
;;     "h r r" '(reload-init-file :wk "Reload emacs config"))

;;    (256k/leader-keys
;;     "t" '(:ignore t :wk "Toggle")
;;     "t l" '(display-line-numbers-mode :wk "Toggle line numbers")
;;     "t w" '(visual-line-mode :wk "Toggle truncated lines")
;;     "t t" '(ansi-term :wk "open ansi-term"))
;;  )

(defun reload-init-file ()
  (interactive)
  (load-file user-init-file)
  (load-file user-init-file))

;; load custom themes folder
         (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
      ;; install doom themes   
      (use-package doom-themes
        :ensure t
        :config
        ;; Global settings (defaults)
        (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
              doom-themes-enable-italic t) ; if nil, italics is universally disabled
        ;; (load-theme 'doom-spacegrey t)

        ;; Enable flashing mode-line on errors
        (doom-themes-visual-bell-config)
        ;; Enable custom neotree theme (all-the-icons must be installed!)
        (doom-themes-neotree-config)
        ;;(doom-themes-treemacs-config)
        ;; Corrects (and improves) org-mode's native fontification.
        (doom-themes-org-config))


      (use-package catppuccin-theme
:ensure t
:config
;; 'frappe, 'latte, 'macchiato, or 'mocha
      (setq catppuccin-flavor 'frappe)
      (load-theme 'catppuccin t))

(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :hook (dired-mode . (lambda () (all-the-icons-dired-mode t))))

(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package rainbow-mode
  :diminish
  :hook org-mode prog-mode)

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
	which-key-max-description-length 25
	which-key-allow-imprecise-window-fit t
	which-key-separator " → " ))

(use-package counsel
  :after ivy
  :config (counsel-mode))

(use-package ivy
  :bind
  ;; ivy-resume resumes the last Ivy-based completion.
  (("C-c C-r" . ivy-resume)
   ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package ivy-rich
  :after ivy
  :ensure t
  :init (ivy-rich-mode 1) ;; this gets us descriptions in M-x.
  :custom
  (ivy-virtual-abbreviate 'full
   ivy-rich-switch-buffer-align-virtual-buffer t
   ivy-rich-path-style 'abbrev)
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))

(use-package company
  :defer 2
  :diminish
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay .1)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
  (global-company-mode t))

(use-package company-box
  :after company
  :diminish
  :hook (company-mode . company-box-mode))

(use-package dashboard
  :ensure t 
  :init
  (setq initial-buffer-choice 'dashboard-open)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "Electronics. music. coding. art.")
  ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner

  ;; (setq dashboard-startup-banner "/home/dt/.config/emacs/images/dtmacs-logo.png")  ;; use custom image as banner

  (setq dashboard-center-content nil) ;; set to 't' for centered content
  (setq dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 3)
                          (projects . 3)
                          (registers . 3)))
  :custom 
  (dashboard-modify-heading-icons '((recents . "file-text")
                                      (bookmarks . "book")))
  :config
  (dashboard-setup-startup-hook))

(use-package flycheck
  :ensure t
  :defer t
  :diminish
  :init (global-flycheck-mode))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 20      ;; sets modeline height
        doom-modeline-bar-width 5    ;; sets right bar width
        doom-modeline-persp-name t   ;; adds perspective name to modeline
        doom-modeline-persp-icon t)) ;; adds folder icon next to persp name

(use-package neotree
  :config
  (setq neo-smart-open t
        neo-show-hidden-files t
        neo-window-width 55
        neo-window-fixed-size nil
        inhibit-compacting-font-caches t
        projectile-switch-project-action 'neotree-projectile-action) 
        ;; truncate long file names in neotree
        (add-hook 'neo-after-create-hook
           #'(lambda (_)
               (with-current-buffer (get-buffer neo-buffer-name)
                 (setq truncate-lines t)
                 (setq word-wrap nil)
                 (make-local-variable 'auto-hscroll-mode)
                 (setq auto-hscroll-mode nil)))))

(use-package projectile
  :config
  (projectile-mode 1))

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

(use-package rust-mode
  :ensure nil
  :interpreter ("rust" . rust-mode))

(use-package lua-mode
  :ensure nil
  :interpreter ("lua" . lua-mode)
  :custom
  (lua-indent-level 2))

(use-package typescript-mode
  :ensure nil
  :interpreter ("ts" . typescript-mode))
