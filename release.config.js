var publishCmd = `
IMAGE_NAME="danysk/docker-manjaro-texlive-ruby"
docker build -t "$IMAGE_NAME:\${nextRelease.version}"
docker push --all-tags "$IMAGE_NAME"
`
var exec = [
    "@semantic-release/exec",
    {
        "publishCmd": publishCmd,
    }
]
var config = require('semantic-release-preconfigured-conventional-commits');
config.plugins.push(
    exec,
    "@semantic-release/github",
    "@semantic-release/git",
)
module.exports = config
