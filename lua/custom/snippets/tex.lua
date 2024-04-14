-- adapted from https://eavesdropper.dev/files/luasnip/ultisnips-to-luasnip/

-- env creator snippet
s(
  'beg',
  fmt(
    [[
    \begin{<>}
    <>
    \end{<>}]],
    { i(1), i(0), rep(1) }, -- repeat node 1
    { delimiters = '<>' }
  )
)

-- sub super scripts
s(
  { trig = '(%a)(%d)', regTrig = true, name = 'auto subscript', dscr = 'hi' },
  fmt([[<>_<>]], { f(function(_, snip)
    return snip.captures[1]
  end), f(function(_, snip)
    return snip.captures[2]
  end) }, { delimiters = '<>' }),
  { condition = math }
)
s(
  { trig = '(%a)_(%d%d)', regTrig = true, name = 'auto subscript 2', dscr = 'auto subscript for 2+ digits' },
  fmt([[<>_{<>}]], { f(function(_, snip)
    return snip.captures[1]
  end), f(function(_, snip)
    return snip.captures[2]
  end) }, { delimiters = '<>' }),
  { condition = math }
)

-- dynamic matrix
local mat = function(args, snip)
  local rows = tonumber(snip.captures[2])
  local cols = tonumber(snip.captures[3])
  local nodes = {}
  local ins_indx = 1
  for j = 1, rows do
    table.insert(nodes, r(ins_indx, tostring(j) .. 'x1', i(1)))
    ins_indx = ins_indx + 1
    for k = 2, cols do
      table.insert(nodes, t ' & ')
      table.insert(nodes, r(ins_indx, tostring(j) .. 'x' .. tostring(k), i(1)))
      ins_indx = ins_indx + 1
    end
    table.insert(nodes, t { '\\\\', '' })
  end
  return sn(nil, nodes)
end

-- full snippet
s(
  { trig = '([bBpvV])mat(%d+)x(%d+)([ar])', regTrig = true, name = 'matrix', dscr = 'matrix trigger lets go' },
  fmt(
    [[
    \begin{<>}<>
    <>
    \end{<>}]],
    {
      f(function(_, snip)
        return snip.captures[1] .. 'matrix'
      end),
      f(function(_, snip) -- augments
        if snip.captures[4] == 'a' then
          out = string.rep('c', tonumber(snip.captures[3]) - 1)
          return '[' .. out .. '|c]'
        end
        return ''
      end),
      d(1, mat),
      f(function(_, snip)
        return snip.captures[1] .. 'matrix'
      end),
    },
    { delimiters = '<>' }
  )
)
