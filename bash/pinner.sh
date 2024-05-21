jq --compact-output '.manifest[]' $1 | while read i; do
    video=$(jq --raw-output '.video' <<<$i)
    data=$(jq --raw-output '.data' <<<$i)
    small=$(jq --raw-output '.images.small' <<<$i)
    medium=$(jq --raw-output '.images.medium' <<<$i)
    large=$(jq --raw-output '.images.large' <<<$i)
    
    ipfs pin add $video
    ipfs pin add $data
    ipfs pin add $small
    ipfs pin add $medium
    ipfs pin add $large

    echo "Finished pinning"

done
