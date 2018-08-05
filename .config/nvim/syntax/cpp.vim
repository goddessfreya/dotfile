syn match cCustomDot "\." contained
syn match cCustomPtr "->" contained
syn match cCustomMemVar "\(\.\|->\)\h\w*" contains=cCustomDot,cCustomPtr,cCustomFunc
