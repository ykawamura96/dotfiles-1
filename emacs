;; package archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; automatically install packages
;; If you cannot install some of packages below, use
;; (package-refresh-contents) or M-x package-refresh-contents
(defvar package-list
  '(mozc
    anzu
    auto-complete
    dockerfile-mode
    edit-server
    ;; fuzzy
    trr
    flycheck
    markdown-mode
    ;; flycheck-pos-tip
    ;; flycheck-popup-tip
    hl-todo
    yaml-mode
    ;; rainbow-delimiters
    ))

(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(setq inhibit-startup-message t)
(prefer-coding-system 'utf-8)

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-o" 'other-window)
(global-set-key (kbd "\C-x l") 'linum-mode)

;; enlarge or shrink window
(global-set-key (kbd "C-x C-<up>") 'enlarge-window)
(global-set-key (kbd "C-x C-<down>") 'shrink-window)
(global-set-key (kbd "C-x C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-x C-<left>") 'shrink-window-horizontally)

;; flycheck keybind
(global-set-key (kbd "C-c l") 'flycheck-list-errors)

(setq x-select-enable-clipboard t)

(setq-default tab-width 4 indent-tabs-mode nil)

(require 'subr-x) ;; this package requires Emacs 24.4 or newer
(add-to-list 'load-path (concat "/opt/ros/" (string-trim (shell-command-to-string "rosversion -d")) "/share/emacs/site-lisp"))
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
      nil
)

;; ¥¹¥Ú¡¼¥¹¤ÏÁ´³Ñ¤Î¤ß¤ò²Ä»ë²½
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; ÊÝÂ¸Á°¤Ë¼«Æ°¤Ç¥¯¥ê¡¼¥ó¥¢¥Ã¥×
(setq whitespace-action '(auto-cleanup))

;; If Emacs visualization become strange, do 'M-x global-whitespace-mode' to kill this function
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

;; auto-complete
;; DO NOT FORGET M-x package-list-packages
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'nxml-mode) ; nxml-modeを追加
;; (add-to-list 'ac-modes 'shell-mode) ; shell-modeを追加(eg. emacs-shell)
(add-to-list 'ac-modes 'dockerfile-mode)
(add-to-list 'ac-modes 'cmake-mode)
(add-to-list 'ac-modes 'dockerfile-mode)
(add-to-list 'ac-modes 'markdown-mode)
(setq ac-delay 0.05) ; auto-completeまでの時間
(setq ac-auto-show-menu 0.1) ; メニューが表示されるまで
(setq ac-use-fuzzy t) ; 曖昧マッチを有効に

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
;; If you cannot enable python-flake8, do the emacs command below:
;; 1. "C-u C-c ! x [Enter]" in python-mode. (You will be asked "Enable syntax checker")
;; 2. "python-flake8 [Enter]"
(add-hook 'python-mode-hook '(lambda () (flycheck-select-checker 'python-flake8)))
(setq flycheck-python-flake8-executable "flake8")

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
(require 'dockerfile-mode)
(setq auto-mode-alist
      (append '(
                ("CMakeLists\\.txt\\'" . cmake-mode)
                ("Dockerfile\\'" . dockerfile-mode)
                ("\\.*bashrc.*\\'" . shell-script-mode)
                ("\\.cfg\\'" . python-mode)
                ("\\.cu\\'" . c++-mode)
                ("\\emacs\\'" . lisp-mode)
                ("\\.emacs\\'" . lisp-mode)
                ("\\.h\\'" . c++-mode)
                ("\\.ino\\'" . c-mode)
                ("\\.md\\'" . markdown-mode)
                ("\\.launch\\'" . nxml-mode)
                ("\\.rosinstall\\'" . yaml-mode)
                ("\\.test\\'" . nxml-mode)
                ("\\.world\\'" . nxml-mode)
                ("\\.xml\\'" . nxml-mode)
                ("\\.ya?ml\\'" . yaml-mode)
                )
              auto-mode-alist))

;; For Team K. This style of indentation is NOT recommended!!
(add-hook 'lisp-mode-hook #'(lambda () (put 'if 'lisp-indent-function 1)))
;; WIP : for defmethod
;; (add-hook 'lisp-mode-hook #'(lambda () (put 'defmethod 'lisp-indent-function 2)))

;; For Python tab indentation 4 spaces
(add-hook 'python-mode-hook
  (lambda ()
    (setq indent-tabs-mode nil)
    (setq tab-width 4)
    (setq python-indent 4)))


;; highlight special keywords
(require 'hl-todo)
(global-hl-todo-mode)
;; ("HOLD" . "#d0bf8f")
;; ("TODO" . "#cc9393")
;; ("NEXT" . "#dca3a3")
;; ("THEM" . "#dc8cc3")
;; ("PROG" . "#7cb8bb")
;; ("OKAY" . "#7cb8bb")
;; ("DONT" . "#5f7f5f")
;; ("FAIL" . "#8c5353")
;; ("DONE" . "#afd8af")
;; ("NOTE"   . "#d0bf8f")
;; ("KLUDGE" . "#d0bf8f")
;; ("HACK"   . "#d0bf8f")
;; ("FIXME"  . "#cc9393")
;; ("XXX"    . "#cc9393")
;; ("XXXX"   . "#cc9393")
;; ("???" . "#cc9393")

;; ;; to highlight lisp parenthesis
;; (require 'rainbow-delimiters)
;; ;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; ;; color of parenthesis
;; (setq rainbow-delimiters-max-face-count 5)
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(rainbow-delimiters-depth-1-face ((t (:foreground "white"))))
;;  '(rainbow-delimiters-depth-2-face ((t (:foreground "blue"))))
;;  '(rainbow-delimiters-depth-3-face ((t (:foreground "yellow"))))
;;  '(rainbow-delimiters-depth-4-face ((t (:foreground "green"))))
;;  '(rainbow-delimiters-depth-5-face ((t (:foreground "magenta")))))


;; copy paste settings
(if (eq system-type 'darwin)
  (setq x-select-enable-clipboard t)
  (defun xsel-cut-function (text &optional push)
    (with-temp-buffer
      (insert text)
      (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
  (defun xsel-paste-function()
    (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
      (unless (string= (car kill-ring) xsel-output)
        xsel-output )))
  (setq interprogram-cut-function 'xsel-cut-function)
    (setq interprogram-paste-function 'xsel-paste-function))


;; Show counts of matching pattern while searcing
(require 'anzu)
(global-anzu-mode 1)
(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
  '(anzu-search-threshold 1000))

;; Set tags for euslisp. You can search for definition of funcitons.
;; [Before loading .emacs]
;; cd /tmp; etags $(rospack find euslisp)/jskeus/eus/lisp/l/*.l ## this line is written in bashrc
;; [After loading .emacs]
;; M-. (function name) ;; In emacs mini buffer
(if (file-exists-p "/tmp/TAGS")
  (visit-tags-table "/tmp"))
;; (setq tags-table-list '("/tmp"))

;; start emacs server to use emacs on google chrome
(when (locate-library "edit-server")
  (require 'edit-server)
  (defvar edit-server-new-frame nil)    ; 新しいフレームは開かない
  (edit-server-start))

;; turn off error sound for Ubuntu 18.04
(setq visible-bell t)

;; open emacs shell on current window (do not open new window) from Emacs 25.1
(add-to-list 'display-buffer-alist
     '("^\\*shell\\*$" . (display-buffer-same-window)))
