#TODO
#-have this find each dat file and execute the extraction one by one
#-find and decrypt any and all lua files
#-add in to backup dat files before compiling

QAR = MGSV_QAR_Tool.exe
DEC = MGSV_Res_Dec.exe
QARFLAGS = -r
DECFLAGS = -e1
DICTIONARYURL = https://github.com/emoose/MGSV-QAR-Dictionary-Project.git

#got to make this simpler and deal with one file at a time.
extract: data1.dat chunk0.dat chunk1.dat chunk2.dat chunk3.dat chunk4.dat 0/00.dat 0/01.dat
	$(QAR) data1.dat $(QARFLAGS)
	$(QAR) chunk0.dat $(QARFLAGS)
	$(QAR) chunk1.dat $(QARFLAGS)
	$(QAR) chunk2.dat $(QARFLAGS)
	$(QAR) chunk3.dat $(QARFLAGS)
	$(QAR) chunk4.dat $(QARFLAGS)
	$(QAR) 0/00.dat $(QARFLAGS)
	$(QAR) 0/01.dat $(QARFLAGS)

#need to add smart backup system
#got to make this simpler and deal with one file at a time.
compile: data1.inf chunk0.inf chunk1.inf chunk2.inf chunk3.inf chunk4.inf 0/00.inf 0/01.inf
#	compile dat files
	$(QAR) data1.inf $(QARFLAGS)
	$(QAR) chunk0.inf $(QARFLAGS)
	$(QAR) chunk1.inf $(QARFLAGS)
	$(QAR) chunk2.inf $(QARFLAGS)
	$(QAR) chunk3.inf $(QARFLAGS)
	$(QAR) chunk4.inf $(QARFLAGS)
	$(QAR) 0/00.inf $(QARFLAGS)
	$(QAR) 0/01.inf $(QARFLAGS)

#need to get this working
decrypt:
	$(DEC) %< $(DECFLAGS)

#should work
dictionaryGIT:
	git pull $(DICTIONARYURL) master

#should work
dictionarySVN:
	subversion checkout $(DICTIONARYURL)

#delete EVARYTHING!
clean:
#	remove inf files
	del /Q data1.inf
	del /Q chunk0.inf
	del /Q chunk1.inf
	del /Q chunk2.inf
	del /Q chunk3.inf
	del /Q chunk4.inf
	del /Q 0\00.inf
	del /Q 0\01.inf
#	remove folders
	rd /S /Q data1
	rd /S /Q chunk0
	rd /S /Q chunk1
	rd /S /Q chunk2
	rd /S /Q chunk3
	rd /S /Q chunk4
	rd /S /Q 0\00
	rd /S /Q 0\01

#backup dat files
backup: data1.dat chunk0.dat chunk1.dat chunk2.dat chunk3.dat chunk4.dat 0/00.dat 0/01.dat
	move data1.dat data1.dat.bak
	move chunk0.dat chunk0.dat.bak
	move chunk1.dat chunk1.dat.bak
	move chunk2.dat chunk2.dat.bak
	move chunk3.dat chunk3.dat.bak
	move chunk4.dat chunk4.dat.bak
	move 0\00.dat 0\00.dat.bak
	move 0\01.dat 0\01.dat.bak

#restore dat files
restore: data1.dat.bak chunk0.dat.bak chunk1.dat.bak chunk2.dat.bak chunk3.dat.bak chunk4.dat.bak 0/00.dat.bak 0/01.dat.bak
	move data1.dat.bak data1.dat
	move chunk0.dat.bak chunk0.dat
	move chunk1.dat.bak chunk1.dat
	move chunk2.dat.bak chunk2.dat
	move chunk3.dat.bak chunk3.dat
	move chunk4.dat.bak chunk4.dat
	move 0\00.dat.bak 0\00.dat
	move 0\01.dat.bak 0\01.dat