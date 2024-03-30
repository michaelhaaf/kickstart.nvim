-- adapted from https://eavesdropper.dev/files/luasnip/ultisnips-to-luasnip/

-- format snippet
s(
  'snipf',
  fmt(
    [[ 
    <>({ trig='<>', name='<>', dscr='<>'},
    fmt(<>,
    { <> },
    { delimiters='<>' }
    )<>)<>,]],
    { c(1, { t 's', t 'autosnippet' }), i(2, 'trig'), i(3, 'trig'), i(4, 'dscr'), i(5, 'fmt'), i(6, 'inputs'), i(7, '<>'), i(8, 'opts'), i(0) },
    { delimiters = '<>' }
  )
)

-- text snippet with choice noides
s(
  'snipt',
  fmt(
    [[ 
    <>(<>, {t('<>')}<>
    <>)<>,]],
    { c(1, { t 's', t 'autosnippet' }), c(2, { i(nil, 'trig'), sn(nil, { t "{trig='", i(1), t "'}" }) }), i(3, 'text'), i(4, 'opts'), i(5), i(0) },
    { delimiters = '<>' }
  )
)

-- inline code
s(
  { trig = 'qw', name = 'inline code', dscr = 'inline code, ft escape' },
  fmt([[\mintinline{<>}<>]], { i(1, 'text'), c(2, { sn(nil, { t '{', i(1), t '}' }), sn(nil, { t '|', i(1), t '|' }) }) }, { delimiters = '<>' })
)
