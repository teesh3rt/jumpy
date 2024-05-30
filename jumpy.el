;;; jumpy.el - quickly jump around in files

(defvar jumpy--filelist '() "The list of files Jumpy uses")
(defvar jumpy--buffer nil "The file currently selected")

(defun jumpy-add (buffer)
  "add the current buffer to the jumpy list"
  (interactive "bWhich buffer: ")
  (push buffer jumpy--filelist)
  (set 'jumpy--buffer buffer))

(defun jumpy-jump ()
  "jump to the currently selected file in the jumpy list"
  (interactive)
  (switch-to-buffer jumpy--buffer)
  (message (concat "[jumpy] switched to buffer")))

(defun jumpy-reset ()
  "reset the jumpy list"
  (interactive)
  (set 'jumpy--filelist '())
  (set 'jumpy--buffer nil)
  (message "[jumpy] reset the jumpy list"))

(defun jumpy-select (buffer)
  (interactive (list (completing-read "Choose buffer: " jumpy--filelist)))
  (set 'jumpy--buffer buffer))

(jumpy-reset)

(provide 'jumpy)
