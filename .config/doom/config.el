;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Basic Emacs Setup
(setq user-full-name "Shad Kaske"
    user-mail-address "skaske@showplacewood.com")

;; Don't Ask to Close
(setq confirm-kill-emacs nil)

;; Disable Clipboard Selection and Manager
(setq select-enable-clipboard nil
    x-select-enable-clipboard-manager nil)

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
(map!
 (:after evil
   :en "C-h"   #'evil-window-left
   :en "C-j"   #'evil-window-down
   :en "C-k"   #'evil-window-up
   :en "C-l"   #'evil-window-right))

;; mu4e
(remove-hook! 'mu4e-compose-pre-hook #'org-msg-mode)
(after! mu4e
(setq! mu4e-maildir (expand-file-name "~/Mail/kaskshad-showplace") ; the rest of the mu4e folders are RELATIVE to this one
        mu4e-get-mail-command "mbsync -c ~/.config/mu4e/mbsyncrc -a"
        mu4e-index-update-in-background t
        mu4e-compose-signature-auto-include nil
        mu4e-use-fancy-chars t
        mu4e-view-show-addresses t
        mu4e-view-show-images t
        mu4e-compose-format-flowed t
        ;mu4e-compose-in-new-frame t
        mu4e-change-filenames-when-moving t ;; http://pragmaticemacs.com/emacs/fixing-duplicate-uid-errors-when-using-mbsync-and-mu4e/
        mu4e-maildir-shortcuts
        '( ("/Inbox" . ?i)
            ("/Archive" . ?a)
            ("/Drafts" . ?d)
            ("/Deleted Items" . ?t)
            ("/Sent Items" . ?s))

        ;; Message Formatting and sending
        message-send-mail-function 'smtpmail-send-it
        message-signature-file "~/.config/mu4e/mailsignature"
        message-citation-line-format "On %a %d %b %Y at %R, %f wrote:\n"
        message-citation-line-function 'message-insert-formatted-citation-line
        message-kill-buffer-on-exit t))

(set-email-account! "kaskshad@showplacewood.com"
                    '((user-mail-address      . "skaske@showplacewood.com")
                    (user-full-name         . "Shad Kaske")
                    (smtpmail-smtp-server   . "smtp.office365.com")
                    (smtpmail-smtp-service  . 587)
                    (smtpmail-stream-type   . starttls)
                    (smtpmail-debug-info    . t)
                    (mu4e-drafts-folder     . "/Drafts")
                    (mu4e-refile-folder     . "/Archive")
                    (mu4e-sent-folder       . "/Sent Items")
                    (mu4e-trash-folder      . "/Deleted Items")
                    (mu4e-update-interval   . 300)
                    ;(mu4e-sent-messages-behavior . 'delete)
                    )
                    nil)

(mu4e-alert-set-default-style 'libnotify)
(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)

;; Org Mode
;;;; Doom Emacs Org Settings
(setq org-directory "~/Nextcloud/org/")
(setq org-noter-notes-search-path '("~/Nextcloud/org/reference/"))

;;;; Disable LineNumber in Org Mode
(add-hook! 'org-mode-hook #'doom-disable-line-numbers-h)

;;;; Hide Emphasis Markers
(after! org (setq org-hide-emphasis-markers t)
  ;;;; Turn On Logging
  (setq org-log-done t)
  (setq org-log-into-drawer t)
  ;;  Org ToDo Keywords
  (setq org-todo-keywords '((sequence
                             "TODO(t!)" "NEXT(n!)" "WAITING(w!)" "|" "DONE(d!)" "CANCELLED(c!)")))
  ;;  Org Todo Keywords Colors
  (setq org-todo-keyword-faces '(("TODO" . "IndianRed")
                                 ("NEXT" . "DarkOrange")
                                 ("WAITING" . "DimGray")
                                 ("DONE" . "OliveDrab")
                                 ("CANCELLED" . "MediumPurple")))
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
          ("e" "Email [Inbox]"
           entry (file "~/Nextcloud/org/inbox.org")
                  "* TODO %?\n%U\n%a\n")))
  ;;;; Org Refiler Targets
  (setq org-refile-targets '((org-agenda-files :maxlevel . 3))))

;;;; Disable Electric Indent Mode
(add-hook! org-mode (electric-indent-local-mode -1))

;;;; Archiving
(use-package! org-archive
  :after org
  :config
  (setq org-archive-location "archive.org::datetree/"))

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
