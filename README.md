# 🌈 silly-cat

A Zig toy project that prints colorful and animated text from stdin. Inspired by the `lolcat` tool, and built to explore how **ANSI escape codes** can be used to control color and animation in the terminal.

![YouTube Video](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)

> 🔗 [Watch the full walkthrough on YouTube](https://www.youtube.com/watch?v=-Ptmr6KhBQY)

---

## ✨ What It Does

`silly-cat` reads lines from stdin and prints them with a smooth rainbow gradient. With animation enabled, it produces a colorful shimmering wave as each line scrolls by.

This project is focused on **learning**:

- How to work with **terminal color** via ANSI escape codes
- How simple terminal **animation** works
- How to build a basic CLI tool in **Zig**

---

## 🔍 Highlights

- Reads text line by line from stdin
- Applies RGB gradient per character using sine wave math
- ANSI 24 bit color escape codes (`ESC[38;2;r;g;bm`)
- Optional animated color offset for visual motion
- Hides cursor while animating (`ESC[?25l`) and restores it

---

## 🧰 Technologies Used

- ANSI escape codes for styling terminal output
- Standard terminal with support for 24 bit (truecolor) output
- [Zig](https://ziglang.org/)

---

## 🚀 Getting Started

### 🔧 Build

```sh
zig build
```

### 📦 Example Usage

```sh
echo "Hello, world!" | zig run src/main.zig
fortune | zig run src/main.zig
fortune | cowsay | zig run src/main.zig
```

---

## 🌐 External Resources

- [ANSI Escape Code Reference](https://en.wikipedia.org/wiki/ANSI_escape_code)
- [Everything you never wanted to know about ANSI escape codes](https://notes.burke.libbey.me/ansi-escape-codes/)
- [ANSI Escape Codes GIST](https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797)
- [Zig language documentation](https://ziglang.org/documentation/master/)

---

## 🧪 Further Improvements

This project is kept minimal on purpose but feel free to build on it! Here are some things to try:

- ✅ Add **UTF-8** support (currently assumes ASCII text)
- ✅ Support **reading from files**, not just stdin
- 🔁 Add different **animation modes**
- 🎨 Let users provide a **custom color palette**
- 💾 Output to file with ANSI formatting for later viewing

---

## 🙌 Acknowledgments

Inspired by the `lolcat` [tool](https://github.com/busyloop/lolcat)
