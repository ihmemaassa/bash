#!/bin/sh

# UV-indeksi FMIn avoimesta datasta, sallittu max 20000 hakua/vuorokausi. Automaattimittaukset 1 min välein

URL="https://opendata.fmi.fi/wfs/fin?service=WFS&version=2.0.0&request=GetFeature&storedquery_id=fmi::observations::radiation::timevaluepair&parameters=UVB_U&fmisid=101004"
DATA="$(curl -s $URL | tac | grep -Pom 1 '(?<=\>)(.*)(?=\<)')"
INT="${DATA%.*}"

if [ $INT -eq 0 ]; then
  echo "<txt><span weight='Bold' fgcolor='Blue' bgcolor='Lightgray'> $DATA </span></txt>"
elif [ $INT -le 1 ]; then
  echo "<txt><span weight='Bold' fgcolor='Green' bgcolor='Lightgray'> $DATA </span></txt>"
elif [ $INT -le 2 ]; then 
  echo "<txt><span weight='Bold' fgcolor='Yellow'> $DATA </span></txt>"
elif [ $INT -le 3 ]; then
  echo "<txt><span weight='Bold' fgcolor='Orange'> $DATA </span></txt>"
else
  echo "<txt><span weight='Bold' fgcolor='Red'> $DATA </span></txt>"
fi

echo "<tool>UV-indeksi Helsingissä</tool>"

#fmisid-koodit UV-havaintoasemille, vaihda mieleinen paikka URLiin
# 100908 Parainen, Utö
# 101004 Helsinki, Kumpula
# 101104 Jokioinen, Ilmala
# 101339 Jyväskylä, lentoasema
# 101756 Sotkamo, Kuolaniemi
# 101932 Sodankylä, Tähtelä
