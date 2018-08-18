(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "Chinese-GB18030")
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/cflow"))
;;(setenv "PATH" (concat (getenv "PATH") ":/Users/fliu/.emacs.d/cflow-1.4/src"))
(setenv "PATH" (concat (getenv "PATH") ":/opt/local/bin/"))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/"))
(when (eq system-type 'darwin) 
;;; exec path 
  (setq exec-path (append '("/opt/local/bin") 
                          exec-path)))
(when (eq system-type 'darwin) 
;;; exec path 
  (setq exec-path (append '("/usr/local/bin") 
                          exec-path)))
(load-file "~/.emacs.d/xcscope.el")
(require 'xcscope)
(setq-default cscope-minor-mode t)
(setq cscope-do-not-update-database t)
(if (locate-file "~/.emacs.d/.emacs.desktop.lock" '(HOME))
    (delete-file "~/.emacs.d/.emacs.desktop.lock"))
;;(require 'color-theme)
;;(global-highlight-changes-mode t)
;;(setq default-directory "~/mainline/aeros")
;;cedet
;(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
;(global-ede-mode 1)
;(semantic-load-enable-gaudy-code-helpers)
;(semantic-load-enable-code-helpers)
;;(global-set-key [(control tab)] 'semantic-ia-complete-symbol-menu)
;(global-srecode-minor-mode 1)
;;gnu global 
;(require 'semanticdb-global)
;;(semanticdb-enable-gnu-global-databases 'c-mode)
;;(semanticdb-enable-gnu-global-databases 'c++-mode)
(global-set-key [(control shift tab)]  'bs-cycle-previous)
(global-set-key [(control tab)]  'bs-cycle-next)


;; ecb
;(add-to-list 'load-path "~/.emacs.d/ecb-2.40")
;(require 'ecb)
;(require 'ecb-autoloads)

;;stack-trace-on-error is for ecb. If want to use ecb, pls enable it.
;;(setq stack-trace-on-error t)
;(global-set-key (kbd "<f5>") 'ecb-minor-mode)   ; ejb
;;ejb
;(global-set-key (kbd "C-<left>") 'windmove-left)   ;
;(global-set-key (kbd "C-<right>") 'windmove-right)  ;
;(global-set-key (kbd "C-<up>") 'windmove-up)     ; 
;(global-set-key (kbd "C-<down>") 'windmove-down)   ; 
;(global-set-key [(control f1)] 'ecb-hide-ecb-windows)  
;(global-set-key [(control f2)] 'ecb-show-ecb-windows)  
   
;(global-set-key (kbd "C-c 1") 'ecb-maximize-window-directories)  
;(global-set-key (kbd "C-c 2") 'ecb-maximize-window-sources)  
;(global-set-key (kbd "C-c 3") 'ecb-maximize-window-methods)  
;(global-set-key (kbd "C-c 4") 'ecb-maximize-window-history)  
;(global-set-key (kbd "C-c `") 'ecb-restore-default-window-sizes)
;;(global-set-key [f7] 'speedbar-get-focus)

(global-set-key (kbd "<f5>") 'cua-mode)
;(tool-bar-mode -1)
(delete-selection-mode t)
(global-hl-line-mode t)
(global-font-lock-mode t)
(setq-default transient-mark-mode t)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;(global-linum-mode t)
(setq x-select-enable-clipboard t)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq c-basic-offset 4)
(setq inhibit-startup-message t)
(setq frame-title-format "emacs@%b")
(which-function-mode t)
(setq column-number-mode t)
(setq line-number-mode t)
(setq mouse-avoidance-mode 'animate)
(setq uniquify-buffer-name-style 'forward)
(setq auto-image-file-mode t)
(setq-default kill-whole-line t)
;;(set-background-color "blue")
(global-auto-revert-mode 1)
(setq-default indent-tabs-mode nil)
(global-set-key [f9] 'undo)
(global-set-key (kbd "C-g") 'goto-line)
(global-set-key (kbd "C-t") 'delete-other-windows)
(global-set-key (kbd "C-.") 'delete-window)
;;(global-set-key (kbd "C-,") 'scroll-left)
;;(global-set-key (kbd "C-.") 'scroll-right)
(global-set-key [f2] 'beginning-of-buffer)
(global-set-key [f3] 'end-of-buffer)
(global-set-key [f4] 'other-window)
(fset 'yes-or-no-p 'y-or-n-p) 
(load "desktop")
(desktop-load-default)
(desktop-read)
(add-hook 'kill-emacs-hook
          '(lambda()(desktop-save-in-desktop-dir)))
(defun copy-word (&optional arg)
(interactive)
(setq onPoint (point))
(let (
( beg (progn (re-search-backward "[^a-zA-Z0-9_]" (line-beginning-position) 3 1)
(if (looking-at "[^a-zA-Z0-9_]") (+ (point) 1) (point) ) )
)
( end (progn (goto-char onPoint) (re-search-forward "[^a-zA-Z0-9_]" (line-end-position) 3 1)
(if (looking-back "[^a-zA-Z0-9_]") (- (point) 1) (point) ) )
))
(copy-region-as-kill beg end)
)
)
(global-set-key (kbd "M-g") 'copy-word)
(global-set-key [f8] 'insert-parentheses)

(require 'package)
;; Any add to list for package-archives (to add marmalade or melpa) goes here, e.g.:
(add-to-list 'package-archives 
    '("marmalade" .
      "https://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives
;;    '("melpa" .
;;      "http://melpa.org/packages/") t)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-1.4")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
(ac-config-default)
;;(add-to-list 'load-path "~/.emacs.d/elpa/isearch-symbol-at-point-20130728.1521")
;;(require 'isearch-symbol-at-point)
;;(global-set-key (kbd "M-m") 'isearch-symbol-at-point)

(require 'highlight-symbol)
(global-set-key [(control f6)] 'highlight-symbol-at-point)
(global-set-key [f6] 'highlight-symbol-next)
(global-set-key [(shift f6)] 'highlight-symbol-prev)
(global-set-key [(meta f6)] 'highlight-symbol-query-replace)

(load-file "~/.emacs.d/global-6.5.1/gtags.el")
(setenv "PATH" (concat "~/.emacs.d/global-6.5.1/gtags;" (getenv "PATH")))
(autoload 'gtags-mode "gtags" "" t)
(add-hook 'c-mode-hook
  '(lambda ()
        (gtags-mode 1)))
; Customization
;(setq gtags-suggested-key-mapping t)
(setq gtags-auto-update t)
(global-set-key (kbd "C-c f") 'gtags-find-tag)  
(global-set-key (kbd "C-c p") 'gtags-pop-stack)  
(global-set-key (kbd "C-c t") 'gtags-select-tag) 
(global-set-key (kbd "C-c r") 'gtags-find-rtag)

(setq-default semantic-symref-tool 'global)
(load-file "~/.emacs.d/rainbow-delimiters.el")
(require 'rainbow-delimiters)
;;To use only with specific modes
;;(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
;;(add-hook 'c-mode-hook 'rainbow-delimiters-mode)
;;To enable in all programming-related modes (Emacs 24+)
;;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;;To use Emacs-wide
(global-rainbow-delimiters-mode t)
(add-hook 'c-mode-hook 'hs-minor-mode)
(global-set-key (kbd "C-c g") 'hs-toggle-hiding)

(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
    (?` ?` _ "''")
    (?\( ?  _ " )")
    (?\[ ?  _ " ]")
    (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)

;(load-file "~/.emacs.d/bm.el")
(add-to-list 'load-path "~/.emacs.d/elpa/bm-1.53")
(require 'bm)
(setq bm-highlight-style 'bm-highlight-only-fringe)
(global-set-key (kbd "<C-f7>") 'bm-toggle)
(global-set-key (kbd "<f7>")   'bm-next)
(global-set-key (kbd "<S-f7>") 'bm-previous)
;;If you would like the markers on the right fringe instead of the left, add the following line:
;;(setq bm-marker 'bm-marker-right)
;;If you would like to cycle bookmark in LIFO order, add the following line:
;;(setq bm-in-lifo-order t)
;;If you would like to cycle through bookmarks in all open buffers, add the following line:
(setq bm-cycle-all-buffers t)
;;If you would like to remove bookmark after jump to it by bm-next or bm-previous:
;;(setq temporary-bookmark-p t)
;;or if you want use this feature in your library:
;;(bm-bookmark-add nil nil t)
