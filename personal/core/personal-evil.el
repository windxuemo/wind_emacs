;;;; evil-leader-config-start
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
;;;; evil-leader-config-end


;;;; evil-org-config-start
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
;;;; evil-org-config-end

;;;; evil-nerd-commenter-config-start
(require 'evil-nerd-commenter)
(evilnc-default-hotkeys)

;; Emacs key bindings
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)
;;;; evil-nerd-commenter-config-end


;;;; evil-anzu-config-start
(require 'evil-anzu)
;;;; evil-anzu-config-end


(provide 'personal-evil)
