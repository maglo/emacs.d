(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahg-hg-command "/usr/local/bin/hg")
 '(custom-safe-themes
   (quote
    ("d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" "71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" default)))
 '(erc-hide-list (quote ("JOIN" "NICK" "PART" "QUIT")))
 '(jabber-account-list
   (quote
    (("magnus.loof@gmail.com"
      (:network-server . "talk.google.com")
      (:port . 5223)
      (:connection-type . ssl))
     ("maglo@chat.facebook.com"
      (:disabled . t)
      (:network-server . "chat.facebook.com")
      (:port . 5222)
      (:connection-type . network))
     ("magnus.loof@basalt.se"
      (:network-server . "talk.google.com")
      (:port . 5223)
      (:connection-type . ssl)))))
 '(jabber-default-show "")
 '(jabber-default-status "slaving away in Emacs")
 '(jabber-history-enabled t)
 '(jabber-show-resources nil)
 '(org-agenda-files
   (quote
    ("~/Dropbox/dagbok-2014.org.gpg" "~/Dropbox/dagbok-2013.org.gpg" "~/Dropbox/notes.org" "~/Dropbox/dagbok-2012.org.gpg")))
 '(org-drill-optimal-factor-matrix
   (quote
    ((1
      (2.36 . 3.86)
      (2.5 . 4.0)
      (1.96 . 3.58)
      (2.1799999999999997 . 3.72)
      (2.6 . 4.14)))))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m org-drill)))
 '(org-return-follows-link t)
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

(autoload 'es-mode "es-mode.el"
  "Major mode for editing Elasticsearch queries" t)
(add-to-list 'auto-mode-alist '("\\.es$" . es-mode))
