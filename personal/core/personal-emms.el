;;;; emms-config-start
(require 'emms-setup)
(emms-all)
(emms-default-players)

(setq emms-source-file-default-directory "~/Music")


(emms-player-set emms-player-mplayer 'regex
                 "\\.aac\\|\\.flac\\|\\.mp3\\|\\.ogg\\|\\.wav\\|\\.webm\\|\\.flv\\|\\.ape")

(setq emms-playlist-default-major-mode 'emms-playlist-mode)
(add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track)
(add-to-list 'emms-info-functions 'kid-emms-info-simple)
(setq emms-track-description-function 'kid-emms-info-track-description)
(when (fboundp 'emms-cache)
  (emms-cache 1))

(setq emms-info-asynchronously nil)
; use faster finding facility if you have GNU find
(setq emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
; My musics
(add-hook 'emms-player-started-hook 'emms-show)
; mode line format
(setq emms-mode-line-format "[ %s "
      emms-playing-time-display-format "%s ]")
(setq global-mode-string
      '("" emms-mode-line-string " " emms-playing-time-string))
;
(defun kid-emms-info-simple (track)
  "Get info from the filename.
mp3 标签的乱码问题总是很严重，幸好我系统里面的音乐文件
都放得比较有规律，所以我决定直接从文件名获取标签信息。"
  (when (eq 'file (emms-track-type track))
    (let ((regexp "/\\([^/]+\\)-\\([^/]+\\)\\.[^.]+$")
          (name (emms-track-name track)))
      (if (string-match regexp name)
          (progn
            (emms-track-set track 'info-artist (match-string 1 name))
            (emms-track-set track 'info-title (match-string 2 name)))
          (emms-track-set track
                          'info-title
                          (file-name-nondirectory name))))))

(defun kid-emms-info-track-description (track)
  "Return a description of the current track."
  (let ((artist (emms-track-get track 'info-artist))
        (title (emms-track-get track 'info-title)))
    (format "%-20s +| %s"
            (or artist
                "")
            title)))

(provide 'personal-emms)
;;;; emms-config-end
