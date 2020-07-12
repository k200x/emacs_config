;(add-to-list 'load-path "~/.emacs.d/")
;;(require 'color-theme)
;;(color-theme-initialize)  

;;(color-theme-euphoria)
;;(color-theme-calm-forest)

;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(tool-bar-mode nil))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :stipple nil :background "black" :foreground "#00ff00" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;; emacs配置文件夹路径
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "/usr/local/share/emacs/26.3/site-lisp")
;; load init file
(require 'init)

;; (require 'find-file-in-project)
;; (load-file "find-file-in-project.el")
;; (global-set-key [(C-N)] 'find-file-in-project)

;; ------- display -------
(setq inhibit-startup-message t)

(setq initial-scratch-message nil)

(setq initial-frame-alist '((top . 20) (left . 650) (width . 88) (height . 80) (menu-bar-lines . nil) (vertical-scrool-bars . nil) (tool-bar-lines . nil)))

;;(set-scroll-bar-mode nil)

;; ------- show parenthesis -------
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; ------- short key -------
;; (global-set-key [C-f1] 'shell)
(global-set-key [C-f6] 'toggle-debug-on-error)
(global-set-key [C-f7] 'global-linum-mode)
;;(global-set-key "\C-c \t" 'other-window)
(global-set-key [C-f12] 'select-frame-by-name)
(global-set-key [C-f1] 'find-tag)
(global-set-key [C-f2] 'pop-tag-mark)

(setq tags-file-name "~/doing/emacs/src/emacs-22.1/lisp/TAGS")

;; ------- add to load-path -------

;; ------- k2_Wiki -------

;; ------- c-mode -------
(add-hook 'c-mode-hook
	  '(lambda ()
	     (c-set-style "K&R")
	     (setq tab-width 8)
	     (setq indent-tabs-mode t)
	     (setq c-basic-offset 8)))

;; ------- c++-mode -------
(add-hook 'c++-mode-hook
	  '(lambda ()
	     (c-set-style "K&R")
	     (setq tab-width 8)
	     (setq indent-tabs-mode t)
	     (setq c-basic-offset 8)))
(put 'upcase-region 'disabled nil)

;;(color-theme-matrix)

(setq inferior-lisp-program "~/doing/elisp")

;; e-mail
(setq user-mail-address "dzsdzsdzs00x@163.com")

;; slime
;(setq inferior-lisp-program "/usr/local/bin/sbcl")
;(setq slime-lisp-implementations
;      '((sbcl ("/usr/local/bin/sbcl"))
;	(clojure ("java" "-cp" "/home/k2/hacking/lisp/clojure/clojure-1.5.1/clojure-1.5.1.jar" "clojure.main"))))
;(add-to-list 'load-path "~/hacking/lisp/slime/") ; my SLIME directory
;(require 'slime)
;(slime-setup)

;(require 'package)
;(add-to-list 'package-archives
;             '("marmalade" . "http://marmalade-repo.org/packages/"))
;(package-initialize)

(setq make-backup-files nil)

;; shut down the backup
(setq backup-by-copying nil)

(global-linum-mode)

(setq auto-save-default nil)

;(require 'ppm-gen)
;(defadvice image-type (around image-type-bmp first (source &optional type data-p) activate)
;  (setq ad-return-value
;        (cond (data-p (if (string-match "^BM" source) 'bmp ad-do-it))
;              (t (if (string-match ".*//.bmp" source) 'bmp ad-do-it)))))
;(defadvice create-image (around create-image-bmp (file-or-data &optional type data-p &rest props) activate)
;  (setq ad-return-value
;        (cond ((eq 'bmp type) (let (ppm-obj ppm-data)
;                                (setq ppm-obj (ppm-from-bmp file-or-data))

(setq sql-mysql-login-params
      '((user :default "k200x")
	(password :default "")
	(database :default "mingda")
	(server :default "127.0.0.1")))

;;------- auto-complete
(load-file "auto-complete.el")
(load-file "auto-complete-pkg.el")
(load-file "auto-complete-config.el")

;; (add-to-list 'load-path "~/emacs/config/auto-complete/byte_compile_auto_complete")

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/emacs/config/auto-complete/auto-complete-master/dict")
;; (ac-config-default)

(require 'package)

;; If you want to use latest version
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; If you want to use last tagged version
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; for mysql
(defun mysql_k200x ()
  (interactive)
  (sql-mysql))

;; sdcv for emacs
(defun sdcv ()
  (interactive)
  (let ((begin (point-min))
	(end (point-max)))
    (if mark-active
	(setq begin (region-beginning)
	      end (region-end))
      (save-excursion
	(backward-word)
	(mark-word)
	(setq begin (region-beginning)
	      end (region-end))))
    ;; 有时候 stardict 会很慢，所以在回显区显示一点东西
    ;; 以免觉得 Emacs 在干什么其他奇怪的事情。
    (message "searching for %s ..." (buffer-substring begin end))
    (message
     (shell-command-to-string
      (concat "sdcv -n "
	      (buffer-substring begin end))))))

;; (add-hook 'c-mode-hook 'hs-minor-mode)
;; (add-hook 'c++mode-hook 'hs-minor-mode)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
         t))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(require 'smex)
(smex-initialize)
;; bind some key
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)





