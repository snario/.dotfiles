function itree () {
    tree --prune -I $(cat .gitignore | egrep -v "^#.*$|^[[:space:]]*$" | tr "\\n" "|")
}
