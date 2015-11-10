;; erlang-mode related configs

(setq erlang-root-dir nil)

(defun custom-erlang-shell (local-shell-name
                            &optional cookie
                            &optional remsh-node)
  "Start an erlang shell.

`local-shell-name' is the fully qualified shell name in string
format.  The optional `cookie' string is the erlang cookie used
for connacting to remote nodes. The optional `remsh-node' string
is the fully qualified name of the remote node to connect."
  (let* ((cookie-str (if cookie
                         (concat " -setcookie " cookie)
                       ""))
         (remsh-str (if remsh-node
                        (concat " -remsh " remsh-node)
                      ""))
         (name-str (concat " -name " local-shell-name))
         (command (concat "erl"
                          name-str
                          " -env TERM vt100"
                          cookie-str
                          remsh-str)))
    (inferior-erlang command)))
