/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html','./src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      fontFamily:{
        sans:['Poppins','sans-serif']
      },
      gridTemplateColumns:{
        '70/30':'70% 28%'
      },
      colors: {
        darkBlue: '#3674B5',    
        blue: '#578FCA', 
        lightBlue: '#A1E3F9',
        lighterBlue:'#D1F8EF'
      },
    },
  },
  plugins: [],
}

