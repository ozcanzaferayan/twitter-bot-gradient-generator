echo $SELECTED_GRADIENT_NAME
if [ -z "$SELECTED_GRADIENT_NAME" ]
then
  randColorIndex=$(( RANDOM % 382 ))
  selectedGradient=$(cat gradients.json |jq -r --arg randColorIndex "$randColorIndex" '.[$randColorIndex | tonumber]')
else
  selectedGradient=$(cat gradients.json | jq --arg gradient "$SELECTED_GRADIENT_NAME" '.[] | select(.name==$gradient)')
fi
echo $selectedGradient
gradientColorName=$(echo $selectedGradient |jq -r '.name')
echo "::set-env name=GRADIENT::$gradientColorName"
gradientColors=$(echo $selectedGradient |jq -r '.colors | join(" ")')
array=($gradientColors)
len=${#array[@]}
gradientPercentage=$(( 100/($len-1)))
css="background: linear-gradient(-135deg, "
selectedColors=""
gradientColors=""
for i in "${!array[@]}"; do
  selectedColors+="${array[$i]} "
  css+="${array[$i]} $(($i * $gradientPercentage))%"
  if [[ $i == 0 ]];
  then
    gradientColors+=" -size 1x1 xc:\"${array[$i]}\""
    css+=", "
  elif [[ $i == $(( $len - 1)) ]];
  then
    gradientColors+=" -size 1x100 gradient:\"${array[$i-1]}-${array[$i]}\" -size 1x1 xc:\"${array[$i]}\""
  else
    gradientColors+=" -size 1x100 gradient:\"${array[$i-1]}-${array[$i]}\""
    css+=", "
  fi
done
css+=");"
echo "$css"
echo "::set-env name=CSS::$css"
echo "Selected colors: $selectedColors"
urlEncodedColors=$(echo $selectedColors | sed "s/[[:space:]]/%20/g" | sed "s/#/%23/g")
echo "Success"
echo "::set-env name=URL_ENCODED_COLORS::$urlEncodedColors"
gradientColors="convert $gradientColors -append -scale 1280x720! -distort SRT 45 gradient.png"
echo $gradientColors
eval "$gradientColors"