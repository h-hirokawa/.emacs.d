;;; init.el --- My init.el.

;;; Commentary:

;;; Code:
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(load "term/bobcat")
(defun my-keyboard-translations (&optional frame)
  "Not to forget bobcat whenever the new frame is created.
FRAME is an Emacs frame"
  (when (fboundp 'terminal-init-bobcat)
    (terminal-init-bobcat)))
(my-keyboard-translations)
(add-hook 'after-make-frame-functions 'my-keyboard-translations)

(add-hook 'find-file-hook 'flycheck-mode)

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(defun coffee-custom ()
  "Coffee-mode-hook."
  (setq tab-width 2)
)
(add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.ctp$" . php-mode))

(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(defvar jedi:setup-keys t)
(defvar jedi:complete-on-dot t)

(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq-default indent-tabs-mode nil)

(provide 'init)
;;; init.el ends here
