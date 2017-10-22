(in-package :brreg)

(push (cons "application" "json") drakma:*text-content-types*)

(defun get-jsonhash (orgnummer)
  (when (and (every #'digit-char-p orgnummer)
             (= (length orgnummer) 9))
    (yason:parse (drakma:http-request
                  (format nil "http://data.brreg.no/enhetsregisteret/enhet/~A.json"
                          orgnummer)))))

(defun get-orgfeature (feature orgnummer)
  (ignore-errors
   (gethash feature (get-jsonhash orgnummer))))

(defun get-org-name (orgnummer)
  (get-orgfeature "navn" orgnummer))

(defun get-org-address (orgnummer)
  (gethash "adresse" (get-orgfeature "postadresse" orgnummer)))

(defun get-org-postnummer (orgnummer)
  (gethash "postnummer" (get-orgfeature "postadresse" orgnummer)))

(defun get-org-poststed (orgnummer)
  (gethash "poststed" (get-orgfeature "postadresse" orgnummer)))


