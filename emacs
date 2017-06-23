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
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         ;tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
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

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; 保存前に自動でクリーンアップ
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


;;input japanese in emacs
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)
;(global-set-key "\C-z" 'toggle-input-method)

(global-unset-key "\C-\\")
