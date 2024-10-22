# Search and replace:
## command structure

:%s@search@replace@gc
or
:%s/{old_symbol}/{new_symbol}/g

%s is search
g is all occurrences
c is confirmation for each occurrence

# Search and replace shortcuts
## custom shortcuts

\<leader\>

# Telescope tips:
:Telescope live_grep (or leader sg)
<C-q> send results to quickfix list
:copen accesses the quickfix list

# Get command window
q:

# Search for specific symbol:
* (when hovering over word)

# Code collapsing
## Basic commands
z is the key to collapse things
zc is to close a fold
zo is to open a fold

## Python
zp is to close all methods
zP is to open all methods that are folded

