TOPIC_BRANCH=$1
do_conf() {
	# Define the filename
	FILENAME="merge.conf"

# Create the file with the specified content
cat <<EOF > "$FILENAME"
baseline git@github.com:qualcomm-linux/kernel.git       qcom-next 
$TOPIC_BRANCH git@github.com:qualcomm-linux/kernel-topics.git       $TOPIC_BRANCH
EOF

	echo "File '$FILENAME' created successfully."
}

do_conf

cd kernel
../automerge/ci-merge -f ../merge.conf -t head -n
