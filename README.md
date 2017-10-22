# cl-brreg
A simple Common Lisp interface to the Brønnøysund register of norwegian corporations. 

Connects to the brreg api via http, parses the json result and returns desired field.

Usage:
* (get-org-name "974760673")
* (get-org-address "974760673")
* (get-org-postnummer "974760673")
* (get-org-poststed "974760673")
