;;; airplay-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "airplay" "airplay.el" (21616 20138 0 0))
;;; Generated autoloads from airplay.el

(autoload 'airplay/image:view "airplay" "\


\(fn IMAGE_FILE &optional TRANSITION)" nil nil)

(autoload 'airplay:stop "airplay" "\


\(fn)" t nil)

(autoload 'airplay/video:play "airplay" "\


\(fn VIDEO_LOCATION)" nil nil)

(autoload 'airplay/video:scrub "airplay" "\
Retrieve the current playback position.

\(fn &optional CB)" nil nil)

(autoload 'airplay/video:seek "airplay" "\


\(fn POSITION)" nil nil)

(autoload 'airplay/video:info "airplay" "\


\(fn &optional CALLBACK)" nil nil)

(autoload 'airplay/video:pause "airplay" "\


\(fn)" t nil)

(autoload 'airplay/video:resume "airplay" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("airplay-pkg.el" "airplay-video-server.el")
;;;;;;  (21616 20138 507794 0))

;;;***

(provide 'airplay-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; airplay-autoloads.el ends here
