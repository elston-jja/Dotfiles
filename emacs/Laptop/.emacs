(package-initialize)

(require 'package)
 (add-to-list 'package-archives
 '("marmalade" . "http://marmalade-repo.org/packages/") 
t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(load-theme 'doom-one t)


;; Gets rid of menu tool and scroll bar w/toggles
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-set-key [f7] 'toggle-scroll-bar)
(global-set-key [f9] 'toggle-menu-bar-mode-from-frame)

;; Smooth Scrolling

(require 'smooth-scroll)
(smooth-scroll-mode 1)


;; Tabs vs spaces
(setq-default indent-tabs-mode t)
(setq-default tab-width 4) 
(defvaralias 'c-basic-offset 'tab-width)

;; Disable sleep
(global-unset-key (kbd "C-z"))
(global-unset-key [(control x)(control z)])

;; Windows Style Undo
(global-set-key [(control z)] 'undo)

;; Show line numbers
(global-linum-mode t)
(add-hook 'linum-before-numbering-hook (lambda () (setq linum-format "%d ")))

;; Set default font
(set-face-attribute 'default nil
                    :family "Fantastique Sans Mono"
                    :height 100
                    :weight 'normal
                    :width 'normal)


(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Closijng Parenthesis and other things
(electric-pair-mode 1)
(setq c-default-style "linux"
	  c-basic-offset 4)

;; ; Show brackets
(show-paren-mode 1)

(require 'smartparens-config)

(sp-local-pair 'c++-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))

(defun my-create-newline-and-enter-sexp (&rest _ignored)
  ;;;"Open a new brace or bracket expression, with relevant newlines and indent. "
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

;; Auto Indent
(add-hook 'lisp-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))

;; Function Arguments 
(ivy-mode 1)
(fa-config-default)

;; Irony Mode For C and C++
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Company mode for AC Irony

(add-hook 'after-init-hook 'global-company-mode)

(eval-after-load 'company
'(add-to-list 'company-backends 'company-irony))

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; AutoComplete Commands
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; no startup msg  
(setq inhibit-startup-message t)

;; Change the default directory
(setq default-directory "/home/ea/Dropbox/Projects/personal_projects/c++/")

;; Saves autosaves to Dir --cleaner method--
(setq backup-directory-alist
     `((".*" . ,"/home/ea/Dropbox/Backups")))
(setq auto-save-file-name-transforms
      `((".*" ,"/home/ea/Dropbox/Backups")))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("d6db7498e2615025c419364764d5e9b09438dfe25b044b44e1f336501acd4f5b" default)))
 '(package-selected-packages
   (quote
	(flycheck doom-themes smooth-scrolling smooth-scroll smex smartparens gruvbox-theme function-args company-irony autopair))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Powerline
(require 'powerline)
(powerline-default-theme)

(require 'airline-themes)
(load-theme 'airline-doom-one)

;; Auto Correct
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
