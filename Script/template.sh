TEMPLATE_DIR=~/Library/Developer/Xcode/Templates/File\ Templates

rm -rf "${TEMPLATE_DIR}"

if [ ! -d "${TEMPLATE_DIR}" ]; then
    mkdir -p "${TEMPLATE_DIR}"
fi

cp -r MTM.xctemplate/Custom\ Templates "${TEMPLATE_DIR}"