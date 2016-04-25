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
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" "133222702a3c75d16ea9c50743f66b987a7209fb8b964f2c0938a816a83379a0" "0788bfa0a0d0471984de6d367bb2358c49b25e393344d2a531e779b6cec260c5" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "d12c2cae6c13a834084e06a3062d5a27cac7627e0872bd1728d203b46ae6a5bb" "8553bdd21237bcc7d9cfabd93c1525af9ac4a84d5ab1435e6474f9fd4f81d69c" default)))
 '(inhibit-startup-screen t)
 '(linum-format " %7i ")
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Meslo LG M DZ" :foundry "PfEd" :slant normal :weight normal :height 119 :width normal)))))

; Folding in Python

(add-hook 'python-mode-hook 'origami-mode)
(global-set-key "\C-p" 'origami-toggle-all-nodes)
(global-set-key "\C-\M-p" 'origami-recursively-toggle-node)

; Auto-Complete Python

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;Shift to change tabs

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

; NeoTree browser
(add-to-list 'load-path "/home/ea/.emacs.d/elpa/neotree-20160306.730")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

; Load themes

(package-initialize)
(load-theme 'brin t)

; Gets rid of menu tool and scroll bar w/toggles

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-set-key [f7] 'toggle-scroll-bar)
(global-set-key [f9] 'toggle-menu-bar-mode-from-frame)

;;(global-set-key [f6] 'toggle-setq-default-mode-line-format-nil)

; Sets up the dictionary # Does not work

(require 'auto-dictionary)
(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))

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

; Title of emacs

(setq
 frame-title-format (list " %b "));list (getenv "USER") " - %b"))

; Closing Parenthesis and other things

(electric-pair-mode 1)

; Multiple Cursors

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

; No theme in terminal

(add-to-list 'default-frame-alist '(tty-color-mode . -1))

; Auto Complete
(ac-config-default)

; Project Manager

(projectile-global-mode)

; File Searching

(setq projectile-completion-system 'flx-ido)

;; define a search index

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes") 
(setq sml/theme 'powerline)		 ;        Smart Mode Line
(sml/setup)

;; End
