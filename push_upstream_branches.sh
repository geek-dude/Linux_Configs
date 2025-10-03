#!/usr/bin/env bash
# push_upstream_branches.sh
# Push all fast-forwardable upstream branches to origin
# Default: dry-run. Use -p to push for real.

set -euo pipefail

PUSH=false

# Parse command-line options
while getopts ":p" opt; do
    case $opt in
        p)
            PUSH=true
            ;;
        *)
            echo "Usage: $0 [-p]"
            echo "  -p   Actually push changes (default: dry-run)"
            exit 1
            ;;
    esac
done

echo "Fetching upstream..."
git fetch upstream

# Iterate over all upstream branches
for upstream_branch in $(git for-each-ref --format='%(refname:lstrip=3)' refs/remotes/upstream); do
    # Skip symbolic refs
    [[ "$upstream_branch" == "HEAD" ]] && continue

    upstream_full="refs/remotes/upstream/$upstream_branch"
    origin_full="refs/heads/$upstream_branch"

    # Check if branch exists in origin
    if git show-ref --verify --quiet "refs/remotes/origin/$upstream_branch"; then
        # Branch exists on origin

        # Check if upstream is ancestor of origin (no true divergence)
        if ! git merge-base --is-ancestor "$upstream_full" "refs/remotes/origin/$upstream_branch"; then
            echo "Branch '$upstream_branch' has diverged. Skipping."
            continue
        fi

        # Check if origin is ahead of upstream (origin has commits not in upstream)
        if ! git merge-base --is-ancestor "refs/remotes/origin/$upstream_branch" "$upstream_full"; then
            echo "Branch '$upstream_branch' has commits in origin not in upstream. Skipping."
            continue
        fi

        # Safe to push
        if [ "$PUSH" = true ]; then
            echo "Pushing upstream branch '$upstream_branch' to origin..."
            git push origin "$upstream_full:$origin_full"
        else
            echo "Would push upstream branch '$upstream_branch' to origin (dry-run)"
        fi

    else
        # Branch does not exist on origin yet
        if [ "$PUSH" = true ]; then
            echo "Pushing new upstream branch '$upstream_branch' to origin..."
            git push origin "$upstream_full:$origin_full"
        else
            echo "Would push new upstream branch '$upstream_branch' to origin (dry-run)"
        fi
    fi
done

echo "Done."
