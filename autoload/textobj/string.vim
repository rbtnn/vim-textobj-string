
function! textobj#string#parse(xs) abort
	let pairs = []
	let last = len(a:xs) - 1
	let j = 0
	while j <= last
		let found = v:false
		let k = j + 1
		if s:is_double(a:xs[j])
			while k <= last
				if s:is_backslash(a:xs[k])
					let k += 2
				elseif s:is_double(a:xs[k])
					let found = v:true
					break
				else
					let k += 1
				endif
			endwhile
		elseif s:is_single(a:xs[j])
			while k <= last
				if s:is_single(a:xs[k]) && s:is_single(get(a:xs, k + 1, ''))
					let k += 2
				elseif s:is_single(a:xs[k])
					let found = v:true
					break
				else
					let k += 1
				endif
			endwhile
		endif
		if found
			let pairs += [{
				\ 'begin_col' : len(join(a:xs[:j] ,'')),
				\ 'end_col' : len(join(a:xs[:k], '')),
				\ }]
			let j = k + 1
		else
			let j += 1
		endif
	endwhile
	return pairs
endfunction

function! s:is_backslash(x) abort
	return '/' == a:x
endfunction

function! s:is_single(x) abort
	return "'" == a:x
endfunction

function! s:is_double(x) abort
	return '"' == a:x
endfunction

