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

(use-package iceberg-theme
  :config
  (iceberg-theme-create-theme-file) ;; Generates the Solarized variant
  (load-theme 'solarized-iceberg-dark t))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :config
  (exec-path-from-shell-initialize))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

(use-package magit)

(use-package org
  :init
  (setq org-agenda-files (directory-files-recursively "~/org" "\\.org$"))
  (setq org-default-notes-file "~/org/from-emacs.org")
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)))

;; Code Completion
(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)                 ; Allows cycling through candidates
  (corfu-auto t)                  ; Enable auto completion
  (corfu-auto-prefix 2)           ; Minimum length of prefix for completion
  (corfu-auto-delay 0)            ; No delay for completion
  (corfu-popupinfo-delay '(0.5 . 0.2))  ; Automatically update info popup after that numver of seconds
  (corfu-preview-current 'insert) ; insert previewed candidate
  (corfu-preselect 'prompt)
  (corfu-on-exact-match nil)      ; Don't auto expand tempel snippets
  ;; Optionally use TAB for cycling, default is `corfu-complete'.
  :bind (:map corfu-map
	      ("M-SPC"      . corfu-insert-separator)
	      ("TAB"        . corfu-next)
	      ([tab]        . corfu-next)
	      ("S-TAB"      . corfu-previous)
	      ([backtab]    . corfu-previous)
	      ("S-<return>" . corfu-insert)
	      ("RET"        . corfu-insert))

      :init
      (global-corfu-mode)
      (corfu-history-mode)
      (corfu-popupinfo-mode) ; Popup completion info
      :config
      (add-hook 'eshell-mode-hook
                (lambda () (setq-local corfu-quit-at-boundary t
                                       corfu-quit-no-match t
                                       corfu-auto nil)
                  (corfu-mode))
                nil
                t))

;; options
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode 1)
(set-face-attribute 'default nil :family "Monaspace Neon" :height 160)
(setq scroll-error-top-bottom t)
