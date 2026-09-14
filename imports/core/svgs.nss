// Basic Shapes 
$svg_sq24='<svg fill="none" viewBox="0 0 24 24"><path fill="#4cc2ff" d="M0 0h24v24H0z" /></svg>'
$svg_sq16='<svg fill="none" viewBox="0 0 24 24"><path fill="#4cc2ff" d="M4 4h16v16H4z" /></svg>'
$svg_sq12='<svg fill="none" viewBox="0 0 24 24"><path fill="#4cc2ff" d="M8 8h8v8H8z" /></svg>'

// Common Shapes
$svg_plus='<svg viewBox="0 0 24 24"><path fill="#4cc2ff" d="M10 14V24h4V14h10v-4H14V0h-4l-.04 10H0v4" /></svg>'
$svg_minus='<svg viewBox="0 0 24 24"><path fill="#4cc2ff" d="M24 14v-4H0v4" /></svg>'
$svg_gear='<svg fill="none" viewBox="0 0 24 24"><path fill="#4cc2ff"
d="M7.5 12a4.5 4.5 90 109 0 4.5 4.5 90 10-9 0m6.75 0a2.25 2.25 90 11-4.5 0 2.25 2.25 90 114.5 0m4.083-5.808l1.331-.422 1.566 2.71L19 10v4l2.23 1.52-1.566 2.71-2.405-.765-3.154 1.828-.54 2.461H10.44l-.539-2.46-3.155-1.828-2.404.764-1.566-2.71L5 14v-4L2.775 8.48l1.566-2.705 2.404.764L9.9 4.711l.239-1.097.3-1.364h3.127l.534 2.461 3.155 1.828zM9 0L7.936 3.136l-1.584.919L3 3 0 9l2 2v1.919L0 15l3 6 3-1 1.94.869L9 24h6l1.06-3.14 1.584-.92L21 21l3-6-2-2v-2l2-2-3-6-3.356 1.05-1.585-.919L15 0z" /></svg>'

// 3x Arrows (Scroll, Home etc) - Use transform="rotate(90)"... if adding left/right
$svg_arrows = '
<path style="fill:none;stroke:#4cc2ff;stroke-width:2" d="m5 10 7-7 7 7" />
<path style="fill:none;stroke:#ffffff;stroke-width:2" d="m19 15.5-7-7-7 7" />
<path style="fill:none;stroke:#4cc2ff;stroke-width:2" d="m19 21-7-7-7 7" />'

@scroll_top = '<svg viewBox="0 0 24 24">@svg_arrows</svg>'

@scroll_bottom = '<svg viewBox="0 0 24 24">
<g transform="rotate(180 12 12)">@svg_arrows</g></svg>'

// Eye - Show/Hide
$svg_off = '<path fill="#bb2233" d="M21 22a1 1 0 002-2L4 4A1 1 0 002 6L21 22" />'
$svg_eye = '<path fill="#fff0e6" d="M12 6.2c-4.6 0-8.6 3.2-9.7 7.6-.1.4.1.8.5.9s.8-.1.9-.6C4.6 10.3 8 7.7 12 7.7c3.9 0 7.3 2.7 8.3 6.4.1.4.5.7.9.6s.6-.5.6-.9c-1.1-4.4-5.1-7.6-9.7-7.6zm0 3.5c-2.2 0-4 1.8-4 4s1.8 4 4 4 4-1.8 4-4-1.8-4-4-4" />'

@show = '<svg viewBox="0 0 24 24">@svg_eye</svg>'

@hide = '<svg viewBox="0 0 24 24">@svg_eye @svg_off</svg>'
