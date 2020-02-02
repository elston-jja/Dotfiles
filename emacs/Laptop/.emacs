;;; Emacs Init File
;;;

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

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(setf cursor-type 'bar )

(menu-bar-mode -1)

;; Custom Themes Safe; Load brin
(setq custom-safe-themes t)
(load "~/.emacs.d/themes/vscode-dark-plus-theme.el")
(load-theme 'vscode-dark-plus t)

(require 'undo-tree)
(global-undo-tree-mode)



(tool-bar-mode -1)
(scroll-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (vscode-dark-plus)))
 '(fci-rule-color "#eee8d5")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (C . t))))
 '(package-selected-packages
   (quote
    (typescript-mode centaur-tabs use-package nlinum-relative undo-tree helm htmlize org-bullets neotree smex php-mode irony-eldoc flycheck-irony flycheck platformio-mode projectile flatland-theme spacemacs-theme company-irony irony smooth-scrolling solarized-theme)))
 '(pdf-view-midnight-colors (quote ("#655370" . "#fbf8ef")))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c8805d801780")
     (60 . "#bec073400bc0")
     (80 . "#b58900")
     (100 . "#a5008e550000")
     (120 . "#9d0091000000")
     (140 . "#950093aa0000")
     (160 . "#8d0096550000")
     (180 . "#859900")
     (200 . "#66aa9baa32aa")
     (220 . "#57809d004c00")
     (240 . "#48559e556555")
     (260 . "#392a9faa7eaa")
     (280 . "#2aa198")
     (300 . "#28669833af33")
     (320 . "#279993ccbacc")
     (340 . "#26cc8f66c666")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:background "#1E1E1E" :foreground "#579C4C" :slant normal))))
 '(helm-selection ((t (:background "#5A5A5A" :underline nil))))
 '(helm-selection-line ((t (:background "#8B8B8B" :foreground "#FFFFFF"))))
 '(org-level-3 ((t (:foreground "LightSkyBlue1"))))
 '(rst-level-1 ((t (:foreground "gray98"))))
 '(rst-level-2 ((t (:foreground "deep sky blue"))))
 '(rst-level-3 ((t (:foreground "spring green")))))

;; Closijng Parenthesis and other things
(electric-pair-mode 1)

;;(setq-default indent-tabs-mode nil)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;(setq indent-line-function 'insert-tab)
(setq c-default-style "bsd") 
(setq c-basic-offset 4) 
(c-set-offset 'comment-intro 0)
    
;; (setq c-default-style "linux"
;; 	  c-basic-offset 4)


(add-hook 'java-mode-hook (lambda ()
   (setq c-default-style "bsd" c-basic-offset 4))) 
    
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)



(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))


(add-hook 'after-init-hook 'global-company-mode)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


(require 'platformio-mode)

;; Use irony's completion functions.
(add-hook 'irony-mode-hook
          (lambda ()
            (define-key irony-mode-map [remap completion-at-point]
              'irony-completion-at-point-async)

            (define-key irony-mode-map [remap complete-symbol]
              'irony-completion-at-point-async)

            (irony-cdb-autosetup-compile-options)))
            
;; Setup irony for flycheck.
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; Enable irony for all c++ files, and platformio-mode only
;; when needed (platformio.ini present in project root).
(add-hook 'c++-mode-hook (lambda ()
                           (irony-mode)
                           (irony-eldoc)
                           (platformio-conditionally-enable)))

(add-to-list 'projectile-project-root-files "platformio.ini")

(global-flycheck-mode)

(global-unset-key (kbd "C-z"))
(global-unset-key [(control x)(control z)])

;; Comment Commands
(global-set-key [(control c)(control c)] 'comment-region)
(global-set-key [(control c)(control v)] 'uncomment-region)


;; Smex Autocomplete for Commands
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Neotree (File branch system)
(require 'neotree)

(setq neo-smart-open t)
(setq-default neo-show-hidden-files t)

(global-set-key (kbd "C-;") 'neotree-toggle)

(put 'upcase-region 'disabled nil)

    
;; Shift to change tabs
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(require 'centaur-tabs)
(centaur-tabs-mode t)
(centaur-tabs-headline-match)
(global-set-key [C-iso-lefttab]  'centaur-tabs-backward)
(global-set-key [C-tab] 'centaur-tabs-forward)
(setq centaur-tabs-style "bar")
(setq centaur-tabs-set-bar 'over)
(setq centaur-tabs-cycle-scope 'tabs)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'helm)    
(require 'helm-config)

(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

(global-set-key (kbd "C-x C-f") 'helm-find-files)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
;;(helm-autoresize-mode 1)

    (global-set-key (kbd "C-x b") 'helm-mini)

    (setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)


;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal


(defun my-write-copy-to-file ()
  "Write a copy of the current buffer or region to a file."
  (interactive)
  (let* ((curr (buffer-file-name))
         (new (read-file-name
               "Copy to file: " nil nil nil
               (and curr (file-name-nondirectory curr))))
         (mustbenew (if (and curr (file-equal-p new curr)) 'excl t)))
    (if (use-region-p)
        (write-region (region-beginning) (region-end) new nil nil nil mustbenew)
      (save-restriction
        (widen)
        (write-region (point-min) (point-max) new nil nil nil mustbenew)))))

(global-set-key (kbd "C-c w") 'my-write-copy-to-file)



(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z


(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(setq org-src-tab-acts-natively t)


(setq backup-directory-alist `((".*" . , "./saves")))


(setq auto-save-file-name-transforms `((".*", "./saves")))



