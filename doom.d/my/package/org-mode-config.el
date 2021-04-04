;;; my/package/org-mode-config.el -*- lexical-binding: t; -*-

(setq org-agenda-files (list "~/org/gtd/"))
(setq org-agenda-custom-commands
      '(
        ("w" . "优先级安排")
        ("wk" "查看KILL条目" todo "KILL")
        ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
        ("wb" "重要且不紧急的任务" tags-todo "+PRIORITY=\"B\"")
        ("wc" "不重要且不紧急的任务" tags-todo "+PRIORITY=\"C\"")
        ("wd" "休闲任务" tags-todo "+PRIORITY=\"D\"")
        )
      )

(setq org-priority-faces '((?A . (:foreground "red" ))
                           (?B . (:foreground "yellow"))
                           (?C . warning)
                           (?D . (:foreground "green"))))



(defun my/refile-to (file headline)
  "Move current headline to specified location"
  (let ((pos (save-excursion
               (find-file file)
               (org-find-exact-headline-in-buffer headline))))
    (org-refile nil nil (list headline file nil pos)))
  (switch-to-buffer (current-buffer)))


(defun my/refile-todo()
  (interactive)
  (if (equal 2 (nth 1 (org-heading-components)))
      (if (equal (org-get-todo-state) "DONE")
          (my/refile-to "~/org/gtd/done.org" "Done")
        (if (equal (org-get-todo-state) "KILL")
            (my/refile-to "~/org/gtd/kill.org" "Kill")
          (if (equal (org-get-todo-state) "TODO")
              (my/refile-to "~/org/gtd/todo.org" "Todo")
            )))))


;; (add-hook 'org-after-todo-state-change-hook 'my/refile-todo 'append)




(use-package org-roam
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/org/roam/")
  :bind (:map org-roam-mode-map
         (("C-c n l" . org-roam)
          ("C-c n f" . org-roam-find-file)
          ("C-c n g" . org-roam-graph))
         :map org-mode-map
         (("C-c n i" . org-roam-insert))
         (("C-c n I" . org-roam-insert-immediate)))
  :config
  ;; (org-roam-mode +1)
  (require 'org-roam-protocol))

(use-package org-roam-server
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8079
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        ;; org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))


(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
;; (org-superstar-mode 1)
(setq org-superstar-headline-bullets-list '("○" "◉"))
(setq org-superstar-item-bullet-alist '(
                                        (?* . ?•)
                                        (?+ . ?➤)
                                        (?- . ?•)
                                        ))
(defun notify (msg)
  (shell-command (concat "paplay /usr/share/sounds/freedesktop/stereo/complete.oga && notify-send " msg))
  )


(use-package! org-pomodoro
  :config
  (setq org-pomodoro-play-sounds nil)
  (custom-set-variables
   '(org-pomodoro-format "•%s")
   '(org-pomodoro-short-break-format "•%s") )
  (add-hook 'org-pomodoro-finished-hook
            (lambda ()
              (notify "'Pomodoro completed! Time for a break.'")))
  (add-hook 'org-pomodoro-break-finished-hook
            (lambda ()
              (notify "'Pomodoro Short Break Finished! Ready for Another?'")))
  (add-hook 'org-pomodoro-long-break-finished-hook
            (lambda ()
              (notify "'Pomodoro Long Break Finished! Ready for Another?'")))
  (add-hook 'org-pomodoro-killed-hook
            (lambda ()
              (notify "'Pomodoro Killed! One does not simply kill a pomodoro!'")))
  )





;; (use-package! org-superstar
;;   :init
;;   :config
;;   (org-superstar-mode 1)
;;   ;; (setq org-superstar-headline-bullets-list '("☰" "☱" "☲" "☴" "☳" "☵" "☶" "☷"))
;;   ;; (setq org-superstar-headline-bullets-list '("Ⅰ" "Ⅱ" "Ⅲ" "Ⅳ" "Ⅴ" "Ⅵ" "Ⅶ" "Ⅷ" "Ⅸ" "Ⅹ"))
;;   ;; (setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "✤" "✜" "◆" "▶"))
;;   (setq org-superstar-headline-bullets-list '("○" "◉"))
;;   (setq org-superstar-item-bullet-alist '(
;;                                           (?* . ?•)
;;                                           (?+ . ?➤)
;;                                           (?- . ?•)
;;                                           ))
;;   ;; (setq org-ellipsis "▼")
;;   )

(setq org-log-done 'time)


(provide 'org-mode-config)
