(require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t)
(package-initialize)

;; recent files
(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

;; Line numbers
(global-linum-mode 1)

;; tab width / indentation
(setq tab-width 2)

;; Disable welcome screen
(setq inhibit-startup-screen t)

;; No scratch message
(setq initial-scratch-message "")

;; Init projectile Rails
(projectile-rails-global-mode)

;; tool-bar-mode
(tool-bar-mode -1)

;; scroll bar
(toggle-scroll-bar -1)

;; menu bar
(menu-bar-mode -1)

;; window size for gui
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 150) ; chars
              (height . 50) ; lines
              ;;(background-color . "honeydew")
              ;;
              ))

      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 150)
              (height . 50)
             ;; (background-color . "honeydew")
              ;;
              )))
  (progn
    (setq initial-frame-alist
          '(
            (tool-bar-lines . 0)))
    (setq default-frame-alist
          '(
            (tool-bar-lines . 0)))))

;; ruby indentation fix
(setq ruby-intent-level 2)
(setq indent-tabs-mode nil)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; set font
(set-face-attribute 'default nil :family "Bitstream Vera Sans Mono" :height 90)

;; auto complete mode
;;ac-config-default)
;;(global-auto-complete-mode t)

;; backup file relocation
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; multiple cursors
(global-set-key (kbd "C-c m c") 'mc/edit-lines)

;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)

;; MACROS
;; Ruby def
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes
   (quote
    ("2a739405edf418b8581dcd176aaf695d319f99e3488224a3c495cb0f9fd814e3" "bc40f613df8e0d8f31c5eb3380b61f587e1b5bc439212e03d4ea44b26b4f408a" "b550fc3d6f0407185ace746913449f6ed5ddc4a9f0cf3be218af4fb3127c7877" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(delete-selection-mode t)
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#eee8d5")
 '(fringe-mode 4 nil (fringe))
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(nyan-mode t)
 '(package-selected-packages (quote (projectile-rails web-mode-edit-element dumb-jump)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Jump to function definition
(dumb-jump-mode)

;; fix line number margin when font is scaled
(require 'linum)
(defun linum-update-window-scale-fix (win)
  "fix linum for scaled text"
  (set-window-margins win
		      (ceiling (* (if (boundp 'text-scale-mode-step)
				      (expt text-scale-mode-step
					    text-scale-mode-amount) 1)
				  (if (car (window-margins))
				      (car (window-margins)) 1)
				  ))))
(advice-add #'linum-update-window :after #'linum-update-window-scale-fix)

;; disable automatic encoding of files
(setq ruby-insert-encoding-magic-comment nil)

;; syntax check when saving a ruby file
;;(defun chksyn ()
;;  (interactive)
;;  (when (eq major-mode 'ruby-mode)
;;    (shell-command (format "jruby -c %s" buffer-file-name)))) ;; jruby needs to be in path
;;(add-hook 'after-save-hook #'chksyn)
