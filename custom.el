(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahg-hg-command "/usr/local/bin/hg")
 '(custom-safe-themes (quote ("d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" "71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" default)))
 '(org-agenda-files (quote ("~/Dropbox/dagbok-2013.org.gpg" "~/Dropbox/notes.org" "~/Dropbox/dagbok-2012.org.gpg")))
 '(send-mail-function (quote mailclient-send-it)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-variable-name-face ((t (:foreground "dark red"))))
 '(rst-level-1-face ((t (:background "gray34"))) t)
 '(rst-level-2-face ((t (:background "gray34"))) t)
 '(rst-level-3-face ((t (:background "grey38"))) t)
 '(rst-level-4-face ((t (:background "gray0"))) t)
 '(rst-reference ((t (:inherit font-lock-variable-name-face :foreground "dark cyan")))))

(load-theme (quote solarized-dark) nil nil)

(load-file "~/.emacs.d/elpa/color-theme-blackboard-0.0.2/color-theme-blackboard.el")

(color-theme-blackboard)
