;; -*- coding: utf-8 -*-
(setq *c-quick-version* "v3.2.0")
;;; c-quick.el --- Intelligent Cursor Movement for GNU Emacs
;;
;; Copyright (C) 1993-2026 JavaCommons Technologies
;;
;; Author: JavaCommons Technologies
;; URL: https://github.com/emacs-pkg/c-quick
;; Version: please see *c-quick-version* above.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(require 'cl-lib)
(require 'eshell)
(require 'find-func)

(defun c-quick-version ()
  (interactive)
  (message "c-quick %s" *c-quick-version*)
  *c-quick-version*)

(global-set-key (kbd "<down>")       'c-quick-down-key)
(global-set-key (kbd "<up>")         'c-quick-up-key)
(global-set-key (kbd "<right>")      'c-quick-right-key)
(global-set-key (kbd "<left>")       'c-quick-left-key)
(global-set-key (kbd "C-z")          'undo)
(global-set-key (kbd "C-S-z")        'undo)
(global-set-key (kbd "C-M-z")        'undo)
(global-set-key (kbd "M-w")          'c-quick-copy-region)
(global-set-key (kbd "C-w")          'c-quick-kill-region)
(global-set-key (kbd "C-M-\\")       'c-quick-indent-region)
(global-set-key (kbd "<C-delete>")   'c-quick-delete-region)
(global-set-key (kbd "<C-tab>")      'c-quick-rotate-buffer)
(global-set-key (kbd "<S-tab>")      'c-quick-rotate-buffer)
(global-set-key (kbd "<C-return>")   'c-quick-rotate-buffer)
(global-set-key (kbd "<S-return>")   'c-quick-rotate-buffer)
(global-set-key (kbd "<backtab>" )   'c-quick-rotate-buffer)
(global-set-key (kbd "<C-S-tab>" )   'c-quick-tab-next)
(global-set-key (kbd "<C-S-return>") 'c-quick-tab-next)

(global-set-key (kbd "<C-right>")    'c-quick-right-quick)
(global-set-key (kbd "<C-left>")     'c-quick-left-quick)
(global-set-key (kbd "<C-up>")       'c-quick-up-quick)
(global-set-key (kbd "<C-down>")     'c-quick-down-quick)

(global-set-key (kbd "C-x o")        'c-quick-other-window)
(global-set-key (kbd "C-x C-x")      'c-quick-exchange-point-and-mark)

(global-set-key (kbd "<f3>")          'c-quick-tab-next)
(global-set-key (kbd "<C-f3>")        'tab-close)
(global-set-key (kbd "<S-f3>")        'tab-close-other)
(global-set-key (kbd "<M-f3>")
                #'(lambda ()
                    (interactive)
                    (if (fboundp 'save-buffers-kill-terminal)
                        (save-buffers-kill-terminal)
                      (kill-emacs))))

(global-set-key (kbd "<f4>")         'c-quick-rotate-buffer)
(global-set-key (kbd "<C-f4>")       'c-quick-kill-current-buffer)
(global-set-key (kbd "<S-f4>")       'c-quick-kill-other-buffers)
(global-set-key (kbd "<M-f4>")
                #'(lambda ()
                    (interactive)
                    (if (fboundp 'save-buffers-kill-terminal)
                        (save-buffers-kill-terminal)
                      (kill-emacs))))

(global-set-key (kbd "<f5>")         'c-quick-bookmark-set)
(global-set-key (kbd "C-x <f5>")     'c-quick-bookmark-set)
(global-set-key (kbd "<C-f5>")       'c-quick-bookmark-set)
(global-set-key (kbd "<S-f5>")       'c-quick-bookmark-set)
(global-set-key (kbd "<M-f5>")       'c-quick-bookmark-set)

(global-set-key (kbd "<C-S-f5>")
                #'(lambda ()
                    (interactive)
                    (eval-buffer) (message "Buffer evaluated.")))
(global-set-key (kbd "<C-M-f5>")
                #'(lambda ()
                    (interactive)
                    (eval-buffer) (message "Buffer evaluated.")))

(global-set-key (kbd "<f6>")         'c-quick-list-bookmarks)
(global-set-key (kbd "C-x <f6>")     'c-quick-list-bookmarks)
(global-set-key (kbd "<C-f6>")       'c-quick-list-bookmarks)
(global-set-key (kbd "<S-f6>")       'c-quick-list-bookmarks)
(global-set-key (kbd "<M-f6>")       'c-quick-list-bookmarks)

(global-set-key (kbd "<C-S-f6>")
                #'(lambda ()
                    (interactive)
                    (tab-new) (c-quick-list-bookmarks)))
(global-set-key (kbd "<C-M-f6>")
                #'(lambda ()
                    (interactive)
                    (tab-new) (c-quick-list-bookmarks)))

(global-set-key (kbd "<f7>")         'c-quick-list-files)
(global-set-key (kbd "C-x <f7>")     'c-quick-list-files)
(global-set-key (kbd "<C-f7>")       'c-quick-list-files)
(global-set-key (kbd "<S-f7>")       'c-quick-list-files)
(global-set-key (kbd "<M-f7>")       'c-quick-list-files)

(global-set-key (kbd "<C-S-f7>")
                #'(lambda ()
                    (interactive)
                    (tab-new) (c-quick-list-files)))
(global-set-key (kbd "<C-M-f7>")
                #'(lambda ()
                    (interactive)
                    (tab-new) (c-quick-list-files)))

(global-set-key (kbd "<f8>")         'c-quick-list-buffers)
(global-set-key (kbd "C-x <f8>")     'c-quick-list-buffers)
(global-set-key (kbd "<C-f8>")       'c-quick-list-buffers)
(global-set-key (kbd "<S-f8>")       'c-quick-list-buffers)
(global-set-key (kbd "<M-f8>")       'c-quick-list-buffers)

(global-set-key (kbd "<C-S-f8>")
                #'(lambda ()
                    (interactive)
                    (tab-new) (c-quick-list-buffers)))
(global-set-key (kbd "<C-M-f8>")
                #'(lambda ()
                    (interactive)
                    (tab-new) (c-quick-list-buffers)))

(global-set-key (kbd "<f9>")         'c-quick-toggle-mode)
(global-set-key (kbd "C-x <f9>")     'c-quick-toggle-mode)
(global-set-key (kbd "<C-f9>")       'c-quick-toggle-mode)
(global-set-key (kbd "<S-f9>")       'c-quick-toggle-mode)
(global-set-key (kbd "<M-f9>")       'c-quick-toggle-mode)

(global-set-key (kbd "<f10>")        'c-quick-run-file-in-eshell)
(global-set-key (kbd "C-x <f10>")    'c-quick-run-file-in-eshell)
(global-set-key (kbd "<C-f10>")      'c-quick-run-file-in-eshell)
(global-set-key (kbd "<S-f10>")      'c-quick-run-file-in-eshell)
(global-set-key (kbd "<M-f10>")      'c-quick-run-file-in-eshell)

(global-set-key (kbd "<C-S-f10>")    'c-quick-rerun-eshell)
(global-set-key (kbd "<C-M-f10>")    'c-quick-rerun-eshell)

(global-set-key (kbd "<f12>")        'c-quick-jump-to-function)
(global-set-key (kbd "C-x <f12>")    'c-quick-jump-to-function)
(global-set-key (kbd "<C-f12>")      'c-quick-jump-to-function)
(global-set-key (kbd "<S-f12>")      'c-quick-jump-to-function)
(global-set-key (kbd "<M-f12>")      'c-quick-jump-to-function)

(global-set-key (kbd "<C-S-f12>")    'c-quick-lookup-file-or-function)
(global-set-key (kbd "<C-M-f12>")    'c-quick-lookup-file-or-function)

;;; Customization

(defgroup c-quick nil
  "c-quick."
  :group 'c-quick
  :prefix "c-quick-")

(defcustom c-quick-ding-dings nil ""
  :group 'c-quick
  :type  'boolean)

(setq bookmark-bmenu-file-column 45)

(unless (boundp 'whitespace-line-column)
  (setq whitespace-line-column 1000000))

(setq whitespace-style
      '(face
        tabs spaces trailing lines space-before-tab newline
        indentation empty space-after-tab
        space-mark tab-mark newline-mark
        missing-newline-at-eof))

(defadvice eshell-script-interpreter (around esi activate)
  (setq ad-return-value
        (let ((file (ad-get-arg 0))
              (maxlen eshell-command-interpreter-max-length))
          (if (and (file-readable-p file)
                   (file-regular-p file))
              (with-temp-buffer
                (insert-file-contents-literally file nil 0 maxlen)
                (when (re-search-forward "^#![ \t]*\\(.+\\)$" nil t)
                  (let ((lst (split-string (match-string 1))))
                    (when (string= "/usr/bin/env" (car lst))
                      (setq lst (cdr lst))
                      (when (string= "-S" (car lst))
                        (setq lst (cdr lst))
                        )
                      )
                    (append lst (list file)))))))))

;;; Internal Variables

(setq *c-quick-mode-is-on* nil)
(make-variable-buffer-local '*c-quick-mode-is-on*)

;;; Functions

(defun c-quick-toggle-mode ()
  (interactive)
  (setq *c-quick-mode-is-on* (not *c-quick-mode-is-on*))
  (c-quick-set-mode *c-quick-mode-is-on*)
  (cond
   (*c-quick-mode-is-on* (message "c-quick-mode is ON"))
   (t (message "c-quick-mode is OFF"))))

(defun c-quick-set-mode (arg)
  (show-paren-mode 1)
  (cond
   ((and arg (display-graphic-p))
    (setq show-paren-delay 0)
    (setq show-paren-style 'expression)
    ;; (setq display-fill-column-indicator t)
    ;; (unless display-fill-column-indicator-character
    ;;   (setq display-fill-column-indicator-character
    ;;         (if (and (char-displayable-p ?\u2502)
    ;;                  (or (not (display-graphic-p))
    ;;                      (eq (aref (query-font (car (internal-char-font nil ?\u2502))) 0)
    ;;                          (face-font 'default))))
    ;;             ?\u2502
    ;;           ?|)))
    (setq show-trailing-whitespace t)
    (whitespace-mode 1)
    )
   (t
    (setq show-paren-delay 0.125)
    (setq show-paren-style 'parenthesis)
    ;; (setq display-fill-column-indicator nil)
    (setq show-trailing-whitespace nil)
    (whitespace-mode 0)
    )
   )
  )

(defun c-quick-mode ()
  (and
   (not (window-minibuffer-p (selected-window)))
   *c-quick-mode-is-on*))

(defun c-quick-ding ()
  (if c-quick-ding-dings (ding)))

(defun c-quick-redisplay ()
  (c-quick-recenter)
  ;;(c-quick-show-info)
  (force-mode-line-update)
  (when (input-pending-p) (discard-input)))

(defun c-quick-down-key ()
  (interactive)
  (if (c-quick-mode)
      (c-quick-slide-down)
    (c-quick-next-line)
    )
  (c-quick-redisplay))

(defun c-quick-up-key ()
  (interactive)
  (if (c-quick-mode)
      (c-quick-slide-up)
    (c-quick-previous-line)
    )
  (c-quick-redisplay))

(defun c-quick-right-key ()
  (interactive)
  (if (c-quick-mode)
      (c-quick-forward-sexp)
    (c-quick-forward-char))
  (c-quick-redisplay))

(defun c-quick-left-key ()
  (interactive)
  (if (c-quick-mode)
      (c-quick-backward-sexp)
    (c-quick-backward-char))
  (c-quick-redisplay))

(defun c-quick-right-quick ()
  (interactive)
  (c-quick-forward-sexp)
  (c-quick-recenter))

(defun c-quick-left-quick ()
  (interactive)
  (c-quick-backward-sexp)
  (c-quick-recenter))

(defun c-quick-up-quick ()
  (interactive)
  (re-search-backward "^\\s(" nil t)
  (recenter))

(defun c-quick-down-quick ()
  (interactive)
  (and
   (ignore-errors
     (save-excursion (forward-char) (re-search-forward "^\\s(" nil t)))
   (progn (forward-char) (re-search-forward "^\\s(" nil t))
   (backward-char))
  (recenter))

(defun c-quick-slide-down ()
  (if (not (bolp))
      (forward-char)
    (if (eobp) (c-quick-ding) (forward-line 1))))

(defun c-quick-slide-up ()
  (if (not (bolp))
      (backward-char)
    (if (bobp) (c-quick-ding) (forward-line -1))))

(defun c-quick-forward-char ()
  (if (eobp)
      (c-quick-ding)
    (forward-char)))

(defun c-quick-backward-char ()
  (if (bobp)
      (c-quick-ding)
    (backward-char)))

(defun c-quick-next-line ()
  (if (save-excursion (end-of-line) (eobp))
      (c-quick-ding)
    (next-line)))

(defun c-quick-previous-line ()
  (if (save-excursion (beginning-of-line) (bobp))
      (c-quick-ding)
    (previous-line)))

(defun c-quick-forward-sexp ()
  (interactive)
  (cond
   ((eobp) (c-quick-ding))
   ((c-quick-within-string (point)) (c-quick-forward-within-string))
   ((looking-at "\\s)") (c-quick-ding))
   ((looking-at "\\s.")
    (forward-char))
   ((looking-at "\\s-*\\s<")
    (let ((opoint (point)))
      (forward-line)
      (while (looking-at "\\s-*\\s<")
        (setq opoint (point))
        (forward-line))
      (goto-char (max opoint (save-excursion (beginning-of-line) (point))))))
   ((looking-at "\\s-") (while (looking-at "\\s-") (forward-char)))
   ((looking-at "\n")
    (let ((bol? (bolp)))
      (forward-char)
      (when bol?
        (while (and (bolp) (looking-at "\n"))
          (forward-char)))))
   (t (ignore-errors (forward-sexp)))))

(defun c-quick-backward-sexp ()
  (interactive)
  (let (comment-begin)
    (cond
     ((bobp) (c-quick-ding))
     ((c-quick-within-string (point)) (c-quick-backward-within-string))
     ((looking-back "\\s(") (c-quick-ding))
     ((looking-back "\\s.")
      (backward-char))
     ((and (looking-back "\\s>")
           (save-excursion (backward-char)
                           (setq comment-begin (c-quick-find-comment (point)))))
      (goto-char comment-begin)
      (while (and (looking-back "\\s>")
                  (save-excursion
                    (backward-char)
                    (setq comment-begin (c-quick-find-comment (point)))))
        (goto-char comment-begin)))
     ((looking-back "\\s-") (while (looking-back "\\s-") (backward-char)))
     ((looking-back "\\s<") (while (looking-back "\\s<") (backward-char)))
     ((looking-back "\n")
      (backward-char)
      (while (and (bolp) (looking-back "\n")
                      (save-excursion (backward-char) (bolp)))
            (backward-char)))
     (t (ignore-errors (backward-sexp))))))

(defun c-quick-within-string (pos)
  (save-excursion
    (goto-char pos)
    (let ((parsed (syntax-ppss)))
      (if (nth 3 parsed) (nth 8 parsed) nil))))

(defun c-quick-forward-within-string ()
  (let ((opoint (point))
        (parsed (syntax-ppss))
        beg end)
    (save-excursion
      (setq beg (nth 8 parsed))
      (goto-char beg)
      (forward-sexp)
      (setq end (point)))
    (if (>= (point) (1- end))
        (c-quick-ding)
      (forward-char))))

(defun c-quick-backward-within-string ()
  (let ((opoint (point))
        (parsed (syntax-ppss))
        beg end)
    (save-excursion
      (setq beg (nth 8 parsed))
      (goto-char beg)
      (forward-sexp)
      (setq end (point)))
    (if (<= (point) (1+ beg))
        (c-quick-ding)
      (backward-char))))

(defun c-quick-find-comment (eol)
  (save-excursion
    (goto-char eol)
    (let ((parsed (syntax-ppss)))
      (if (not (nth 4 parsed))
          nil
        (goto-char (nth 8 parsed))
        (while (looking-back "\\s-") (backward-char))
        (point)))))

(defun c-quick-show-info ()
  (when (c-quick-mode)
    (save-excursion
      (cond
       ((c-quick-within-string (point)) nil)
       ((looking-back "\\s)\\|\\s\"\\|\\sw\\|\\s_")
        (let ((opoint (point)))
          (c-quick-backward-sexp)
          (c-quick-count-lines opoint (point))))
       ((looking-at
         "\\(\\s-*\\)\\(\\sw\\|\\s_\\|\\s(\\|\\s<\\|\\s\"\\|\\s'\\)")
        (goto-char (match-end 1))
        (let ((opoint (point)))
          (c-quick-forward-sexp)
          (c-quick-count-lines opoint (point))))))))

(defun c-quick-count-lines (start end)
  (let ((lines (count-lines start end)))
    (if (= lines 1) (message "1 line.") (message "%s lines." lines))))

(defun c-quick-recenter ()
  (cond
   ((pos-visible-in-window-p (point)) nil)
   ((< (point) (window-start)) (recenter 0))
   (t (recenter -1))))

(defun c-quick-operate-on-region-or-sexp (op)
  (interactive)
  (funcall op
     (point)
     (if (region-active-p) (mark) (c-quick-forward-sexp) (point))))

(defun c-quick-copy-region ()
  (interactive)
  (c-quick-operate-on-region-or-sexp
   #'(lambda (beg end)
       (kill-ring-save beg end)
       (setq this-command 'kill-region))))

(defun c-quick-delete-region ()
  (interactive)
  (c-quick-operate-on-region-or-sexp #'delete-region))

(defun c-quick-indent-region ()
  (interactive)
  (c-quick-operate-on-region-or-sexp #'indent-region))

(defun c-quick-kill-region ()
  (interactive)
  (c-quick-operate-on-region-or-sexp #'kill-region))

(defun c-quick-buffer-visible (buffer)
  (let ((wins (window-list))
        (found nil))
    (dolist (win wins)
      (when (eq buffer (window-buffer win))
        (setq found t)
        )
      )
    found))

(defun c-quick-rotate-buffer ()
  (interactive)
  (let ((bufflist (buffer-list))
        (bufforig (current-buffer))
        (found nil)
        currbuff buffname)
    (while (and bufflist (not found))
      (setq currbuff (pop bufflist))
      (setq buffname (buffer-name currbuff))
      (cond
       ((eq bufforig currbuff) nil)
       ((minibufferp currbuff) nil)         ; minibuffer
       ((c-quick-buffer-visible currbuff) nil)
       ((string= buffname "*GNU Emacs*") nil)
       ((string= buffname "*Bookmark List*") nil)
       ((string= buffname "*Buffer List*") nil)
       ((string= buffname "*Messages*") nil)
       ((string= buffname "*Backtrace*") nil)
       ((string= buffname "*Help*") nil)
       ((string= buffname "*Completions*") nil)
       ((string= buffname "*Compile-Log*") nil)
       ((string= buffname "*Quail Completions*") nil)
       ((string= buffname "*Warnings*") nil)
       ((string= buffname "*Async-native-compile-log*") nil)
       ((string= buffname "*straight-byte-compilation*") nil)
       ((string= buffname "*straight-process*") nil)
       ;;((string= buffname "*xprint*") nil) ; *xprint*
       ;;((string-match "^[*]" buffname) nil) ; *scratch*, *Help* etc
       ((string-match "^[ ]" buffname) nil) ; work buffer
       (t (setq found currbuff))))
    (if (not found)
        (ding)
      (switch-to-buffer found)
      (bury-buffer found))))

(defun c-quick-jump-to-function (&optional func-name in-current-window)
  (interactive)
  (unless func-name (setq func-name (find-tag-default)))
  (let* (;;(func-name (find-tag-default))
         (interned (intern func-name))
         ;;(cb (current-buffer))
         (cw (selected-window))
         )
    (unless in-current-window (delete-other-windows))
    (when (and (symbol-function interned)
               (symbolp (symbol-function interned)))
      (setq interned (symbol-function interned))
      )
    (if (and (fboundp interned) (subrp (symbol-function interned)))
        (if (not in-current-window)
            (describe-function interned)
          (save-window-excursion
            (describe-function interned)
            )
          (switch-to-buffer "*Help*")
          )
      (cond
       ((condition-case nil
            (progn (find-function-do-it interned nil
                                        (if in-current-window
                                            'switch-to-buffer
                                          'switch-to-buffer-other-window
                                          )
                                        ) 'ok)
          (error nil)
          ) nil)
       ((condition-case nil
            (progn (find-function-do-it interned 'defvar
                                        (if in-current-window
                                            'switch-to-buffer
                                          'switch-to-buffer-other-window
                                          )
                                        ) 'ok)
          (error nil)
          ) nil)
       (t (error "%s not found" interned))
       )
      (select-window cw))))

(defun c-quick-other-window (count &optional all-frames)
  (interactive "p")
  (if (>= (length (window-list)) 2)
      (other-window count all-frames)
    (save-window-excursion
      (list-buffers nil)
      )
    (switch-to-buffer-other-window "*Buffer List*")
    )
  (message "%S" (current-buffer))
  )

(defun c-quick-exchange-point-and-mark (arg)
  (interactive "P")
  (let ((active (region-active-p)))
    (exchange-point-and-mark arg)
    (if (not active)
        (deactivate-mark))))

(defun c-quick-kill-current-buffer ()
  (interactive)
  (cond
   ((get-buffer-process (current-buffer))
    (c-quick-rotate-buffer)
    (ignore-errors
      (delete-window)))
   ((and
     (buffer-file-name (current-buffer))
     (buffer-modified-p (current-buffer)))
    (c-quick-rotate-buffer)
    (ignore-errors
      (delete-window)))
   (t
    (kill-buffer (current-buffer))
    (ignore-errors
      (delete-window)))))

(defun c-quick-kill-other-buffers ()
  (interactive)
  (let ((cb (current-buffer))
        (cw (selected-window))
        (wins (window-list)))
    (dolist (win wins)
      (if (equal win cw) nil
        (select-window win)
        (cond
         ((equal (current-buffer) cb) nil)
         ((get-buffer-process (current-buffer)) nil)
         ((and
           (buffer-file-name (current-buffer))
           (buffer-modified-p (current-buffer)))
          nil)
         (t (kill-buffer (current-buffer))))
        ;;(delete-window win)
        )
      )
    (select-window cw)
    (ignore-errors (delete-other-windows))
    )
  )

(defun c-quick-bookmark-set ()
  (interactive)
  (if (null (buffer-file-name)) (error "Not a file buffer.")
    (let ((name
           (format
            "%s:%s"
            (file-name-nondirectory (buffer-file-name))
            (format-time-string "%Y/%m/%d-%H:%M:%S" (current-time)))))
      (bookmark-set name)
      (message "Bookmark %s created." name)
      )
    ))

(defun c-quick-list-bookmarks ()
  (interactive)
  (list-bookmarks)
  (switch-to-buffer "*Bookmark List*")
  )

(defun c-quick-list-files ()
  (interactive)
  (let (win)
    (save-window-excursion
      (setq win (list-buffers t))))
  (switch-to-buffer "*Buffer List*")
  )

(defun c-quick-list-buffers ()
  (interactive)
  (let (win)
    (save-window-excursion
      (setq win (list-buffers nil))))
  (switch-to-buffer "*Buffer List*")
  )

(defun c-quick-rerun-eshell ()
  (interactive)
  (condition-case nil
      (kill-buffer "*eshell*")
    (error nil))
  (save-window-excursion
    (eshell)
    )
  (switch-to-buffer "*eshell*")
  )

(defun c-quick-run-file-in-eshell ()
  (interactive)
  (if (null buffer-file-name) (ding)
    (let* (
           (win (selected-window))
           (dir (file-name-directory buffer-file-name))
           (fname (file-name-nondirectory buffer-file-name))
           (fext (file-name-extension fname))
           ;;(is-eshell (or (equal fext "esh") (equal fext "eshell")))
           (is-csharp (equal fext "cs"))
           cmd
           )
      ;;(xdump fext)
      (if is-csharp ;;is-eshell
          ;;(setq cmd (format "cd \"%s\" && time . \"./%s\"" dir fname))
          (setq cmd (format "cd \"%s\" && start bash -c  \"dotnet-run './%s'; read -p '[Press enter to continue]'\"" dir fname))
        (setq cmd (format "cd \"%s\" && start bash -c  \"'./%s'; read -p '[Press enter to continue]'\"" dir fname))
        (ignore-errors
          (set-file-modes (buffer-file-name) (string-to-number "775" 8))
          )
        )
      (delete-other-windows)
      ;;(switch-to-buffer-other-window "*scratch*")
      ;;(lisp-interaction-mode)
      (ignore-errors (kill-buffer "*eshell*"))
        (save-window-excursion
          (eshell)
          )
        (switch-to-buffer-other-window "*eshell*")
        (goto-char (point-max))
        (insert cmd)
        (eshell-send-input)
        (select-window win)
      )
    )
  )

(defun c-quick-lookup-file-or-function ()
  (interactive)
  ;;(xclear)
  ;;(xdump load-path)
  (let* (;;(path (cons user-emacs-directory load-path))
         (feature-list (if (boundp '*get-feature-list*) *get-feature-list* nil))
         names
         name)
    ;;(xdump path)
    ;;(xdump (expand-file-name "init.el" user-emacs-directory))
    ;;(xdump (file-exists-p (expand-file-name "init.el" user-emacs-directory)))
    (when (file-exists-p (expand-file-name "init.el" user-emacs-directory))
      (push "init.el" feature-list))
    ;;(xdump feature-list)
    (setq names (copy-sequence feature-list))
    (dolist (p load-path)
      ;;(xdump p)
      ;;(xdump (directory-files p nil "[.]el$"))
      (dolist (el (ignore-errors (directory-files p nil "[.]el$")))
        (unless (member el names)
          (push el names)
          )
        )
      )
    (mapatoms
     #'(lambda (x)
         (when (fboundp x)
           (push (symbol-name x) names)
           )
         )
     )
    (setq names (sort names #'string-lessp))
    ;;(xdump names)
    (setq name
          (completing-read
           "File Name or Function Name (Completion): "
           names nil t))
    ;;(xdump name)
    (cond
     ((string-suffix-p ".el" name)
      ;;(ding)
      (catch :break
        ;;(xdump feature-list)
        ;;(xdump name)
        ;;(xdump (member name feature-list))
        (when (member name feature-list)
          (find-file (expand-file-name name user-emacs-directory))
          (message "%s" (expand-file-name name user-emacs-directory))
          (throw :break t)
          )
        (dolist (p load-path)
          (let ((els (ignore-errors (directory-files p nil "[.]el$"))))
            (when (member name els)
              (find-file (expand-file-name name p))
              (message "%s" (expand-file-name name p))
              (throw :break t)
              )
            )
          )
        )
      )
     (t
      (c-quick-jump-to-function name t)
      )
     )
    )
  )

(defvar c-quick-eshell-last-command-status nil)

(defun c-quick-eshell-exec (command)
  (eshell-print (format "(EXEC)> %s\n" command))
  (let* ((output (eshell-command-result command)))
    (setq output
          (replace-regexp-in-string "\\`[ \t\n\r]*\\|[ \t\n\r]*\\'" "" output))
    (setq output
          (replace-regexp-in-string "^" "  " output))
    (eshell-print (format "%s\n" output))
    (eshell-print (format "    ====> %d\n" eshell-last-command-status))
    (setq c-quick-eshell-last-command-status eshell-last-command-status)
    eshell-last-command-status
    )
  )

(defun c-quick-eshell-log (&rest rest)
  (let ((fmt (pop rest)))
    (eshell-print (apply #'format (concat "(LOG)> " fmt "\n") rest))
    nil))

(defun c-quick-eshell-status ()
  c-quick-eshell-last-command-status)

(defun c-quick-tab-next ()
  (interactive)
  (tab-next)
  (let ((lst nil))
    (dolist (win (window-list))
      (push (window-buffer win) lst)
      )
    (message "%S" (reverse lst))))

(add-hook 'post-command-hook
          (lambda ()
            (c-quick-set-mode *c-quick-mode-is-on*)))

(provide 'c-quick)
