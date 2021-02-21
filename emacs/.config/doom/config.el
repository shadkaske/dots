;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Basic Emacs Setup
(setq user-full-name "Shad Kaske"
    user-mail-address "skaske@showplacewood.com")

;; Don't Ask to Close
(setq confirm-kill-emacs nil)

;; Disable Clipboard Selection and Manager
;; (setq select-enable-clipboard nil
   (setq x-select-enable-clipboard-manager nil)

;; Theme Settings
(setq doom-theme 'doom-material)
(after! doom-themes
(setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

;; Font Settings
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16)
    doom-variable-pitch-font (font-spec :family "Ubuntu" :size 16)
    doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 24))
(custom-set-faces!
'(font-lock-comment-face :slant italic)
'(font-lock-keyword-face :slant italic))

;; Relatvie Line Numbers
(setq display-line-numbers-type 'visual)

;; Line Height / Spacing
;; (setq default-text-properties '(line-spacing 0.1  line-height 1.1))

;; All The Icons Scale
(after! all-the-icons
    (setq all-the-icons-scale-factor 1.0))

;; Show Trailing Whitespace
(setq show-trailing-whitespace t)

;; Custom Keybindings
;;;; Evil Mode Line Inserts
(map!
 (:after evil
    :m "] SPC" #'evil-motion-insert-newline-below
    :m "[ SPC" #'evil-motion-insert-newline-after))

;;;; Evil Mode Simplified Navigation
;; (map!
;;  (:after evil
;;    :en "C-h"   #'evil-window-left
;;    :en "C-j"   #'evil-window-down
;;    :en "C-k"   #'evil-window-up
;;    :en "C-l"   #'evil-window-right))

;; mu4e
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(after! mu4e
  (require 'mu4e-org)
  (remove-hook! 'mu4e-compose-pre-hook #'org-msg-mode)
  (setq! mu4e-attachment-dir "~/Downloads")
  (setq! mu4e-maildir (expand-file-name "~/Mail")
         mu4e-get-mail-command "mbsync -a"
         mu4e-index-update-in-background t
         mu4e-compose-signature-auto-include nil
         mu4e-view-show-addresses t
         mu4e-view-show-images t
         mu4e-use-fancy-chars t
         mu4e-compose-format-flowed t
         mu4e-change-filenames-when-moving t
         mu4e-sent-messages-behavior 'sent)

  (setq! mu4e-contexts
         (list
          ;; Work Account
          (make-mu4e-context
           :name "Showplace"
           :match-func
           (lambda (msg)
             (when msg (string-prefix-p "/showplacewood" (mu4e-message-field msg :maildir) t)))
           :vars '((user-mail-address . "skaske@showplacewood.com")
                   (user-full-name . "Shad Kaske")
                   (mu4e-drafts-folder . "/showplacewood/Drafts")
                   (mu4e-sent-folder . "/showplacewood/Sent Items")
                   (mu4e-refile-folder . "/showplacewood/Archive")
                   (mu4e-trash-folder . "/showplacewood/Deleted Items")))
          (make-mu4e-context
           :name "Gmail"
           :match-func
           (lambda (msg)
             (when msg (string-prefix-p "/gmail" (mu4e-message-field msg :maildir) t)))
           :vars '((user-mail-address . "shadkaske@gmail.com")
                   (user-full-name . "Shad Kaske")
                   (mu4e-drafts-folder . "/gmail/Drafts")
                   (mu4e-sent-folder . "/gmail/Sent Mail")
                   (mu4e-refile-folder . "/gmail/All Mail")
                   (mu4e-trash-folder . "/gmail/Trash"))))))

(mu4e-alert-set-default-style 'libnotify)
(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
(setq mu4e-compose-format-flowed t)

;; Org Mode
;;;; Doom Emacs Org Settings
(setq org-directory "~/Nextcloud/org/")
(setq org-noter-notes-search-path '("~/Nextcloud/org/reference/"))

;;;; Disable LineNumber in Org Mode
(add-hook! 'org-mode-hook #'doom-disable-line-numbers-h)

;;;; Hide Emphasis Markers
(after! org
  (setq org-hide-emphasis-markers t)
  ;;;; Turn On Logging
  (setq org-log-done t)
  (setq org-log-into-drawer t)
  ;;  Org ToDo Keywords
  (setq org-todo-keywords '((sequence
                             "TODO(t)" "NEXT(n)" "WAITING(w)" "|" "DONE(d!)" "CANC(k!)")
                            (sequence
                             "ACTIVE(a)" "PLAN(p)" "HOLD(h)" "|" "COMPLETE(c!)" )))
  ;;  Org Todo Keywords Colors
  (setq org-todo-keyword-faces '(("TODO" . "DarkCyan")
                                 ("NEXT" . "DarkOrange")
                                 ("WAITING" . "DimGray")
                                 ("ACTIVE" . "LightCoral")
                                 ("PLAN" . "BlanchedAlmond")
                                 ("HOLD" . "DimGray")))
  ;;;; Org Agenda Files
  (setq org-agenda-files '("~/Nextcloud/org/inbox.org"
                          "~/Nextcloud/org/projects.org"
                          "~/Nextcloud/org/tickler.org"
                          "~/Nextcloud/org/cal/googlecal.org"
                          "~/Nextcloud/org/cal/showplacecal.org"))

  ;;;; Org Capture Templates
  (setq org-capture-templates
        '(("t" "ToDo [Inbox]"
           entry (file "~/Nextcloud/org/inbox.org")
                  "* TODO %?\n")
          ("T" "Tickler"
           entry (file "~/Nextcloud/org/tickler.org")
                  "* TODO %i%? \nSCHEDULED: <%(org-read-date nil nil \"+1d\")>")
          ("P" "New Project"
           entry (file "~/Nextcloud/org/projects.org")
                  "* %i%? ")
          ("e" "Email [Inbox]"
           entry (file "~/Nextcloud/org/inbox.org")
           "* TODO %?\n%U\n%a\n")
          ("f" "Link File [Inbox]"
           entry (file "~/Nextcloud/org/inbox.org")
           "* TODO %?\n %A\n")))

  ;;;; Org Agenda Views
  (setq org-agenda-custom-commands
        '(("d" "Dashboard"
           ((agenda "" ((org-deadline-warning-days 7)))
            (todo "NEXT"
                  ((org-agenda-overriding-header "Next Task")))
            (todo "ACTIVE" ((org-agenda-overriding-header "Active Projects")))))
          ))

  ;;;; Org Tag Settings
  (setq org-tags-column -80)

  (setq org-tag-alist '((:startgroup . nil)
                        ("@work" . ?w)
                        ("@home" . ?h)
                        ("@errands" . ?e)
                        ("@email" . ?@)
                        ("@dev" . ?d)
                        (:endgroup . nil)
                        ("chad" . ?c)
                        ("andy" . ?a)
                        ("travis" . ?t)))

  ;;;; Org Refiler Targets
  (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
  (advice-add 'org-refile :after 'org-save-all-org-buffers)
  (setq org-ellipsis "  ▼")
  (setq org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))
  ;; (dolist (face '((org-level-1 . 1.2)
  ;;                 (org-level-2 . 1.1)
  ;;                 (org-level-3 . 1.05)
  ;;                 (org-level-4 . 1.0)
  ;;                 (org-level-5 . 0.9)
  ;;                 (org-level-6 . 0.85)
  ;;                 (org-level-7 . 0.8)
  ;;                 (org-level-8 . 0.75))))

;;;; Disable Electric Indent Mode
(add-hook! org-mode (electric-indent-local-mode -1))

;;;; Archiving
(use-package! org-archive
  :after org
  :config
  (setq org-archive-location "archive.org::datetree/"))

;;;; Visual Fill Column Mode
(defun smk/org-mode-visual-fill ()
  (setq visual-fill-column-width 120
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package! visual-fill-column
  :hook (org-mode . smk/org-mode-visual-fill))

;;;; Org Appear Mode - Show emphasis markers on cursor
(add-hook! 'org-mode-hook #'org-appear-mode)
(setq org-appear-autolinks t)

;;;; Org Alerts
(use-package org-alert)
(setq alert-default-style 'libnotify)
(org-alert-enable)

;; NeoTree
(after! neotree
    (setq neo-smart-open t
          neo-windows-fixed-size nil))

;; Centaur Tabs
;; (setq centaur-tabs-set-bar 'over)
;; (setq centaur-tabs-close-button nil)

;; Dired

;; LSP Settings
(setq lsp-file-watch-threshold nil)

;; Company Mode Settings
(set-company-backend! 'org-mode '(company-yasnippet company-capf company-files company-elisp))
(set-company-backend! 'emacs-lisp-mode '(company-yasnippet company-elisp))
;; (set-company-backend! 'mu4e-compose-edit '(company-mu company-yasnippet))
(setq company-idle-delay 0.25
      company-minimum-prefix-length 3)
(add-to-list 'company-backends '(company-capf company-files company-yasnippet company-semantic company-bbdb company-cmake company-keywords))
