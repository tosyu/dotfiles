(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes (quote ("301f218fa2357b2aa2a433e049f87e059c5ba2ad8b161634d758fbf007bf1d0a" default)))
 '(default-tab-width 4 t)
 '(kill-ring-max 99)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(make-backup-files nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'load-path "~/.emacs.d/")
(put 'upcase-region 'disabled nil)
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)
(load-theme 'monokai t)
(column-number-mode t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(global-linum-mode t)
(setq frame-title-format
	  '("emacs%@" (:eval (system-name)) ": " (:eval (if (buffer-file-name)
	       (abbreviate-file-name (buffer-file-name))
                  "%b")) " [%*]"))
(defconst animate-n-steps 3) 
  (defun emacs-reloaded ()
    (animate-string (concat ";; Initialization successful, welcome to "
  			  (substring (emacs-version) 0 16)
			  ".")
		  0 0)
	(newline-and-indent)  (newline-and-indent))
(add-hook 'after-init-hook 'emacs-reloaded)  
(setq inhibit-startup-message t)
 
 ;; BACKUPS
(setq version-control t ;; Use version numbers for backups
	kept-new-versions 16 ;; Number of newest versions to keep
	kept-old-versions 2 ;; Number of oldest versions to keep
	delete-old-versions t ;; Ask to delete excess backup versions?
	backup-by-copying-when-linked t) ;; Copy linked files, don't rename.

(defun force-backup-of-buffer ()
    (let ((buffer-backed-up nil))
      (backup-buffer)))

(add-hook 'before-save-hook  'force-backup-of-buffer)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.b"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

 ;; AUTODETECT TAB/SPACES

;; (require 'guess-style)
;;(autoload 'guess-style-set-variable "guess-style" nil t)
;;(autoload 'guess-style-guess-variable "guess-style")
;;(autoload 'guess-style-guess-all "guess-style" nil t)
;;(add-hook 'c-mode-common-hook 'guess-style-guess-all)
;;(global-guess-style-info-mode 1)
(require 'dtrt-indent)
(dtrt-indent-mode 1)
