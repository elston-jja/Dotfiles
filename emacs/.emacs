;; Emacs Init File

;;Include Melpa library
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; Custom Themes Safe; Load brin
(setq custom-safe-themes t)
(load-theme 'brin)

;; Autocomplete C and C++ headers
(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;; Company mode for AC Irony
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; Irony Mode For C and C++
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Spell check Global and C++
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; AVY jump to character or line
(avy-setup-default)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "M-g f") 'avy-goto-line)

;; Folding similar to vim
(vimish-fold-global-mode 1)

(global-set-key (kbd "C-x /") #'vimish-fold)
(global-set-key (kbd "C-x j") #'vimish-fold-toggle)

;; Shift to change tabs
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Gets rid of menu tool and scroll bar w/toggles
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-set-key [f7] 'toggle-scroll-bar)
(global-set-key [f9] 'toggle-menu-bar-mode-from-frame)

;; Saves autosaves to Dir --cleaner method-- 
(setq backup-directory-alist
     `((".*" . ,"/home/ea/Dropbox/Backups")))
(setq auto-save-file-name-transforms
     `((".*" ,"/home/ea/Dropbox/Backups")))

;; Closing Parenthesis and other things
(electric-pair-mode 1)

;; Auto Complete for Lisp...etc
(ac-config-default)

;; Show line numbers
(global-linum-mode t)
(add-hook 'linum-before-numbering-hook (lambda () (setq linum-format "%d ")))

;; yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")

;; Powerline for Emacs
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
(require 'cl)
(setq powerline-arrow-shape 'arrow14)   ;; give your mode-line curves
;; Style the powerline bar
(set-face-background 'ac-candidate-face "azure4")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "grey59")

;; Highlight the Current Line
(global-hl-line-mode 1)
;; To customize the background color
(set-face-background 'hl-line "#354054") 

;; Custom Faces
(custom-set-faces
 '(default ((t (:family "Inconsolata" :foundry "PfEd" :slant normal :weight normal :height 103 :width normal))))
 '(mode-line ((t (:foreground "#AAAAAA" :background "#4F5B66" :box nil))))
 '(mode-line-inactive ((t (:foreground "#333333" :background "#4F5B66" :box nil)))))

;; Set Variables
(custom-set-variables
 '(inhibit-startup-screen t))

;; Disable sleep
(global-unset-key (kbd "C-z"))
(global-unset-key [(control x)(control z)])

;; Windows Style Undo
(global-set-key [(control z)] 'undo)

;; When in C++ and C change the Comment Column to 60 char. 
(add-hook 'c++-mode-hook '(lambda ()
    (setq comment-column 60)))
(add-hook 'c-mode-hook '(lambda ()
    (setq comment-column 60)))

;; Change the default directory into my personal C++ file
(setq default-directory "/home/ea/Dropbox/Projects/personal/c++")

;; Change default compilaton command
(setq compile-command "g++ -Wall -o ")

;; Search For Files
; Define a search index
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq gc-cons-threshold 20000000)

;; Smex Autocomplete for Commands
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

