(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(require 'find-file-in-project)
(load-file "~/.emacs.d/find-file-in-project.el")
(global-set-key [(Ctrl-N)] 'find-file-in-project)
