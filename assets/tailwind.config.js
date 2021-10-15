/**
 * https://github.com/tailwindlabs/tailwindcss/discussions/1077#discussioncomment-528222
 *
 * @type {import("@types/tailwindcss/tailwind-config").TailwindConfig }
 */
module.exports = {
  mode: "jit",
  purge: ["./js/**/*.js", "../lib/*/**/*.*ex"],
  darkMode: "class",
  variants: {
    extend: {},
  },
  plugins: [],
};
