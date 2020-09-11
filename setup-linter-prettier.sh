npm i -D eslint prettier eslint-config-prettier
npx eslint --init
echo {} > .prettierrc

node <<End-of-message
const fs = require("fs");

const text = require("./.eslintrc");
let filename;
if (fs.existsSync("./.eslintrc.json")) {
  filename = "./.eslintrc.json";
} else if (fs.existsSync("./.eslintrc.js")) {
  filename = "./.eslintrc.js";
}

if (!text.extends) {
  text.extends = "prettier";
} else if (typeof text.extends === "string" && text.extends !== "prettier") {
  text.extends = [text.extends, "prettier"];
} else if (Array.isArray(text.extends) && !text.extends.includes("prettier")) {
  text.extends.push("prettier");
}

let newText = JSON.stringify(text);
if (filename === "./.eslintrc.js") {
  newText = "module.exports = ".concat(newText);
}

fs.writeFile(filename, newText, () => {
  console.log("foo");
});
End-of-message

