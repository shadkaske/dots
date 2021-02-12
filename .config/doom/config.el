;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Basic Emacs Setup
(setq user-full-name "Shad Kaske"
    user-mail-address "shadkaske@gmail.com")

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
(setq display-line-numbers-type 'relative)

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
                    '((user-mail-address      . "kaskshad@showplacewood.com")
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

;;;; Hide Emphasis Markers
(after! org (setq org-hide-emphasis-markers t)
  ;;;; Turn On Logging
  (setq org-log-done t)
  (setq org-log-into-drawer t))

;;;; Disable Electric Indent Mode
(add-hook! org-mode (electric-indent-local-mode -1))

;;;; Use Variable Pitch Fonts in Org Mode
(add-hook! org-mode :append
           #'variable-pitch-mode)

;;;; Org Agenda
(use-package! org-agenda
  :ensure t
  :after org
  :config
  (org-agenda-files (list org-directory))
  (setq org-agenda-custom-commands '(("g" "Scheduled today and all NEXT items" ((agenda "" ((org-agenda-span 1))) (todo "NEXT"))))))

;;;; Archiving
(after! org
  (setq org-archive-tag "archive"))
  (setq org-archive-location (concat org-directory "archive.org::* From %s"))

;;;; Refile Targets
(after! org
  (setq org-refile-targets '((nil :maxlevel . 3)
                             (org-agenda-files :maxlevel . 3))))
;; NeoTree
(after! neotree
    (setq neo-smart-open t
          neo-windows-fixed-size nil))
