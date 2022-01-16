
function! textobj#string#parse(xs) abort
	let pairs = []
	let last = len(a:xs) - 1
	let j = 0
	while j <= last
		let found = v:false
		let k = j + 1
		if '"' == a:xs[j]
			while k <= last
				if '\' == a:xs[k]
					let k += 2
				elseif '"' == a:xs[k]
					let found = v:true
					break
				else
					let k += 1
				endif
			endwhile
		elseif "'" == a:xs[j]
			while k <= last
				if ("'" == a:xs[k]) && ("'" == get(a:xs, k + 1, ''))
					let k += 2
				elseif "'" == a:xs[k]
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

