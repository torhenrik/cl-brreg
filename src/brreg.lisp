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
   (gethash feature (get-jsonhash orgnummer))))

(defun get-org-name (orgnummer)
  (get-orgfeature "navn" orgnummer))
  
(defun get-org-address (orgnummer)
  (ignore-errors
   (gethash "adresse" (get-orgfeature "forretningsadresse" orgnummer))))

(defun get-org-postnummer (orgnummer)
  (ignore-errors
   (gethash "postnummer" (get-orgfeature "forretningsadresse" orgnummer))))

(defun get-org-poststed (orgnummer)
  (ignore-errors
   (gethash "poststed" (get-orgfeature "forretningsadresse" orgnummer))))

