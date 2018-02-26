;; Stuff from customize

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(ansi-term-color-vector
   [unspecified "#0f0f0f" "#ff4450" "#c0ffdd" "#ffedc0" "#71ddff" "#dda0ff" "#71ddff" "#e0e0e0"] t)
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("2e0796c03304764d7deaf83e27d2f1f6529c1ae77514e333d22e3d36cc1c31c2" "5b1ec458ec8319547e0e1ba4e89af23493413a2480f2121ab1773a71d437680d" default)))
 '(fci-rule-character-color "#1c1c1c")
 '(fci-rule-color "#1c1c1c")
 '(menu-bar-mode t)
 '(package-selected-packages (quote (buffer-move magit evil-visual-mark-mode sml-mode)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Built in package manager hot dog
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(defun ensure-and-require (package-name)
  (unless (package-installed-p package-name)
    (package-install package-name))
  (require package-name))

(setq package-enable-at-startup nil)
(package-initialize)

;; Evil mode because I'm not an animal
(ensure-and-require 'evil)
(evil-mode t)

;; Magit helpers
(ensure-and-require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; Buffer-move
(ensure-and-require 'buffer-move)
(global-set-key (kbd "<M-up>") 'buf-move-up)
(global-set-key (kbd "<M-down>") 'buf-move-down)
(global-set-key (kbd "<M-right>") 'buf-move-right)
(global-set-key (kbd "<M-left>") 'buf-move-left)

;; Windmove helpers
(require 'windmove)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Load the theme of the day
(add-to-list 'load-path "~/.emacs.d/themes/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(require 'pastel-tron-theme)
(load-theme `pastel-tron t)

;; Line numbes
(global-linum-mode t)

;; No need for tabs
(setq-default indent-tabs-mode nil)

;; Show cursor position
(setq line-number-mode t)
(setq column-number-mode t)

;; Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Show matching parentheses
(show-paren-mode t)

;; Undo/Redo window changes
(winner-mode 1)

;; Change yes-or-no prompts to y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;; Remove confirmation from revert-buffer, and bind to key
;; Found in https://www.emacswiki.org/emacs/misc-cmds.el
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

(global-set-key (kbd "C-x o") 'revert-buffer-no-confirm)
