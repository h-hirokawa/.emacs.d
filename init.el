;;; init.el --- My init.el.

;;; Commentary:

;;; Code:
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(helm-mode 1)

(add-hook 'find-file-hook 'flycheck-mode)

(add-hook 'js2-mode-hook
          #'(lambda ()
              (setq js2-basic-offset 2
                    indent-tabs-mode nil)
              ))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'sgml-mode-hook 'emmet-mode)

(custom-set-variables '(coffee-tab-width 2))

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.ctp$" . php-mode))

(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq-default indent-tabs-mode nil)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(define-key key-translation-map (kbd "\C-h") (kbd "\C-?"))
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-x C-g") 'magit-status)

;; yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/mySnippets"
        "~/.emacs.d/snippets"
        ))
(yas-global-mode 1)


(setq-default flycheck-flake8-maximum-line-length 120)

(provide 'init)
;;; init.el ends here
