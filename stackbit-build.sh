#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e789f9539546500149f40f2/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e789f9539546500149f40f2
curl -s -X POST https://api.stackbit.com/project/5e789f9539546500149f40f2/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e789f9539546500149f40f2/webhook/build/publish > /dev/null
