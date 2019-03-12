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
 '(column-number-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (ag helm-company counsel-projectile org-projectile-helm org-projectile gitconfig gitconfig-mode helm-git-grep helm-projectile company ansible csharp-mode docker docker-compose-mode flymake flymake-css flymake-json flymake-less flymake-python-pyflakes gruvbox-theme helm helm-ag js3-mode json-mode json-navigator magit magit-gitflow markdown-mode markdown-preview-mode org org-kanban python python-mode tide typescript-mode web-mode)))
 '(safe-local-variable-values (quote ((css-indent-offset . 2))))
 '(save-place nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
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

;; helm config
(require 'helm-config)
(require 'helm)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; projectile settings
(defun projectile-get-ext-command() ""
     (concat "C:\\Windows\\es.exe -r " 
        (concat (replace-regexp-in-string "/" "\\\\" default-directory t t) 
        ".+[^\\\\]\\.[^\\\\]+$ | tr '\\n' '\\0'"))
     )
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-project-search-path '("C:/projects"))
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching nil)


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

;; company config
(setq company-tooltip-align-annotations t)
(setq company-idle-delay 0)
(setq company-dabbrev-downcase nil)
(add-hook 'after-init-hook 'global-company-mode)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; disable shitty indents
(electric-indent-mode +1)

;; flycheck
(require 'flycheck)
(global-flycheck-mode)

;; line numbers
(global-display-line-numbers-mode)

;; custom keys
(eval-after-load 'helm-projectile
  '(define-key my-mode-map [helm-ag] 'helm-projectile-ag))

