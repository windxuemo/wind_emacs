;;; 右边分屏并用eww打开当前org文件为html格式
(defun org-preview-html-split ()
  "split 3 and open html with eww."
  (interactive)
  (split-window-right)
  (org-preview-html-mode))

;;; 列出函数的调用情况
(defun yyc/cflow-function (function-name)
  "Get call graph of inputed function. "
  (interactive "sFunction name:\n")
  ;; (interactive (list (car (senator-jump-interactive "Function name: "
  ;;                                                  nil nil nil))))
  (setq cmd (format "cflow  -b --main=%s %s" function-name buffer-file-name))
  (setq cflow-buf-name (format "**cflow-%s:%s**"
                               (file-name-nondirectory buffer-file-name)
                               function-name))
  (setq cflow-buf (get-buffer-create cflow-buf-name))
  (set-buffer cflow-buf)
  (setq buffer-read-only nil)
  (erase-buffer)
  (insert (shell-command-to-string cmd))
  (pop-to-buffer cflow-buf)
  (goto-char (point-min))
  (cflow-mode))


;;; 窗口对调
(defun transpose-buffers (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))
;; (global-set-key (kbd "M-9") 'transpose-buffers)



;;; 隐藏mode-line
;; If you want to hide the mode-line in every buffer by default
;; (add-hook 'after-change-major-mode-hook 'hidden-mode-line-mode)
(defvar-local hidden-mode-line-mode nil)

(define-minor-mode hidden-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global t
  :variable hidden-mode-line-mode
  :group 'editing-basics
  (if hidden-mode-line-mode
      (setq hide-mode-line mode-line-format
            mode-line-format nil)
    (setq mode-line-format hide-mode-line
          hide-mode-line nil))
  (force-mode-line-update)
  ;; Apparently force-mode-line-update is not always enough to
  ;; redisplay the mode-line
  (redraw-display)
  (when (and (called-interactively-p 'interactive)
             hidden-mode-line-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "Hidden Mode Line Mode enabled.  "
             "Use M-x hidden-mode-line-mode to make the mode-line appear."))))


;;;
(defun avy-open-line ()
  ;; Make newline to were avy say and hold cursor there.
  ;; You can quit avy and then normal open-line
  (interactive)
  (command-execute 'avy-goto-line)
  (command-execute 'open-line)
  )
