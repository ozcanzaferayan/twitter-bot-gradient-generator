brightnessValue=$(convert gradient.png -colorspace Gray -format "%[fx:quantumrange*image.mean]" info:)
if [ $brightnessValue \> 50000 ];
then 
  selectedTextColor="black"
else
  selectedTextColor="white"
fi;
echo "::set-env name=SELECTED_TEXT_COLOR::$selectedTextColor"