### Make Keywords Bold 
- this works for most languages.
- add this snippet under *settings.json*. remember to remove the parent braces.
- ```json
    {
        "editor.semanticTokenColorCustomizations": {
            "enabled": true,
            "rules": {
                "keyword": {
                    "bold": true
                }
            }
        },
        "editor.tokenColorCustomizations": {
            "textMateRules": [
                {
                    "scope": "keyword",
                    "settings": {
                        "fontStyle": "bold"
                    }
                }
            ]
        },
    }
```

