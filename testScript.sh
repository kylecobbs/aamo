####################################
#                                  #
#        Script to implement	   #
#        Android Obfuscator        #
#                                  #
#        Author: ngurus            #
#                                  #
####################################
#!/bin/ksh


HOME_DIR="/home/ngurus/Codes/";
dir_loc=$HOME_DIR"Malware/";
dir_Obfus=$HOME_DIR"CS297/aamo/obfuscators/";
obfuscator=$dir_Obfus"obfuscators.py";

<<"Commenting"
echo $HOME_DIR;
echo $dir_loc;
echo $dir_Obfus;
echo $obfuscator;
Commenting

rm obfuscators/obfuscators.log
cd $dir_loc;
rm malwareFile.txt;
ls -r *.apk >>malwareFile.txt;
lineCount=`cat malwareFile.txt | wc -l`;
echo "Total files: $lineCount";
cat malwareFile.txt | while read line
do
	python $obfuscator $dir_loc$line
	sleep 30
	echo $dir_loc$line
	#apktool b --force-all $dir_loc${line::-4}
	#sleep 30
	echo $obfuscator $dir_loc$line
	echo "Done with $obfuscator $dir_loc$line" >> output.log
done

exit 0;