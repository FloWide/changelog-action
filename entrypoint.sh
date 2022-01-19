#!/bin/sh -l

if [ -z "$FROM_TAG" ]; then
  from_tag=$(git tag --sort version:refname | tail -n 2 | head -n 1)
else
  from_tag=$FROM_TAG
fi

if [ -z "$TO_TAG" ]; then
  to_tag=$(git tag --sort version:refname | tail -n 1)
else
  to_tag=$TO_TAG
fi


echo "Generating changelog from commits between $from_tag and $to_tag"

changes="#### Changes (${to_tag}):\n"
changes="${changes}$(git log $from_tag...$to_tag --pretty=format:'- %s (%H)\n' --reverse | grep -v Merge )"

echo $changes

echo "::set-output name=changelog::$changes"

