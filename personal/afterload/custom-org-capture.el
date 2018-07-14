(define-key global-map "\C-cc" 'org-capture)
(setq capture-directory "~/Dropbox/Emacs/Org/Manager/")
(setq agenda-directory "~/Dropbox/Emacs/Org/Agenda/")
(setq org-capture-templates
      (quote (("i" "Idea" entry (file (concat capture-directory "idea.org"))
               "*  %^{Title} %?\n%U\n%a\n")
              ("n" "Note" entry (file (concat capture-directory "note.org"))
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("k" "Knowledge" entry (file (concat capture-directory "knowledge.org"))
               "* %? \n%U\n" :clock-resume t)
              ("b" "Inbox" entry (file (concat agenda-directory "inbox.org"))
               "* INBOX %? \n" t)
              ("j" "Journal" entry (file+datetree (concat capture-directory "journal.org"))
               "*  %^{Title} %?\n%U\n%a\n" :clock-in t :clock-resume t)
              )))
