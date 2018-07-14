(setq org-agenda-files (list "~/Dropbox/Emacs/Org/Agenda"))

(setq org-todo-keywords '((sequence "INBOX(x)" "TODO(t)" "NEXT(n)" "DOING(s)"  "|"  "DONE(d)" "CANCELLED(c@)")
                          (sequence "IDLE(a)" "HABIT(h)" "SOMEDAY(o)")))

(setq org-use-fast-todo-selection t)

(setq org-todo-keyword-faces
      '(("NEXT" :foreground "blue" :weight bold)
        ("DOING" :foreground "red" :weight bold)
        ("INPROGRESS" :foreground "burlywood" :weight bold)
        ("DONE" :foreground "forest green" :weight bold)
        ("TODO" :foreground "orange" :weight bold)
        ("INBOX" :foreground "orange" :weight normal)
        ("CANCELLED" :foreground "forest green" :weight bold)
        ("MEETING" :foreground "yellow" :weight bold)
        ("PHONE" :foreground) "yellow" :weight bold
        ("HABIT" :foreground "grey" :weight bold)
        ("IDLE" :foreground "magenta" :weight bold)))


(setq org-tag-alist '((:startgroup)
                      ("@STORE" . ?s)
                      ("@WORK" . ?w)
                      ("@HOME" . ?H)
                      (:endgroup)
                      ("PROJECT" . ?P)
                      ("HEALTH" . ?F)
                      ("SHOPPING" . ?S)
                      ("NOTE" . ?n)
                      ))

;;; 设置refile目标
(setq org-refile-targets
      '((nil :maxlevel . 4)
        (org-agenda-files :maxlevel . 4)))

(setq org-outline-path-complete-in-steps nil)
;;; 在refile的时候列出文件路径
(setq org-refile-use-outline-path 'file)
;;; 开启任务依赖功能
(setq org-enforce-todo-dependencies t)
