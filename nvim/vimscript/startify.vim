let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_custom_header = [
            \'    ____                   _    ___         ',
            \'   / __ \____ _____  ____ | |  / (_)___ ___ ',
            \'  / /_/ / __ `/ __ \/ __ `/ | / / / __ `__ \`',
            \' / ____/ /_/ / /_/ / /_/ /| |/ / / / / / / /',
            \'/_/    \__,_/ .___/\__,_/ |___/_/_/ /_/ /_/ ',
            \'           /_/'
            \]

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Most Recent Files:']            },
          \ { 'type': 'dir',       'header': ['   Current Directory('. getcwd(). '):'] },
          \ { 'type': 'sessions',  'header': ['   Sessions:']       },
          \ ]
