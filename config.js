const activate = (oni) => {
  oni.input.bind("<f9>", "markdown.togglePreview")
}

module.exports = {
    activate,

	"oni.hideMenu": true,
	"oni.loadInitVim": "/Users/matipan/.config/oni/init.vim",
	"oni.useDefaultConfig": false,

	"ui.colorscheme": "deep-space",
	"ui.fontFamily": "'SauceCodePro Nerd Font'",

	"editor.textMateHighlighting.enabled": false,
	"editor.typingPrediction": false,
	"editor.fontFamily": "SauceCodeProNerdFontComplete-Regular",
	"editor.fontSize": "12px",
	"editor.fontLigatures": false,
	"editor.renderer": "webgl",

	// "language.go.languageServer.rootFiles": [".git"],
	// "language.go.languageServer.command": "go-langserver",
	// "language.go.languageServer.arguments": ["--freeosmemory", "false"],

	"tabs.mode": "buffers",
	"sidebar.default.open": false,
	"workspace.autoDetectWorkspace": "always",
	"autoClosingPairs.enabled": false,
	"commandline.mode": false,
	"wildmenu.mode": false,
	"learning.enabled": false,
	"achievements.enabled": false,
	"experimental.markdownPreview.enabled": true
}
