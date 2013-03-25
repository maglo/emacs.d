;; No splash screen please ... jeez
(setq inhibit-startup-message t)
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; enable recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "H-r") 'recentf-open-files)

(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

;; Hyper-F for toggling fullscreen
(global-set-key (kbd "H-f") 'ns-toggle-fullscreen)    

(setq ispell-program-name "/usr/local/bin/aspell")
(setq ispell-list-command "list")

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-virtual-buffers t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/"))

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; add powerline for 
(powerline-default)

;; hippie-exand
(global-set-key "\257" (quote hippie-expand)) ;; M-/

;; ace-jump
(global-set-key " " (quote ace-jump-mode)) ;; C-c <space>


;; fix C-= for expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'rst)
(define-key rst-mode-map (kbd "C-=") 'er/expand-region)

(require 'ahg)
(setq ahg-hg-command "/usr/local/bin/hg")

;; Quick and dirty path fix for OS X

(if (string-equal "darwin" (symbol-name system-type))
   (setenv "PATH" (concat "/usr/texbin:/usr/local/bin:/usr/local/sbin:" (getenv "PATH"))))

;; key bindings for multiple cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ediff config
(load-library "ediff")
(add-hook 'ediff-before-setup-hook 'new-frame)
(add-hook 'ediff-quit-hook 'delete-frame)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

(global-set-key (kbd "C-x v =") 'vc-ediff) ;; rebind C-x v =

(require 'rect-mark)
(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
(global-set-key (kbd "C-w")  
  '(lambda(b e) (interactive "r") 
     (if rm-mark-active 
       (rm-kill-region b e) (kill-region b e))))
(global-set-key (kbd "M-w")  
  '(lambda(b e) (interactive "r") 
     (if rm-mark-active 
       (rm-kill-ring-save b e) (kill-ring-save b e))))
(global-set-key (kbd "C-x C-x")  
  '(lambda(&optional p) (interactive "p") 
     (if rm-mark-active 
       (rm-exchange-point-and-mark p) (exchange-point-and-mark p))))


;; fixar med path
(add-to-list 'exec-path "/usr/local/bin")

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backup-files")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Gör så att C-d dödar shell och en till dödar buffer
(defun comint-delchar-or-eof-or-kill-buffer (arg)
  (interactive "p")
  (if (null (get-buffer-process (current-buffer)))
      (kill-buffer)
    (comint-delchar-or-maybe-eof arg)))

(add-hook 'shell-mode-hook
          (lambda ()
            (define-key shell-mode-map
              (kbd "C-d") 'comint-delchar-or-eof-or-kill-buffer)))

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; aktivera line numbers
;;(global-linum-mode t)

;; highligt current line globally
(global-hl-line-mode t)

(global-set-key (kbd "C-x g") 'webjump)

;; Add Urban Dictionary to webjump
(eval-after-load "webjump"
'(add-to-list 'webjump-sites
              '("Urban Dictionary" .
                [simple-query
                 "www.urbandictionary.com"
                 "http://www.urbandictionary.com/define.php?term="
                 ""])))

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Döp om fil och buffer
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

(defun dired-do-ispell (&optional arg)
  (interactive "P")
  (dolist (file (dired-get-marked-files
                 nil arg
                 #'(lambda (f)
                     (not (file-directory-p f)))))
    (save-window-excursion
      (with-current-buffer (find-file file)
        (ispell-buffer)))
    (message nil)))

(load-file "/Users/malo/Downloads/gabrielelanaro-emacs-for-python-ac1b31e/epy-init.el")

;; org-mode fixes
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)

(setq org-default-notes-file "~/Dropbox/notes.org")
(setq org-refile-targets '((nil :maxlevel . 9)
			   (org-agenda-files :maxlevel . 3)
			   ))

(setq org-log-done 'time)

(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAIT(w)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("STARTED" . "yellow") ("WAIT" . "orange") ("DONE" . org-done) ("CANCELLED" . "blue")))

;; ace-jump i org-mode
(eval-after-load "org"
        '(define-key org-mode-map "\C-c " 'nil)) ; unmap key, was org-table-blank-field

;; skeleton does not work well in table-mode, deactivate
;; hippie expand fucks up too


;; also, don't be messin' with my captialize-word shortcut

(global-set-key (kbd "M-c") 'capitalize-word)

;; rgrep och snabbtangent för next- och previous-error
(global-set-key (kbd "<f9>") 'next-error)
(global-set-key (kbd "S-<f9>") 'previous-error)
(global-set-key (kbd "C-<f9>") 'rgrep)

;; fixa magit
;; full screen magit-status

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(require 'magit)
(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
(global-set-key (kbd "H-g") 'magit-status)

;; Loccur - dölj alla rader som inte matchar...

(require 'loccur)
(global-set-key (kbd "M-s l") 'loccur)

;; yasnippets

(require 'yasnippet)
(setq yas/root-directory (concat user-emacs-directory "mysnippets"))
(yas/load-directory yas/root-directory)

;; fixa en custom-fil, måste ligga nederst
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

