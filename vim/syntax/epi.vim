syn region   cBlock          transparent start='{' end='}'  contains=ALL
syn match    cBlockError     display "[;]"
syn match    cErrorInBlock      contained "\(.\+\n\)\{5,}"
