/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    // "./index.html",
    // "./src/**/*.{vue,js,ts,jsx,tsx}",
    "./resources/**/*.blade.php",
    "./resources/**/*.js",
    "./resources/**/*.vue",
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          500: '#4e82c2'
        },
        brand: {
          100: '#6B9AFF',
          200: '#507AF0',
          300: '#507AF0',
          400: '#3F60BD',
          500: '#3753A4',
          600: '#324B94',
          700: '#253669',
          800: '#1D2B53',
          900: '#121A33'
        }
      }
    },
    // fontFamily: {
    //   'nunito': ['Nunito', 'sans-serif']
    // }
  },
  plugins: [
    require('@tailwindcss/forms')
  ],
  darkMode: 'class' // ganti jadi media, dia otomatis
}
