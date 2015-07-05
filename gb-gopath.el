;; Experimental gb support for Emacs
;; This updates the GOPATH inside buffers that work on files located inside
;; of gb projects. For now this only works on Unix systems.

;;; Code:
(defun zerok/setup-gb-gopath ()
  (interactive)
  (make-local-variable 'process-environment)
  (let (
        (srcPath (_zerok/get-gb-src-folder buffer-file-name))
        )
    (when srcPath
      (let* (
            (projectPath (string-remove-suffix "/" (file-name-directory srcPath)))
            (vendorPath (string-remove-suffix "/" (concat projectPath "/vendor")))
            (gopath (concat vendorPath ":" projectPath))
            )
        (progn
          (message "Updating GOPATH to %s" gopath)
          (setenv "GOPATH" gopath)
          )
        ))))
(add-hook 'go-mode-hook 'zerok/setup-gb-gopath)

(defun _zerok/get-gb-src-folder (path)
  (let (
        (parent (directory-file-name (file-name-directory path)))
        (basename (file-name-nondirectory path))
        )
    (if (equal "src" basename)
        (string-remove-suffix "/" path)
      (if (equal "/" parent)
          nil
        (_zerok/get-gb-src-folder parent)
        )
      )
    )
  )
