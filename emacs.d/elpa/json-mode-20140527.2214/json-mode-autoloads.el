;;; json-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (json-mode-show-path json-mode json-mode-beautify)
;;;;;;  "json-mode" "json-mode.el" (21381 64570 840400 150000))
;;; Generated autoloads from json-mode.el

(autoload 'json-mode-beautify "json-mode" "\
Beautify / pretty-print the active region (or the entire buffer if no active region).

\(fn)" t nil)

(autoload 'json-mode "json-mode" "\
Major mode for editing JSON files

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(autoload 'json-mode-show-path "json-mode" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("json-mode-pkg.el") (21381 64570 893832
;;;;;;  62000))

;;;***

(provide 'json-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; json-mode-autoloads.el ends here
