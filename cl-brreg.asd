(asdf:defsystem #:cl-brreg
  :description "A simple Common Lisp interface to the Brønnøysund register of norwegian Corporations."
  :author "Tor Henrik Hanken <torhenrik@gmail.com>"
  :license "MIT"
  :depends-on (#:cl-ppcre
               #:drakma
               #:yason
               )
  :serial t
  :components ((:file "src/package")
               (:file "src/brreg")))


