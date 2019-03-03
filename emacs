

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(setq package-check-signature nil)
(package-initialize)
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("cd4d1a0656fee24dc062b997f54d6f9b7da8f6dc8053ac858f15820f9a04a679" default)))
 '(package-selected-packages
   (quote
    (web-mode company ansible docker docker-compose-mode flymake flymake-css flymake-json flymake-python-pyflakes markdown-mode markdown-preview-mode mustache mustache-mode org org-kanban python python-mode typescript-mode csharp-mode csound-mode js3-mode bibclean-format helm tide magit gruvbox-theme)))
 '(safe-local-variable-values
   (quote
    ((js2-basic-offset . 2)
     (js-indent-level . 2)
     (c-basic-offset . tab-width)
     (indent-tabs-mode nil))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))

;; some simple settings
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; theme & font
(load-theme 'gruvbox t)

(require 'magit)
(require 'helm)
(put 'upcase-region 'disabled nil)

;; tide conf
(require 'tide)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; disable shitty indents
(electric-indent-mode +1)

;; flycheck
(require 'flycheck)
(globa-flycheck-mode)
