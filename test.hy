(import subprocess)


(setv sb (. (subprocess.run "ls ."
                            :shell True
                            :text True
                            :capture_output True)
            stdout))

(print sb)
