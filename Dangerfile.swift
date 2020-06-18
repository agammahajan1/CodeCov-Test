import Danger
import Foundation

let danger = Danger()
let github = danger.github

if danger.git.createdFiles.count + danger.git.modifiedFiles.count - danger.git.deletedFiles.count > 300 {
    warn("Big PR, try to keep changes smaller if you can")
}

// Make it more obvious that a PR is a work in progress and shouldn't be merged yet

if danger.github.pullRequest.title.lowercased().contains("wip") {
    warn("PR is classed as Work in Progress")
}

if danger.github.pullRequest.milestone == nil {
    warn("Add appropriate milestone to this PR")
}
