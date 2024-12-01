const publishCmd = `
docker build -t $IMAGE_NAME:\${nextRelease.version} .
docker push --all-tags $IMAGE_NAME
`
import config from 'semantic-release-preconfigured-conventional-commits' with { type: "json" };
config.plugins.push(
    [
        "@semantic-release/exec",
        {
            "publishCmd": publishCmd,
        }
    ],
    "@semantic-release/github",
    "@semantic-release/git",
)
export default config
