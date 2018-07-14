;;; normal
(evil-leader/set-key
  "nf" 'find-file
  "nb" 'switch-to-buffer
  "nk" 'kill-buffer)

;;; evil-org-mode
(evil-leader/set-key
  "oist" 'evil-org-insert-subtodo
  "oih" 'evil-org-insert-heading
  "oehf" 'org-forward-heading-same-level
  "oehb" 'org-backward-heading-same-level
  "ot" 'org-todo
  "ouh" 'outline-up-heading
  "oa" 'org-agenda
  "ost" 'org-show-todo-tree
  "oml" 'org-shiftmetaleft
  "omr" 'org-shiftmetaright)


;;; evil-nerd-commenter
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "."  'evilnc-copy-and-comment-operator
  "\\" 'evilnc-comment-operator ; if you prefer backslash key
  )


;;; elfeed
;; show next elfeed content
(evil-leader/set-key
  "en" 'elfeed-show-next)


;;; imenu-list-smart
;; imenu-list-smart-toggle
(evil-leader/set-key
  "nim" #'imenu-list-smart-toggle)


;;; flyspell-correct
;; flyspell-correct-previous-word-generic
(evil-leader/set-key
  "nsc" 'flyspell-correct-previous-word-generic)


(evil-leader/set-key
 "nydt" 'youdao-dictionary-search-at-point-tooltip)

;;; highlight-indentation
(evil-leader/set-key
  "nhi" 'highlight-indentation-mode)


;;; sdcv-mode
(evil-leader/set-key
  "nss" 'sdcv-search-pointer+)

;;; avy-goto
(evil-leader/set-key
  "a" 'avy-goto-char
  "f" 'avy-goto-char-in-line
  "l" 'avy-goto-line
  "w" 'avy-goto-word-1)

;;; markdown-mode
(evil-leader/set-key
  "m1" 'markdown-insert-header-atx-1
  "m2" 'markdown-insert-header-atx-2
  "m3" 'markdown-insert-header-atx-3
  "m4" 'markdown-insert-header-atx-4
  "m5" 'markdown-insert-header-atx-5
  "m6" 'markdown-insert-header-atx-6
  "mr" 'markdown-insert-hr
  "mb" 'markdown-insert-bold
  "mc" 'markdown-insert-code
  "ml" 'markdown-insert-link
  "mim" 'markdown-insert-image
  "mia" 'markdown-insert-italic
  "mit" 'markdown-insert-list-item)


(provide 'personal-evil-setkey)
