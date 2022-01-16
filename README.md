
# vim-textobj-string

vim-textobj-string is a Vim plugin to provide text objects (as and is by default) to select a string.

```
// as
 "abc\"def"
 <-------->

 'abc''def'
 <-------->

// is
 "abc\"def"
  <------>

 'abc''def'
  <------>
```

## Installation

This is an example of installation using vim-plug.

```
Plug 'rbtnn/vim-textobj-string'
Plug 'kana/vim-textobj-user'
```

## Requirements

* [kana/vim-textobj-user](https://github.com/kana/vim-textobj-user)

## Configuration
By default this motion is mapped to 's'. The key mapping can be overridden by adding a line similar to this to your vimrc:

```
let g:vim_textobj_string_mapping = 'x'
```

## License
Distributed under MIT License. See LICENSE.
