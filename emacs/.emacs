;; ;;; Emacs Init File
;; ;;;

;;Include Melpa library and Marmalade
(require 'package)
 (add-to-list
 'package-archives
 '("marmalade" . "http://marmalade-repo.org/packages/")
 t)

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
(load-theme 'org-beautify)

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

;; Closijng Parenthesis and other things
(electric-pair-mode 1)
(setq c-default-style "linux"
	  c-basic-offset 4)
;Show brackets
(show-paren-mode 1)1
(setq show-paren-style 'mixed)
(function-args-mode 1)
(fa-config-default)


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
(set-face-background 'hl-line "#191E29")
;; Custom Faces
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "PfEd" :slant normal :weight normal :height 90 :width normal))))
 '(mode-line ((t (:foreground "#AAAAAA" :background "#4F5B66" :box nil))))
 '(mode-line-inactive ((t (:foreground "#333333" :background "#4F5B66" :box nil))))
 '(org-level-1 ((t (:inherit default :foreground "deep sky blue" :box (:line-width 5 :color "#2b303b") :slant normal :weight normal :height 1.5 :width normal :foundry "PfEd" :family "Kreon"))))
 '(org-level-2 ((t (:inherit default :foreground "#FF8482" :slant normal :weight normal :height 1.1 :width normal :foundry "MS  " :family "Abeezee"))))
 '(org-level-3 ((t (:inherit default :foreground "#78D68B" :height 1.05 :family "Monaco"))))
 '(org-level-4 ((t (:inherit default :foreground "#9E78D6"))))
 '(org-level-5 ((t (:inherit default :foreground "#D678B0"))))
 '(org-level-6 ((t (:inherit default :foreground "#D0D678"))))
 '(org-level-7 ((t (:inherit default :foreground "#C17D11"))))
 '(org-level-8 ((t (:inherit default :foreground "#EF2929"))))
 '(popup-face ((t (:inherit default :background "#1E232E" :foreground "white smoke"))))
 '(popup-isearch-match ((t (:inherit default :background "#4F5B66"))))
 '(popup-menu-selection-face ((t (:inherit default :background "#3B3F4B" :foreground "white"))))
 '(popup-tip-face ((t (:background "gray22" :foreground "white")))))

;; Set Variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(org-level-color-stars-only nil)
 '(package-selected-packages
   (quote
	(org-bullets auto-org-md 2048-game rainbow-mode helm-company flyspell-popup ace-flyspell leuven-theme avk-emacs-themes flatui-theme latex-preview-pane smartparens evil-smartparens function-args vimish-fold use-package sublime-themes subatomic-theme spotify smooth-scrolling smex phi-search neotree multi mode-icons helm flycheck-irony flx-ido company-irony avy auto-indent-mode auto-complete-c-headers auto-complete-auctex ac-math ac-c-headers))))

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
(setq default-directory "/home/ea/Dropbox/Projects/work")

;; Change default compilaton command
(setq compile-command "make")

;; Search For Files
; Define a search index
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq gc-cons-threshold 2000000)

;; Smex Autocomplete for Commands
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Comment Commands
(global-set-key [(control c)(control c)] 'comment-region)
(global-set-key [(control c)(control v)] 'uncomment-region)

;; Phi Search and Replace 
(require 'phi-search)
(global-set-key (kbd "C-s") 'phi-search)
;;(global-set-key (kbd "C-r") 'phi-search-backward)
(require 'phi-replace)
(global-set-key (kbd "s-s") 'phi-replace-query)
(setq phi-search-limit           10000
      phi-search-case-sensitive  t)

(set-face-attribute 'phi-search-selection-face nil
                    :background "red")

;; Spotify Intergration
(require 'spotify)

;; Do not use values larger than 50 for better compatibility across endpoints
(setq spotify-api-search-limit 50)

(global-set-key (kbd "C-;") 'spotify-playpause)
(global-set-key (kbd "C-,") 'spotify-previous)
(global-set-key (kbd "C-.") 'spotify-next)

;; Smooth Scrolling

(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

;; Neotree (File branch system)
(require 'neotree)

(setq neo-smart-open t)
(setq-default neo-show-hidden-files t)

(global-set-key (kbd "s-b") 'neotree-toggle)

;; ;; Helm Setup

(require 'helm)
(require 'helm-config)


(helm-mode 1)

;; Semantic

(semantic-mode 1)

(defun my:add-semantic-to-autocomplete() 
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
; turn on ede mode 
(global-ede-mode 1)
; create a project for our program.
(ede-cpp-root-project "my project" :file "~/Dropbox/Projects/personal_projects/c++/.Root"
		      :include-path '("/usr/include")
		      :system-include-path '( "/usr/include" )
		      :system-include-path '( "/usr/include/SDL2" ))
		      
; you can use system-include-path for setting up the system header file locations.
; turn on automatic reparsing of open buffers in semantic
(global-semantic-idle-scheduler-mode 1)

;; Tabs vs spaces
(setq-default indent-tabs-mode t)
(setq-default tab-width 4) 
(defvaralias 'c-basic-offset 'tab-width)

(require 'smartparens-config)

(sp-local-pair 'c++-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))

(defun my-create-newline-and-enter-sexp (&rest _ignored)
  "Open a new brace or bracket expression, with relevant newlines and indent. "
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

;; arduino-mode
(require 'cl)
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)
(add-to-list 'auto-mode-alist '("\.ino$" . arduino-mode))

;; Latex

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(add-hook 'LaTeX-mode-hook 'latex-preview-pane-mode)
;;(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq-default TeX-PDF-mode t)


(company-auctex-init)

(setq doc-view-continuous t)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(require 'ace-flyspell)

(define-key flyspell-mode-map (kbd "C-r") #'flyspell-popup-correct)

(defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

(setq yas-prompt-functions '(yas-popup-isearch-prompt yas-ido-prompt yas-no-prompt))


(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


(require 'font-latex)

(defun font-latex-jit-lock-force-redisplay (buf start end)
  "Compatibility for Emacsen not offering `jit-lock-force-redisplay'."
    ;; The following block is an expansion of `jit-lock-force-redisplay'
    ;; and involved macros taken from CVS Emacs on 2007-04-28.
    (with-current-buffer buf
      (let ((modified (buffer-modified-p)))
    (unwind-protect
        (let ((buffer-undo-list t)
          (inhibit-read-only t)
          (inhibit-point-motion-hooks t)
          (inhibit-modification-hooks t)
          deactivate-mark
          buffer-file-name
          buffer-file-truename)
          (put-text-property start end 'fontified t))
      (unless modified
        (restore-buffer-modified-p nil))))))

(setq org-hide-emphasis-markers t)
