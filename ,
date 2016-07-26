;; Emacs Start up script
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3C3836" "#FB4934" "#B8BB26" "#FABD2F" "#83A598" "#D3869B" "#8EC07C" "#EBDBB2"])
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "36d92f830c21797ce34896a4cf074ce25dbe0dabe77603876d1b42316530c99d" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "70340909b0f7e75b91e66a02aa3ad61f3106071a1a4e717d5cdabd8087b47ec4" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "d12c2cae6c13a834084e06a3062d5a27cac7627e0872bd1728d203b46ae6a5bb" "b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "26ce7eea701bfd143ac536e6805224cff5598b75effb60f047878fe9c4833ae4" "" default)))
 '(display-time-mode t)
 '(fci-rule-color "#073642")
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil))
  '(highlight-changes-colors (quote ("#d33682" "#6c71c4"))
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
 '(inhibit-startup-screen t)
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tool-bar-mode nil)
 '(transient-mark-mode (quote (only . t)))
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))

; Load themes and things
(package-initialize)
(load-theme 'brin)

; Smart Mode Line
;(setq sml/theme 'respectful)		 
;(sml/setup)

; Folding in Python
(add-hook 'python-mode-hook 'origami-mode)
(global-set-key "\C-p" 'origami-toggle-all-nodes)
(global-set-key "\C-\M-p" 'origami-recursively-toggle-node)

 ;Auto-Complete Python
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

; Shift to change tabs
(when (fboundp 'windmove-default-keybindings)
 (windmove-default-keybindings))

; NeoTree browser
(add-to-list 'load-path "/home/ea/.emacs.d/elpa/neotree-20160306.730")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

; Gets rid of menu tool and scroll bar w/toggles
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-set-key [f7] 'toggle-scroll-bar)
(global-set-key [f9] 'toggle-menu-bar-mode-from-frame)

; For Reids class
(defun today ()
 "Insert string for today's date nicely formatted in American style,
e.g. Sunday, September 17, 2000."
 (interactive)                 ; permit invocation in minibuffer
 (insert (format-time-string "%Y/%M/%d")))
(define-skeleton school
 "This will print the intro to projects"
 "Time and date sequence" \n
 "'''" \n
 "Elston Almeida" \n
 "enter info about program here" \n
 '(today) \n
 "ICS 3U1" \n
 "'''" \n
 )
(global-set-key [f5] 'school)

; Saves autosaves to Dir --cleaner method-- 
(setq backup-directory-alist
     `((".*" . ,"/home/ea/Dropbox/Backups")))
(setq auto-save-file-name-transforms
     `((".*" ,"/home/ea/Dropbox/Backups")))

; Closing Parenthesis and other things
(electric-pair-mode 1)

; Multiple Cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

; Auto Complete
(ac-config-default)

; Define a search index
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)


(global-linum-mode t)
(add-hook 'linum-before-numbering-hook
  	  (lambda () (setq linum-format "%d ")))
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))


(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
(require 'cl)
(setq powerline-arrow-shape 'arrow14)   ;; give your mode-line curves

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "PfEd" :slant normal :weight normal :height 103 :width normal))))
 '(mode-line ((t (:foreground "#AAAAAA" :background "#4F5B66" :box nil))))
 '(mode-line-inactive ((t (:foreground "#333333" :background "#4F5B66" :box nil)))))

(define-key ac-completing-map (kbd "C-c j") 'ac-next)
(define-key ac-completing-map (kbd "C-c k") 'ac-previous)  

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)


(set-face-background 'ac-candidate-face "azure4")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "grey59")

;; Disable sleep
(global-unset-key (kbd "C-z"))
(global-unset-key [(control x)(control z)])
;; Windows Style Undo
(global-set-key [(control z)] 'undo)
