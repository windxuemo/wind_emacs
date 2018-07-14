;;;; org-bullets-config-start
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;;; truncate-lines
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;;; set org-mode open html as firefox
(setq org-file-apps
   (quote
     ((auto-mode . emacs)
      ("\\.mm\\'" . "/usr/bin/freeplane %s")
      ("\\.\\'" . "/usr/bin/firefox %s")
      ("\\x?html?\\'" . "/usr/bin/firefox %s")
      ("\\.pdf\\'" . default))))

;;;; org-bullets-config-end


;;;; yasnippet-config-start
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        "~/.emacs.d/elpa/yasnippet-20170723.1530/snippets"
        ))

(yas-global-mode 1)
;;;; yasnippet-config-end

;;;; org-pomodoro-config-start
(require 'org-pomodoro)
;; off sound
(setq org-pomodoro-play-sounds nil)
(custom-set-variables
 '(org-pomodoro-format "•%s")
 '(org-pomodoro-short-break-format "•%s") )


(defun notify-osx (title message)
  (call-process "notify-send"
                nil 0 nil
                title message
                "-i" "/home/mo/Desktop/clock.png"))

(add-hook 'org-pomodoro-finished-hook
          (lambda ()
            (notify-osx "Pomodoro" "Relax Your Eyes !")))
(add-hook 'org-pomodoro-short-break-finished-hook
          (lambda ()
            (notify-osx "Pomodoro" "Ready For Another Pomodoro ?")))
;;;; org-pomodoro-config-end


;;;; swiper-config-start
(require 'swiper)
;;;; swiper-config-end

;;;; olivetti-config-start
(require 'olivetti)
;;;; olivetti-config-end

;;;; youdao-dictionary-config-start
(require 'youdao-dictionary)
;;;; youdao-dictionary-config-end

;;;; elfeed-config-start

(require 'elfeed)
;; Entries older than 2 weeks are marked as read
(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :before "2 weeks ago"
                              :remove 'unread))
;;
(defface important-elfeed-entry
  '((t :foreground "#f77"))
  "Marks an important Elfeed entry.")

(push '(important important-elfeed-entry)
      elfeed-search-face-alist)

;;functions to support syncing .elfeed between machines
;;makes sure elfeed reads index from disk before launching
(defun bjm/elfeed-load-db-and-open ()
  "Wrapper to load the elfeed db from disk before opening"
  (interactive)
  (elfeed-db-load)
  (elfeed)
  (elfeed-search-update--force))

;;write to disk when quiting
(defun bjm/elfeed-save-db-and-bury ()
  "Wrapper to save the elfeed db to disk before burying buffer"
  (interactive)
  (elfeed-db-save)
  (quit-window))
;;;; elfeed-config-end


;;;; elfeed-org-config-start
;; Load elfeed-org
(require 'elfeed-org)

;; Initialize elfeed-org
;; This hooks up elfeed-org to read the configuration when elfeed
;; is started with =M-x elfeed=
(elfeed-org)

;; Optionally specify a number of files containing elfeed
;; configuration. If not set then the location below is used.
;; Note: The customize interface is also supported.
(setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org"))

;;;; elfeed-org-config-end



;;;; elfeed-googies-config-start
(require 'elfeed)
(require 'elfeed-goodies)

(elfeed-goodies/setup)
;;;; elfeed-googies-config-end

;;;; ggtags-config-start
;; comment it because that to disable company-mode working
;;;;temp (require 'ggtags)
;;;;temp (add-hook 'c-mode-common-hook
;;;;temp           (lambda ()
;;;;temp             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
;;;;temp               (ggtags-mode 1))))
;;;;temp 
;;;; ggtags-config-end

;;;; golden-ratio-config-start
(require 'golden-ratio)
(golden-ratio-mode 1)
;;;; golden-ratio-config-end

;;;; highlight-indentation-config-start
(require 'highlight-indentation)
;;;; highlight-indentation-config-end


;;;; cflow-mode-config-start
;; (require 'cflow-mode)
;; (defvar cmd nil nil)
;; (defvar cflow-buf nil nil)
;; (defvar cflow-buf-name nil nil)
;;;; cflow-mode-config-end

;;;; tabbar-config-start
;; (require 'tabbar)
;; (tabbar-mode 1)
;; ; close default tabs，and move all files into one group
;; (setq tabbar-buffer-list-function
;;     (lambda ()
;;         (remove-if
;;           (lambda(buffer)
;;              (find (aref (buffer-name buffer) 0) " *"))
;;           (buffer-list))))
;; (setq tabbar-buffer-groups-function
;;       (lambda()(list "All")))
;; (set-face-attribute 'tabbar-button nil)
;;
;; ;;set tabbar's backgroud color
;; (set-face-attribute 'tabbar-default nil
;;                     :background "gray"
;;                     :foreground "gray30")
;; (set-face-attribute 'tabbar-selected nil
;;                     :inherit 'tabbar-default
;;                     :background "green"
;;                     :box '(:line-width 3 :color "DarkGoldenrod") )
;; (set-face-attribute 'tabbar-unselected nil
;;                     :inherit 'tabbar-default
;;                     :box '(:line-width 3 :color "gray"))
;;
;; ;; USEFUL: set tabbar's separator gap
;; (custom-set-variables '(tabbar-separator (quote (1.5))))
;;;; tabbar-config-end

;;;; hide-region-config-start
(require 'hide-region)
;;;; hide-region-config-end

;;;; hide-lines-config-start
(require 'hide-lines)
;;;; hide-lines-config-en

;;;; imenu-list-config-start
(require 'imenu-list)
;;;; imenu-list-config-end

;;;; ace-flyspell-config-start
;; (require 'ace-flyspell)
;;;; ace-flyspell-config-end

;;;; flyspell-correct-config-start
(require 'flyspell-correct-ivy)
(define-key flyspell-mode-map (kbd "<f6>") 'flyspell-correct-word-generic)
;;;; flyspell-correct-config-end


;;;; graphviz-dot-mode-config-start
(require 'graphviz-dot-mode)
;;;; graphviz-dot-mode-config-end

;;;; ox-freemind-config-start
(require 'ox-freemind)
;;;; ox-freemind-config-end

;;;; evil-markdown-config-start
(require 'evil-markdown)
;;;; evil-markdown-config-end



;;;; sdcv-config-start
(require 'sdcv)
;;;; sdcv-config-end


;;;; calfw-config-start
(require 'calfw)
(require 'calfw-org)
;;;; calfw-config-end

;;;; multiple-cursors-config-start
(use-package multiple-cursors
  :bind (("C->"           . mc/mark-next-like-this)
         ("C-<"           . mc/mark-previous-like-this)
         ("C-M->"         . mc/skip-to-next-like-this)
         ("C-M-<"         . mc/skip-to-previous-like-this)
         ("C-c C-<"       . mc/mark-all-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)
         :map mc/keymap
         ("C-|" . mc/vertical-align-with-space))
  :config
  (setq mc/insert-numbers-default 1))

;;;; multiple-cursors-config-end

;;;; ledger-config-start
(require 'personal-ledger)
;;;; ledger-config-end



;;;; crypt-config-start
(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote("crypt")))
(setq org-crypt-key nil)

;;;; encrypt tag replace 
;;; (setq org-crypt-tag-matcher "secret")

(require 'epa-file)
(epa-file-enable)
(setq epa-file-select-keys nil)
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
;;; (setq epa-file-inhibit-auto-save nil)
;;;; crypt-config-end

;;;; avy-mode-config-start
; set avy key
(setq avy-keys
      (nconc (number-sequence ?a ?z)
             (number-sequence ?A ?Z)
             (number-sequence ?1 ?9)
             '(?0)))
;;;; avy-mode-config-end


;;;; set org journal directroy
(setq org-journal-dir "~/Dropbox/Emacs/Org/Journal")
;;;; 

(require 'iedit)

(require 'personal-evil)
(require 'personal-evil-setkey)
(require 'personal-emms)
(require 'personal-web)



