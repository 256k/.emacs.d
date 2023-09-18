;; (toggle-frame-maximized)
(toggle-frame-fullscreen)

(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))

(org-babel-load-file
 (expand-file-name
  "bindings.org"
  user-emacs-directory))
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("06ed754b259cb54c30c658502f843937ff19f8b53597ac28577ec33bb084fa52" "5a00018936fa1df1cd9d54bee02c8a64eafac941453ab48394e2ec2c498b834a" "11cc65061e0a5410d6489af42f1d0f0478dbd181a9660f81a692ddc5f948bf34" "9cd57dd6d61cdf4f6aef3102c4cc2cfc04f5884d4f40b2c90a866c9b6267f2b3" "788121c96b7a9b99a6f35e53b7c154991f4880bb0046a80330bb904c1a85e275" "6128465c3d56c2630732d98a3d1c2438c76a2f296f3c795ebda534d62bb8a0e3" "d516f1e3e5504c26b1123caa311476dc66d26d379539d12f9f4ed51f10629df3" "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041" "f5e666fba0ded6ae9be004314ecf5f7feb605cdb84711b5c5ffd81acfb831183" "4ff1c4d05adad3de88da16bd2e857f8374f26f9063b2d77d38d14686e3868d8d" default))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(doom-modeline flycheck dashboard ivy-rich all-the-icons-ivy-rich all-the-icons catppuccin-theme doom-themes))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Droid Sans Mono Dotted for Powerline" :foundry "nil" :slant normal :weight regular :height 160 :width normal)))))
