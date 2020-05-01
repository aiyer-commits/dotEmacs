
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)
(unless (package-installed-p 'evil)
  (package-install 'evil))
(unless (package-installed-p 'org)
  (package-install 'org))
(unless (package-installed-p 'flymake)
  (package-install 'flymake))
(unless (package-installed-p 'magit)
  (package-install 'magit))
(require 'wakatime-mode)    
(require 'org)
(require 'evil)
(evil-mode 1)
(flymake-mode 1)
(global-auto-revert-mode 1)
(desktop-save-mode 1)
(setq wakatime-api-key "92dfdbf5-5f3e-40e6-9090-e98bee1b3e38")
(setq wakatime-cli-path "/usr/local/bin/wakatime")

(global-wakatime-mode)
(dumb-jump-mode)
(remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)
(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)
(global-set-key (kbd "C-x g") 'magit-status)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))

  (add-to-list 'load-path "~")
  
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'auto-mode-alist '("components\\/.\.*\\.js\\'" . rjsx-mode))
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.2")
(progn
  (global-ede-mode t)
  (show-paren-mode 1)
  (setq show-paren-style 'expression)
  (semantic-mode 1)
  (blink-cursor-mode 1)
  (global-display-line-numbers-mode)
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(go-mode org-gcal helm-git helm nnir-est jabber multi-term wakatime-mode dumb-jump org-outline-numbering evil auto-complete auto-complete-c-headers ess ess-smart-underscore org org-ac org-chef rjsx-mode magit ##)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
