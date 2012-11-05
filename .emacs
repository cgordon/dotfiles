(add-to-list 'load-path "/Users/charles/.emacs.d")

;; disable vc-git so I can use sshfs
(require 'vc)
(setq vc-handled-backends ())

(require 'color-theme)
(require 'color-theme-zenburn)
(color-theme-zenburn)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(require 'ido)

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(defvar backup-dir (expand-file-name "~/.emacs.d/backup/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/auto-save/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq line-number-mode t)
(setq column-number-mode t)

(setq-default fill-column 79)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq python-check-command "/Users/charles/bin/pychecker.sh")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-case-fold t)
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rst-level-1-face ((t nil)) t)
 '(rst-level-2-face ((t nil)) t)
 '(rst-level-3-face ((t nil)) t)
 '(rst-level-4-face ((t nil)) t)
 '(rst-level-5-face ((t nil)) t)
 '(rst-level-6-face ((t nil)) t))
