const defaultTheme = require('tailwindcss/defaultTheme');
const plugin = require('tailwindcss/plugin');

module.exports = {
    mode: 'jit',
    purge: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './vendor/laravel/jetstream/**/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
    ],

    theme: {
        boxShadow: {
            sm: '0 1px 2px 0 rgba(0, 0, 0, 0.05)',
            DEFAULT: '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)',
            md: '0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06)',
            lg: '0 10px 15px -3px rgba(0, 0, 0, 1), 0 4px 6px -2px rgba(0, 0, 0, 1)',
            xl: '0px -3px 28px rgba(12, 19, 46, 0.12)',
            '2xl': '0 25px 50px -12px rgba(0, 0, 0, 0.25)',
            '3xl': '0 35px 60px -15px rgba(0, 0, 0, 0.3)',
            inner: 'inset 0 2px 4px 0 rgba(0, 0, 0, 0.06)',
            none: 'none',
        },
        extend: {
            fontFamily: {
                sans: ['Barlow', ...defaultTheme.fontFamily.sans],
                heading: ['Poppins'],
                title:['Quicksand']
            },
            fontSize: {
              'min': '16px',
            },
            colors: {
                primary: {
                    light: '#CEE1FF',
                    DEFAULT: '#42044D',
                    dark: '#1C1246',
                    border: '#D5D5FF',
                    text: '#8375BF',
                    background:'#1A0033'
                },
                secondary: {
                    DEFAULT: '#FFA832',
                    dark: '#351900',
                    light: '#FB9300',
                    brown: '#A59384',
                },
                accent: {
                    DEFAULT: '#F8F0E7',
                    light:'#FEF0E2',
                    dark: '#EDD2B8',
                    grey:"#EFEFEF",
                    background:"#EBEBEF"
                },
                background: {
                    DEFAULT: '#FCFAF8',
                    dark: '#F5F5F8',
                    light:'#FBE8FE'
                },
                blue:{
                    default:'#F3F4FF',
                    dark:'#091370',
                    light:'#190033',
                    background:'#F7F7F9',
                    border:'#C4DBFF'
                },
                purple:{
                    default:'#42044D',
                    light:'#A16CAE',
                    dark:'#A062AA',
                    background:'#42034C'
                },
                transparent: 'transparent',
                grey:{
                    default:'#5B6984',
                    light:'#FFF4E4',
                    dark:'#C5944C'
                },
                indigo:{
                    default:'#80368C',
                    light:'#D688E2'
                }

            },
            spacing: {
                '0.75': '3px',
                body: 'calc(100vh - 72px)',
                'full-scroll': 'calc(100% + 2rem)',
                '26' : '104px'

            },
            minHeight: {
                body: 'calc(100vh - 72px)'
            },
            width: {
                '11': '95%',
                '1/7':'85%',
                '3/10':'30%'
              }
        },
    },

    variants: {
        extend: {
            opacity: ['disabled'],
        },
    },

    plugins: [
        require('@tailwindcss/forms'),
        require('@tailwindcss/typography'),
        require('@tailwindcss/line-clamp'),
        // Custom classes
        plugin(function({ addUtilities, theme }) {
            const newUtilities = {
                '[x-cloak]': {
                    'display': 'none !important',
                },
                '.btn-checkbox:checked + *': {
                    'color': theme('colors.white'),
                    'background-color': theme('colors.secondary'),
                },
                'h1, h2, h3, h4, h5, h6': {
                    'font-family': theme('fontFamily.heading')
                }
            };

            addUtilities(newUtilities)
        })
    ],
};
