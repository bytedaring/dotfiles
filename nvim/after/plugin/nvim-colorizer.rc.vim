lua << EOF

require 'colorizer'.setup ({
    'less';
    'css';
    'javascript';
    html = {
        mode = 'foreground';
    }
}, { mode = 'background'})

EOF
