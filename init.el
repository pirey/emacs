;; custom file
(setq custom-file "~/.emacs-custom.el")

;; setup packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; themes and packages
(use-package spacemacs-theme
  :config
  (load-theme 'spacemacs-dark t))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

(use-package magit)

(use-package org
  :init
  (setq org-agenda-files (directory-files-recursively "~/org" "\\.org$"))
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)))

;; options
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode 1)
(set-face-attribute 'default nil :family "Monaspace Neon" :height 160)
(setq scroll-error-top-bottom t)
