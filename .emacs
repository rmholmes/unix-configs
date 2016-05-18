;; This is my .emacs file
;; 
;; Ryan Holmes, April 2016

;;
;; PACKAGES 
;; ----------------------------------------------------------------------
(if (>= emacs-major-version 24)
    (progn
;;;; Package managing through ELPA: ;;;;
(require 'package)

;; Add some repositories and initialize:
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; Want these packages:
(defvar myPackages
  '(better-defaults
    material-theme
    matlab-mode
    auctex
    magit
   ))
;; (unfortunately matlab-emacs isn't in ELPA)

;; Install these packages if not already installed:
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)
))

;;
;; APPEARENCE
;; ----------------------------------------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(when (require 'material-theme nil t) 
    (progn (load-theme 'material t))) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(set-face-attribute 'default nil :height 90) ;; text size
(setq frame-title-format "%b") ;; put current buffer name in title bar
;; (set-background-color "black") ;; Background color
;; (set-foreground-color "white") ;; Foreground color

; text decoration
(require 'font-lock)
;(setq font-lock-maximum-decoration 1)
(global-font-lock-mode 1)
(global-hi-lock-mode nil)
(setq jit-lock-contextually 1)
(setq jit-lock-stealth-verbose 1)

;;
;; FUNCTIONALITY
;; ----------------------------------------------------------------------

;; Minor settings:
(setq-default auto-fill-function 'do-auto-fill) ;; auto-fill-mode default
(setq backup-inhibited t) ; disable backup
;; (setq auto-save-default nil) ; disable auto save
(setq-default indent-tabs-mode nil) ; always use spaces, not tabs, when indenting
(setq require-final-newline 1) ; require final newlines in files when they are saved
(setq-default truncate-lines 1) ; diable line wrap
(setq truncate-partial-width-windows 1) ; diable line warp in partial windows
(global-set-key (kbd "C-c ;") 'comment-region)
(global-set-key (kbd "C-c :") 'uncomment-region)
;; Fill column with - till end of column function:
(defun fill-to-end ()
  (interactive)
  (save-excursion
    (end-of-line)
    (while (< (current-column) 70)
      (insert-char ?-))))
(global-set-key (kbd "C-c '") 'fill-to-end)

;; LATEX: ---------------------

(setq latex-run-command "pdflatex") ;; set to pdflatex
;;defun tex-view ()
;;    (interactive)
;;    (tex-send-command "xpdf" (tex-append tex-print-file ".pdf")))
;;'(TeX-PDF-mode t)) ;; set to pdf view

;; (add-hook 'LaTeX-mode-hook 'flyspell-mode) ;; flyspell in latex
;; (autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

;; (setq LaTeX-command-style 
;;   '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)"))) ;; Funny error fix (depreciated?)

;;Aspell (windows):
;;(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
;;(setq ispell-program-name "aspell")
;;(setq ispell-personal-dictionary "~/.emacs.d/custom.ispell")
;;(require 'ispell)

;; PYTHON: ------------------

;; ; from python.el
(require 'python)

(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "--colors=Linux"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(defun set-python-path-from-shell-PYTHONPATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PYTHONPATH'")))
    (setenv "PYTHONPATH" path-from-shell)))

;; anaconda python:
(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "^.*\n.*shell\n" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'")))) 
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(set-exec-path-from-shell-PATH)


;; Elpy: (needs ein, elpy, flycheck, py-autopep8 packages above)
;; (elpy-enable)
;; (elpy-use-ipython)
;; ;; use flycheck not flymake with elpy
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))
;; ;; enable autopep8 formatting on save
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; ORG MODE: ---------------------

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

