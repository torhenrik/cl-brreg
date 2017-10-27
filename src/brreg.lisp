(in-package :brreg)

(push (cons "application" "json") drakma:*text-content-types*)


(defun get-jsonhash (orgnummer)
  (when (and (every #'digit-char-p orgnummer)
             (= (length orgnummer) 9))
    (multiple-value-bind (response status)
        (drakma:http-request
         (format nil "http://data.brreg.no/enhetsregisteret/enhet/~A.json"
                 orgnummer))
      (when (eql status 200)
        (yason:parse response)))))

(defun get-orgfeature (feature orgnummer)
  (ignore-errors
   (let ((hash (get-jsonhash orgnummer)))
     (if hash
         (gethash feature hash)
         (make-hash-table)))))

(defun get-org-name (orgnummer)
  (let ((navn (get-orgfeature "navn" orgnummer)))
    (when (stringp navn)
      navn)))

(defun get-org-address (orgnummer)
  (ignore-errors
   (gethash "adresse" (get-orgfeature "forretningsadresse" orgnummer))))

(defun get-org-postnummer (orgnummer)
  (ignore-errors
   (gethash "postnummer" (get-orgfeature "forretningsadresse" orgnummer))))

(defun get-org-poststed (orgnummer)
  (ignore-errors
   (gethash "poststed" (get-orgfeature "forretningsadresse" orgnummer))))

