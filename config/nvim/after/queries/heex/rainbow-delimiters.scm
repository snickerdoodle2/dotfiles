(tag
  (start_tag
    "<" @delimiter
    (tag_name) @delimiter
    ">" @delimiter)
  (end_tag
    "</" @delimiter
    (tag_name) @delimiter
    ">" @delimiter @sentinel)) @container

  (self_closing_tag
    "<" @delimiter
    (tag_name) @delimiter
    "/>" @delimiter @sentinel) @container

((start_tag
    "<" @delimiter
    (tag_name) @delimiter @_tag_name
    ">" @delimiter @sentinel)
  (#any-of? @_tag_name
   "area"
   "base"
   "br"
   "col"
   "embed"
   "hr"
   "img"
   "input"
   "link"
   "meta"
   "param"
   "source"
   "track"
   "wbr")
) @container

; TODO: add style/script tags
; (style_element
;   (start_tag
;     "<" @delimiter
;     (tag_name) @delimiter
;     ">" @delimiter) @tag_name_start (
;   (element (self_closing_tag) @delimiter)*
;   (end_tag
;     "</" @delimiter
;     (tag_name) @delimiter
;     ">" @delimiter @sentinel)) @container

; (script_element
;   (start_tag
;     "<" @delimiter
;     (tag_name) @delimiter
;     ">" @delimiter)
;   (end_tag
;     "</" @delimiter
;     (tag_name) @delimiter
;     ">" @delimiter @sentinel)) @container
