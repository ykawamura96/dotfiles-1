(setq inhibit-startup-message t)
(prefer-coding-system 'utf-8)

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-o" 'other-window)
(setq x-select-enable-clipboard t)

(setq-default tab-width 4 indent-tabs-mode nil)

(add-to-list 'load-path "/opt/ros/indigo/share/emacs/site-lisp")
;; or whatever your install space is + "/share/emacs/site-lisp"
(require 'rosemacs-config)
(put 'upcase-region 'disabled nil)


(require 'whitespace)
(setq whitespace-style '(face           ; face¤Ç²Ä»ë²½
                         trailing       ; ¹ÔËö
                         ;tabs           ; ¥¿¥Ö
                         spaces         ; ¥¹¥Ú¡¼¥¹
                         empty          ; ÀèÆ¬/ËöÈø¤Î¶õ¹Ô
                         space-mark     ; É½¼¨¤Î¥Þ¥Ã¥Ô¥ó¥°
                         tab-mark
                         ))

(setq whitespace-display-mappings
      ;'((space-mark ?\u3000 [?\u25a1]) ;draw rectangle in space
      ;  (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t]))) ;make arrow in tab

      ;; WARNING: the mapping above has a problem.
      ;; When a TAB occupies exactly one column, it will display the
      ;; character ?\xBB at that column followed by a TAB which goes to
      ;; the next TAB column.
      ;; If this is a problem for you, please, comment the line below.
)

;; ¥¹¥Ú¡¼¥¹¤ÏÁ´³Ñ¤Î¤ß¤ò²Ä»ë²½
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; ÊÝÂ¸Á°¤Ë¼«Æ°¤Ç¥¯¥ê¡¼¥ó¥¢¥Ã¥×
(setq whitespace-action '(auto-cleanup))

(global-whitespace-mode 1)

(setq background-color "white")
(set-background-color background-color)
(setq whitespace-bg-color "white") ;;white space color

;;change color of each whitespace
(set-face-attribute 'whitespace-trailing nil ;show trailing space
                    :background whitespace-bg-color
                    :underline nil)
(set-face-attribute 'whitespace-space nil ;show zenkaku space
                    :background "red" ;whitespace-bg-color
                    :underline nil)
(set-face-attribute 'whitespace-empty nil ;show ??
                    :background whitespace-bg-color
		    :underline nil)
(set-face-attribute 'whitespace-tab nil ;show tab
                    :background background-color
                    :underline nil)

(show-paren-mode t)

;;input japanese in emacs
;; (require 'mozc)
;; (set-language-environment "Japanese")
;; (setq default-input-method "japanese-mozc")
;; (global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)
;; ;(global-set-key "\C-z" 'toggle-input-method)

(global-unset-key "\C-\\")

;; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; auto-complete
;; DO NOT FORGET M-x package-list-packages
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'nxml-mode) ; nxml-modeを追加
(setq ac-delay 0.05) ; auto-completeまでの時間
(setq ac-auto-show-menu 0.1) ; メニューが表示されるまで
(setq ac-use-fuzzy t) ; 曖昧マッチを有効に

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; 行数を表示する
(global-linum-mode t)

;; 列数を表示する
(column-number-mode t)

;; スクロールは１行ごとに
(setq scroll-conservatively 1)

;; スクロール開始のマージンの行数
(setq scroll-margin 5)

;; active でない window の空 cursor を出さない
(setq cursor-in-non-selected-windows nil)

;; 現在の関数名の表示
(which-function-mode 1)

;; add extention to major mode
(add-to-list 'auto-mode-alist '("\\.launch\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.*bashrc.*\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\emacs\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.emacs\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
