(set-face-attribute 'default nil :family "Monaspace Neon" :height 130)
(load-theme 'modus-vivendi-tinted t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode 1)

;; org
(setq org-agenda-files (directory-files-recursively "~/org" "\\.org$"))
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; package
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(package-install 'magit)
