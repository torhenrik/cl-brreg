(defpackage #:postnummer
  (:documentation
   "Package with functions to parse and query norwegian postnummer.")
  (:use #:cl #:cl-ppcre #:drakma #:yason)
  (:export #:get-org-name
           #:get-org-address
           #:get-org-postnummer
           #:get-org-poststed))
