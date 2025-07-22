;; custom file
(setq custom-file "~/.emacs-custom.el")

;; setup packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defvar my-packages
  '(magit evil spacemacs-theme))

(defun my-packages-installed-p ()
  (cl-loop for p in my-packages
           when (not (package-installed-p p)) do (cl-return nil)
           finally (cl-return t)))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (package-refresh-contents)
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; package config
(require 'use-package)
(use-package spacemacs-theme
  :config
  (load-theme 'spacemacs-dark t))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

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
