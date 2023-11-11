
if exists('g:loaded_textobj_string')
    finish
endif

call textobj#user#plugin('string', {
    \ '-' : {
    \        '*sfile*': expand('<sfile>:p'),
    \        'select-a': 'a' .. get(g:, 'vim_textobj_string_mapping', 's'),
    \        'select-a-function': 's:select_string_a',
    \        'select-i': 'i' .. get(g:, 'vim_textobj_string_mapping', 's'),
    \        'select-i-function': 's:select_string_i'
    \   }
    \ })

function! s:select_string_a()
    let line = getline('.')
    let xs = split(line, '\zs')
    let pairs = textobj#string#parse(xs)
    let col = col('.')

    for pair in pairs
        if (col < pair.begin_col) || ((pair.begin_col <= col) && (col <= pair.end_col))
            return ['v', [0, line('.'), pair.begin_col, 0], [0, line('.'), pair.end_col, 0]]
        endif
    endfor

    return 0
endfunction

function! s:select_string_i()
    let xs = s:select_string_a()
    if type(xs) == type([])
        let line = getline('.')
        let v = xs[0]
        let head_pos = xs[1]
        let head_pos[2] += line[head_pos[2] - 1] == '@' ? 2 : 1
        let tail_pos = xs[2]
        let tail_pos[2] -= 1
        return [v, head_pos, tail_pos]
    else
        return 0
    endif
endfunction

let g:loaded_textobj_string = 1
