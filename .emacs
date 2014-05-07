(setq c-default-style "linux")

;(defun linux-c-mode ()
;  "C mode with adjusted defaults for use with the Linux kernel."
;  (interactive)
;  (c-mode)
;  (c-set-style "K&R")
;  (setq c-basic-offset 8))

(set-face-attribute 'default nil :height 100)

;(defconst ecb-cedet-required-version-max '(1 2 4 9)
(setq stack-trace-on-error t)

(add-to-list 'load-path "/home/dany/.emacs.d/ecb/")
(require 'semantic/analyze)
(provide 'semantic-analyze)
(provide 'semantic-ctxt)
(provide 'semanticdb)
(provide 'semanticdb-find)
(provide 'semanticdb-mode)
(provide 'semantic-load)

(require 'ecb) 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ede-project-directories (quote ("/home/dany/tests/ecb"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
