# Pull Request in one command
# Example:
#     mpr "Added sp"
function mpr() {
    git commit -a
    branch=`git rev-parse --abbrev-ref HEAD`
    git push -u origin $branch
    hub pull-request -b $1
}
