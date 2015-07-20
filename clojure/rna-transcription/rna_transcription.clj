(ns rna-transcription)
(use '[defun :only [defun]])

(defun to-rna
  "Convert a string from DNA to RNA"
  (["A"] "U")
  (["T"] "A")
  (["G"] "C")
  (["C"] "G")
  ([(strand :guard #(and (string? %) (== (count %)1)))](throw ( AssertionError. "Bad Char")))
  ([(strand :guard #(> (count %)1))]
   (str (to-rna (str(first strand)))
        (to-rna (apply str(rest strand)))
   )
  )
)
