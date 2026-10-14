(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ; 设定源码加载路径

(require 'settings)

(require 'package)
(setq package-archives '(("gnu"  . "http://mirrors.cloud.tencent.com/elpa/gnu/")
			 ("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/")))
(package-initialize)
(let ((package-check-signature nil))
  (package-refresh-contents)
  (package-install 'gnu-elpa-keyring-update))
(setq package-check-signature 'allow-unsigned)

(package-install 'use-package)

(eval-when-compile
  (require 'use-package))
(use-package gruber-darker-theme
  :ensure t
  :config (load-theme 'gruber-darker t))
(use-package smex
  :ensure t)
(use-package ido-completing-read+
  :ensure t)
(require 'ido-completing-read+)
;;; multiple cursors
(use-package multiple-cursors
  :ensure t)

(use-package magit
  :ensure t)
(setq magit-auto-revert-mode nil)

(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)


(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(use-package citre
  :ensure t
  :config
  (require 'citre-config)
  :bind
  (("M-." . 'citre-jump)
   ("M-," . 'citre-jump-back)))


(defun my-citre-git-root ()
  (let ((root (shell-command-to-string "git rev-parse --show-toplevel 2>/dev/null")))
    (setq root (string-trim root))
    (if (string-empty-p root)
        nil
      (file-name-as-directory root))))

(setq citre-project-root-function #'my-citre-git-root)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
