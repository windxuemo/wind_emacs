;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with , n f and enter text in its buffer.

(eval-when-compile (require 'cl))

(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))

(if (display-graphic-p)
    (ecase system-type
      (gnu/linux
       (set-face-bold-p 'bold nil)
       (set-face-underline-p 'bold nil)
       (set-font "inconsolata" "vera Sans YuanTi Mono" 16 16))
      (darwin
       (set-font "monofur" "STHeiti" 16 16))) nil)
