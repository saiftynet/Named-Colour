#! /usr/env perl
use strict; use warnings;

my $colournames={};
while (<DATA>){
  $_=~/"Resene ([^\"]+)"\s(\d+)\s(\d+)\s(\d+)\s*\n/ && do {$colournames->{$1}=[$2, $3, $4] if $1 && ($2+$3+$4+5)};
}

while (1){
	print "Enter Hex Colour in form '#xxxxxx' or 'q' to quit \nInput :  ";
	my $hex=<STDIN>;
	chomp $hex;
	last if $hex=~/q/i;
	if ($hex=~/^#?[0-9a-f]{6}$/){
		my $rgb= [map {hex($_)} $hex=~/[0-9a-f]{2}/ig];;
		print "\n$hex is ", join("--",@$rgb),"\n";
		my $nearest=nearest($rgb);
		print "The nearest named colour is $nearest which is ", join("--",@{$colournames->{$nearest}}),"\n\n";
	}
	else{
		print "Not the format expected, try again or quit?\n\n"
	}
}

sub colourDistance{
	my ($in,$test)=@_;
	my $sum=0;
	my $rMean=($in->[0]+$test->[0])/2;
	my ($rDif,$gDif,$bDif)=map{$in->[$_]-$test->[$_]}(0..2);
	return int (10*sqrt (  (512+$rMean)*$rDif*$rDif/256 + 4*$gDif*$gDif + (767-$rMean)*$bDif*$bDif/256 ) );
}


sub RGB2HSL{ # in progress
        # from https://www.had2know.org/technology/hsl-rgb-color-converter.html
	my ($rgb)=@_;
	my @temp=sort(@$rgb)
	my ($M,$m)=($temp[2],$tem[0]);
	my $d = ($M - $m)/255;
	my $L = [($M + $m)]/512;
	my $S = $L>0? $d/(1 - abs(2*$L-1)): 0;

}

sub nearest{
	my $in=shift;
	my $colourFound="Abbey";
	for my $c (keys %$colournames){
		$colourFound= $c if (colourDistance($colournames->{$c},$in)<colourDistance($colournames->{$colourFound},$in));
	}
	return $colourFound

}

exit 0;

__DATA__
Derived from https://people.csail.mit.edu/jaffer/Color/resenecolours.txt
http://people.csail.mit.edu/jaffer/Color/Dictionaries

inspired by https://chir.ag/projects/name-that-color/#6195ED
"Resene RGB Values List"
"For further information refer to http://www.resene.co.nz"
"Copyright Resene Paints Ltd 2001"

"Permission to copy this software, to modify it, to redistribute it,"
"to distribute modified versions, and to use it for any purpose is"
"granted, subject to the following restrictions and understandings."

"1. Any text copy made of this dictionary must include this copyright"
"notice in full."

"2. Any redistribution in binary form must reproduce this copyright"
"notice in the documentation or other materials provided with the"
"distribution."

"3. Resene Paints Ltd makes no warranty or representation that this"
"dictionary is error-free, and is under no obligation to provide"
"any services, by way of maintenance, update, or otherwise."

"4. There shall be no use of the name of Resene or Resene Paints Ltd in"
"any advertising, promotional, or sales literature without prior"
"written consent in each case."

"5. These RGB colour formulations may not be used to the detriment of"
"Resene Paints Ltd."

"Colour Name"	"R"	"G"	"B"
"Resene Abbey"	76	79	86
"Resene Acadia"	27	20	4
"Resene Acapulco"	124	176	161
"Resene Acorn"	106	93	27
"Resene Aero Blue"	201	255	229
"Resene Affair"	113	70	147
"Resene Afghan Tan"	134	86	10
"Resene Akaroa"	212	196	168
"Resene Alabaster"	255	255	255
"Resene Albescent White"	245	233	211
"Resene Alert Tan"	155	71	3
"Resene Allports"	0	118	163
"Resene Almond Frost"	144	123	113
"Resene Alpine"	175	143	44
"Resene Alto"	219	219	219
"Resene Aluminium"	169	172	182
"Resene Amazon"	59	122	87
"Resene Americano"	135	117	110
"Resene Amethyst Smoke"	163	151	180
"Resene Amour"	249	234	243
"Resene Amulet"	123	159	128
"Resene Anakiwa"	157	229	255
"Resene Antique Brass"	112	74	7
"Resene Anzac"	224	182	70
"Resene Apache"	223	190	111
"Resene Apple"	79	168	61
"Resene Apple Blossom"	175	77	67
"Resene Apple Green"	226	243	236
"Resene Apricot"	235	147	115
"Resene Apricot White"	255	254	236
"Resene Aqua"	161	218	215
"Resene Aqua Haze"	237	245	245
"Resene Aqua Spring"	234	249	245
"Resene Aqua Squeeze"	232	245	242
"Resene Aquamarine"	1	75	67
"Resene Arapawa"	17	12	108
"Resene Armadillo"	67	62	55
"Resene Arrowtown"	148	135	113
"Resene Ash"	198	195	181
"Resene Ash Brown"	46	25	5
"Resene Asphalt"	19	10	6
"Resene Astra"	250	234	185
"Resene Astral"	50	125	160
"Resene Astronaut"	40	58	119
"Resene Astronaut Blue"	1	62	98
"Resene Athens Grey"	238	240	243
"Resene Aths Special"	236	235	206
"Resene Atlantis"	151	205	45
"Resene Atoll"	10	111	117
"Resene Atomic"	49	68	89
"Resene Au Chico"	151	96	93
"Resene Aubergine"	59	9	16
"Resene Australian Mint"	245	255	190
"Resene Avocado"	136	141	101
"Resene Axolotl"	78	102	73
"Resene Azalea"	247	200	218
"Resene Aztec"	13	28	25
"Resene Azure"	49	91	161
"Resene Bahama Blue"	2	99	149
"Resene Bahia"	165	203	12
"Resene Baja White"	255	248	209
"Resene Bali Hai"	133	159	175
"Resene Baltic Sea"	42	38	48
"Resene Bamboo"	218	99	4
"Resene Bandicoot"	133	132	112
"Resene Banjul"	19	10	6
"Resene Barberry"	222	215	23
"Resene Barley Corn"	166	139	91
"Resene Barley White"	255	244	206
"Resene Barossa"	68	1	45
"Resene Bastille"	41	33	48
"Resene Battleship Grey"	130	143	114
"Resene Bay Leaf"	125	169	141
"Resene Bay of Many"	39	58	129
"Resene Bazaar"	152	119	123
"Resene Bean  "	61	12	2
"Resene Beauty Bush"	238	193	190
"Resene Beeswax"	254	242	199
"Resene Bermuda"	125	216	198
"Resene Bermuda Grey"	107	139	162
"Resene Beryl Green"	222	229	192
"Resene Bianca"	252	251	243
"Resene Big Stone"	22	42	64
"Resene Bilbao"	50	124	20
"Resene Biloba Flower"	178	161	234
"Resene Birch"	55	48	33
"Resene Bird Flower"	212	205	22
"Resene Biscay"	27	49	98
"Resene Bismark"	73	113	131
"Resene Bison Hide"	193	183	164
"Resene Bitter"	134	137	116
"Resene Bitter Lemon"	202	224	13
"Resene Bizarre"	238	222	218
"Resene Black Bean"	8	25	16
"Resene Black Forest"	11	19	4
"Resene Black Haze"	246	247	247
"Resene Black Magic"	37	23	6
"Resene Black Marlin"	62	44	28
"Resene Black Pearl"	4	19	34
"Resene Black Pepper"	14	14	24
"Resene Black Rock"	13	3	50
"Resene Black Rose"	103	3	45
"Resene Black Russian"	10	0	28
"Resene Black Squeeze"	242	250	250
"Resene Black White"	255	254	246
"Resene Blackberry"	77	1	53
"Resene Blackcurrant"	50	41	58
"Resene Blackwood"	38	17	5
"Resene Blanc"	245	233	211
"Resene Bleach White"	254	243	216
"Resene Bleached Cedar"	44	33	51
"Resene Blossom"	220	180	188
"Resene Blue Bark"	4	19	34
"Resene Blue Bayoux"	73	102	121
"Resene Blue Bell"	34	8	120
"Resene Blue Chalk"	241	233	255
"Resene Blue Charcoal"	1	13	26
"Resene Blue Chill"	12	137	144
"Resene Blue Diamond"	56	4	116
"Resene Blue Dianne"	32	72	82
"Resene Blue Gem"	44	14	140
"Resene Blue Haze"	191	190	216
"Resene Blue Lagoon"	1	121	135
"Resene Blue Marguerite"	118	102	198
"Resene Blue Romance"	210	246	222
"Resene Blue Smoke"	116	136	129
"Resene Blue Stone"	1	97	98
"Resene Blue Whale"	4	46	76
"Resene Blue Zodiac"	19	38	77
"Resene Blumine"	24	88	122
"Resene Blush"	180	70	104
"Resene Bokara Grey"	28	18	8
"Resene Bombay"	175	177	184
"Resene Bon Jour"	229	224	225
"Resene Bondi Blue"	2	71	142
"Resene Bone"	228	209	192
"Resene Bordeaux"	92	1	32
"Resene Bossanova"	78	42	90
"Resene Boston Blue"	59	145	180
"Resene Botticelli"	199	221	229
"Resene Bottle Green"	9	54	36
"Resene Boulder"	122	122	122
"Resene Bouquet"	174	128	158
"Resene Bourbon"	186	111	30
"Resene Bracken"	74	42	4
"Resene Brandy"	222	193	150
"Resene Brandy Punch"	205	132	41
"Resene Brandy Rose"	187	137	131
"Resene Brazil"	136	98	33
"Resene Breaker Bay"	93	161	159
"Resene Bridal Heath"	255	250	244
"Resene Bridesmaid"	254	240	236
"Resene Bright Grey"	60	65	81
"Resene Bright Red"	177	0	0
"Resene Bright Sun"	254	211	60
"Resene Bronco"	171	161	150
"Resene Bronze"	63	33	9
"Resene Bronze Olive"	78	66	12
"Resene Bronzetone"	77	64	15
"Resene Broom"	255	236	19
"Resene Brown Bramble"	89	40	4
"Resene Brown Derby"	73	38	21
"Resene Brown Pod"	64	24	1
"Resene Bubbles"	231	254	255
"Resene Buccaneer"	98	47	48
"Resene Bud"	168	174	156
"Resene Buddha Gold"	193	160	4
"Resene Bulgarian Rose"	72	6	7
"Resene Bull Shot"	134	77	30
"Resene Bunker"	13	17	23
"Resene Bunting"	21	31	76
"Resene Burgundy"	119	15	5
"Resene Burnham"	0	46	32
"Resene Burning Sand"	217	147	118
"Resene Burnt Crimson"	101	0	11
"Resene Bush"	13	46	28
"Resene Buttercup"	243	173	22
"Resene Buttered Rum"	161	117	13
"Resene Butterfly Bush"	98	78	154
"Resene Buttermilk"	255	241	181
"Resene Buttery White"	255	252	234
"Resene Cab Sav"	77	10	24
"Resene Cabaret"	217	73	114
"Resene Cabbage Pont"	63	76	58
"Resene Cactus"	88	113	86
"Resene Cadillac"	176	76	106
"Resene Cafe Royale"	111	68	12
"Resene Calico"	224	192	149
"Resene California"	254	157	4
"Resene Calypso"	49	114	141
"Resene Camarone"	0	88	26
"Resene Camelot"	137	52	86
"Resene Cameo"	217	185	155
"Resene Camouflage"	60	57	16
"Resene Can Can"	213	145	164
"Resene Canary"	243	251	98
"Resene Candlelight"	252	217	23
"Resene Cannon Black"	37	23	6
"Resene Cannon Pink"	137	67	103
"Resene Canvas"	168	165	137
"Resene Cape Cod"	60	68	67
"Resene Cape Honey"	254	229	172
"Resene Cape Palliser"	162	102	69
"Resene Caper"	220	237	180
"Resene Capri"	6	42	120
"Resene Caramel"	255	221	175
"Resene Cararra"	238	238	232
"Resene Cardin Green"	1	54	28
"Resene Cardinal"	140	5	94
"Resene Careys Pink"	210	158	170
"Resene Carissma"	234	136	168
"Resene Carla"	243	255	216
"Resene Carnaby Tan"	92	46	1
"Resene Carousel Pink"	249	224	237
"Resene Casablanca"	248	184	83
"Resene Casal"	47	97	104
"Resene Cascade"	139	169	165
"Resene Cashmere"	230	190	165
"Resene Casper"	173	190	209
"Resene Castro"	82	0	31
"Resene Catalina Blue"	6	42	120
"Resene Catskill White"	238	246	247
"Resene Cavern Pink"	227	190	190
"Resene Ce Soir"	151	113	181
"Resene Cedar"	62	28	20
"Resene Cedar Wood Finish"	113	26	0
"Resene Celery"	184	194	93
"Resene Celeste"	209	210	202
"Resene Cello"	30	56	91
"Resene Celtic"	22	50	34
"Resene Cement"	141	118	98
"Resene Ceramic"	252	255	249
"Resene Chablis"	255	244	243
"Resene Chalet Green"	81	110	61
"Resene Chalky"	238	215	148
"Resene Chambray"	53	78	140
"Resene Chamois"	237	220	177
"Resene Champagne"	250	236	204
"Resene Chantilly"	248	195	223
"Resene Charade"	41	41	55
"Resene Chardon"	255	243	241
"Resene Chardonnay"	255	205	140
"Resene Charlotte"	186	238	249
"Resene Charm"	212	116	148
"Resene Chateau Green"	64	168	96
"Resene Chatelle"	189	179	199
"Resene Chathams Blue"	23	85	121
"Resene Chelsea Cucumber"	131	170	93
"Resene Chelsea Gem"	158	83	2
"Resene Chenin"	223	205	111
"Resene Cherokee"	252	218	152
"Resene Cherry Pie"	42	3	89
"Resene Cherrywood"	101	26	20
"Resene Cherub"	248	217	233
"Resene Chetwode Blue"	133	129	217
"Resene Chicago"	93	92	88
"Resene Chiffon"	241	255	200
"Resene Chilean Fire"	247	119	3
"Resene Chilean Heath"	255	253	230
"Resene China Ivory"	252	255	231
"Resene Chino"	206	199	167
"Resene Chinook"	168	227	189
"Resene Chocolate"	55	2	2
"Resene Christalle"	51	3	107
"Resene Christi"	103	167	18
"Resene Christine"	231	115	10
"Resene Chrome White"	232	241	212
"Resene Cigar"	119	63	26
"Resene Cinder"	14	14	24
"Resene Cinderella"	253	225	220
"Resene Cinnamon"	123	63	0
"Resene Cioccolato"	85	40	12
"Resene Citrine White"	250	247	214
"Resene Citron"	158	169	31
"Resene Citrus"	161	197	10
"Resene Clairvoyant"	72	6	86
"Resene Clam Shell"	212	182	175
"Resene Claret"	127	23	52
"Resene Classic Rose"	251	204	231
"Resene Clay Creek"	138	131	96
"Resene Clear Day"	233	255	253
"Resene Clementine"	233	110	0
"Resene Clinker"	55	29	9
"Resene Cloud"	199	196	191
"Resene Cloud Burst"	32	46	84
"Resene Cloudy"	172	165	159
"Resene Clover"	56	73	16
"Resene Cobalt"	6	42	120
"Resene Cocoa Bean"	72	28	28
"Resene Cocoa Brown"	48	31	30
"Resene Coconut Cream"	248	247	220
"Resene Cod Grey"	11	11	11
"Resene Coffee"	112	101	85
"Resene Coffee Bean"	42	20	14
"Resene Cognac"	159	56	29
"Resene Cola"	63	37	0
"Resene Cold Purple"	171	160	217
"Resene Cold Turkey"	206	186	186
"Resene Colonial White"	255	237	188
"Resene Comet"	92	93	117
"Resene Como"	81	124	102
"Resene Conch"	201	217	210
"Resene Concord"	124	123	122
"Resene Concrete"	242	242	242
"Resene Confetti"	233	215	90
"Resene Congo Brown"	89	55	55
"Resene Conifer"	172	221	77
"Resene Contessa"	198	114	107
"Resene Copper Canyon"	126	58	21
"Resene Copper Rust"	148	71	71
"Resene Coral"	199	188	162
"Resene Coral Candy"	255	220	214
"Resene Coral Tree"	168	107	107
"Resene Corduroy"	96	110	104
"Resene Coriander"	196	208	176
"Resene Cork"	64	41	29
"Resene Corn"	231	191	5
"Resene Corn Field"	248	250	205
"Resene Corn Harvest"	139	107	11
"Resene Cornflower"	255	176	172
"Resene Corvette"	250	211	162
"Resene Cosmic"	118	57	93
"Resene Cosmos"	255	216	217
"Resene Costa Del Sol"	97	93	48
"Resene Cotton Seed"	194	189	182
"Resene County Green"	1	55	26
"Resene Cove Grey"	5	22	87
"Resene Cowboy"	77	40	45
"Resene Crab Apple"	160	39	18
"Resene Crail"	185	81	64
"Resene Cranberry"	182	49	108
"Resene Crater Brown"	70	36	37
"Resene Cream Brulee"	255	229	160
"Resene Cream Can"	245	200	92
"Resene Creme De Banane"	255	252	153
"Resene Creole"	30	15	4
"Resene Crete"	115	120	41
"Resene Crocodile"	115	109	88
"Resene Crown of Thorns"	119	31	31
"Resene Crowshead"	28	18	8
"Resene Cruise"	181	236	223
"Resene Crusoe"	0	72	22
"Resene Crusta"	253	123	51
"Resene Cuban Tan"	42	20	14
"Resene Cumin"	146	67	33
"Resene Cumulus"	253	255	213
"Resene Cupid"	251	190	218
"Resene Curious Blue"	37	150	209
"Resene Cutty Sark"	80	118	114
"Resene Cyprus"	0	62	64
"Resene Daintree"	1	39	49
"Resene Dairy Cream"	249	228	188
"Resene Daisy Bush"	79	35	152
"Resene Dallas"	110	75	38
"Resene Danube"	96	147	209
"Resene Dark Ebony"	60	32	5
"Resene Dark Oak"	97	39	24
"Resene Dark Rimu"	95	61	38
"Resene Dark Rum"	65	32	16
"Resene Dark Slate"	57	72	81
"Resene Dark Tan"	102	16	16
"Resene Dawn"	166	162	154
"Resene Dawn Pink"	243	233	229
"Resene De York"	122	196	136
"Resene Deco"	210	218	151
"Resene Deep Blush"	228	118	152
"Resene Deep Bronze"	74	48	4
"Resene Deep Cove"	5	16	64
"Resene Deep Fir"	0	41	0
"Resene Deep Koamaru"	27	18	123
"Resene Deep Oak"	65	32	16
"Resene Deep Sea"	1	130	107
"Resene Deep Teal"	0	53	50
"Resene Del Rio"	176	154	149
"Resene Dell"	57	100	19
"Resene Delta"	164	164	157
"Resene Deluge"	117	99	168
"Resene Derby"	255	238	216
"Resene Desert"	174	96	32
"Resene Desert Storm"	248	248	247
"Resene Dew"	234	255	254
"Resene Di Serria"	219	153	94
"Resene Diesel"	19	0	0
"Resene Dingley"	93	119	71
"Resene Disco"	135	21	80
"Resene Dixie"	226	148	24
"Resene Dolly"	249	255	139
"Resene Dolphin"	100	96	119
"Resene Domino"	142	119	94
"Resene Don Juan"	93	76	81
"Resene Donkey Brown"	166	146	121
"Resene Dorado"	107	87	85
"Resene Double Colonial White"	238	227	173
"Resene Double Pearl Lusta"	252	244	208
"Resene Double Spanish White"	230	215	185
"Resene Dove Grey"	109	108	108
"Resene Downriver"	9	34	86
"Resene Downy"	111	208	197
"Resene Driftwood"	175	135	81
"Resene Drover"	253	247	173
"Resene Dune"	56	53	51
"Resene Dust Storm"	229	204	201
"Resene Dusty Grey"	168	152	155
"Resene Dutch White"	255	248	209
"Resene Eagle"	182	186	164
"Resene Earls Green"	201	185	59
"Resene Early Dawn"	255	249	230
"Resene East Bay"	65	76	125
"Resene East Side"	172	145	206
"Resene Eastern Blue"	30	154	176
"Resene Ebb"	233	227	227
"Resene Ebony"	12	11	29
"Resene Ebony Clay"	38	40	59
"Resene Echo Blue"	175	189	217
"Resene Eclipse"	49	28	23
"Resene Ecru White"	245	243	229
"Resene Ecstasy"	250	120	20
"Resene Eden"	16	88	82
"Resene Edgewater"	200	227	215
"Resene Edward"	162	174	171
"Resene Egg Sour"	255	244	221
"Resene Egg White"	255	239	193
"Resene El Paso"	30	23	8
"Resene El Salva"	143	62	51
"Resene Elephant"	18	52	71
"Resene Elf Green"	8	131	112
"Resene Elm"	28	124	125
"Resene Embers"	160	39	18
"Resene Eminence"	108	48	130
"Resene Emperor"	81	70	73
"Resene Empress"	129	115	119
"Resene Endeavour"	0	86	167
"Resene Energy Yellow"	248	221	92
"Resene English Holly"	2	45	21
"Resene English Walnut"	62	43	35
"Resene Envy"	139	166	144
"Resene Equator"	225	188	100
"Resene Espresso"	97	39	24
"Resene Eternity"	33	26	14
"Resene Eucalyptus"	39	138	91
"Resene Eunry"	207	163	157
"Resene Evening Sea"	2	78	70
"Resene Everglade"	28	64	46
"Resene Fair Pink"	255	239	236
"Resene Falcon"	127	98	109
"Resene Fantasy"	250	243	240
"Resene Fedora"	121	106	120
"Resene Feijoa"	159	221	140
"Resene Fern"	10	72	13
"Resene Fern Frond"	101	114	32
"Resene Ferra"	112	79	80
"Resene Festival"	251	233	108
"Resene Feta"	240	252	234
"Resene Fiery Orange"	179	82	19
"Resene Fiji Green"	101	114	32
"Resene Finch"	98	102	73
"Resene Finlandia"	85	109	86
"Resene Finn"	105	45	84
"Resene Fiord"	64	81	105
"Resene Fire"	170	66	3
"Resene Fire Bush"	232	153	40
"Resene Firefly"	14	42	48
"Resene Flame Pea"	218	91	56
"Resene Flame Red"	199	3	30
"Resene Flamenco"	255	125	7
"Resene Flamingo"	242	85	42
"Resene Flax"	123	130	101
"Resene Flint"	111	106	97
"Resene Flirt"	162	0	109
"Resene Foam"	216	252	250
"Resene Fog"	215	208	255
"Resene Foggy Grey"	203	202	182
"Resene Forest Green"	24	45	9
"Resene Forget Me Not"	255	241	238
"Resene Fountain Blue"	86	180	190
"Resene Frangipani"	255	222	179
"Resene French Grey"	189	189	198
"Resene French Lilac"	236	199	238
"Resene French Pass"	189	237	253
"Resene Friar Grey"	128	126	121
"Resene Fringy Flower"	177	226	193
"Resene Froly"	245	117	132
"Resene Frost"	237	245	221
"Resene Frosted Mint"	219	255	248
"Resene Frostee"	228	246	231
"Resene Fruit Salad"	79	157	93
"Resene Fuchsia"	122	88	193
"Resene Fuego"	190	222	13
"Resene Fuel Yellow"	236	169	39
"Resene Fun Blue"	25	89	168
"Resene Fun Green"	1	109	57
"Resene Fuscous Grey"	84	83	77
"Resene Gable Green"	22	53	49
"Resene Gallery"	239	239	239
"Resene Galliano"	220	178	12
"Resene Geebung"	209	143	27
"Resene Genoa"	21	115	107
"Resene Geraldine"	251	137	137
"Resene Geyser"	212	223	226
"Resene Ghost"	199	201	213
"Resene Gigas"	82	60	148
"Resene Gimblet"	184	181	106
"Resene Gin"	232	242	235
"Resene Gin Fizz"	255	249	226
"Resene Givry"	248	228	191
"Resene Glacier"	128	179	196
"Resene Glade Green"	97	132	95
"Resene Go Ben"	114	109	78
"Resene Goblin"	61	125	82
"Resene Gold Drop"	241	130	0
"Resene Gold Tips"	222	186	19
"Resene Golden Bell"	226	137	19
"Resene Golden Dream"	240	213	45
"Resene Golden Fizz"	245	251	61
"Resene Golden Glow"	253	226	149
"Resene Golden Sand"	240	219	125
"Resene Golden Tainoi"	255	204	92
"Resene Gondola"	38	20	20
"Resene Gordons Green"	11	17	7
"Resene Gorse"	255	241	79
"Resene Gossamer"	6	155	129
"Resene Gossip"	210	248	176
"Resene Gothic"	109	146	161
"Resene Governor Bay"	47	60	179
"Resene Grain Brown"	228	213	183
"Resene Grandis"	255	211	140
"Resene Granite Green"	141	137	116
"Resene Granny Apple"	213	246	227
"Resene Granny Smith"	132	160	160
"Resene Grape"	56	26	81
"Resene Graphite"	37	22	7
"Resene Grass Hopper"	124	118	49
"Resene Gravel"	74	68	75
"Resene Green House"	36	80	15
"Resene Green Kelp"	37	49	28
"Resene Green Leaf"	67	106	13
"Resene Green Mist"	203	211	176
"Resene Green Pea"	29	97	66
"Resene Green Smoke"	164	175	110
"Resene Green Spring"	184	193	177
"Resene Green Vogue"	3	43	82
"Resene Green Waterloo"	16	20	5
"Resene Green White"	232	235	224
"Resene Greenstone"	0	62	64
"Resene Grenadier"	213	70	0
"Resene Grey Chateau"	162	170	179
"Resene Grey Green"	69	73	54
"Resene Grey Nickel"	195	195	189
"Resene Grey Nurse"	231	236	230
"Resene Grey Olive"	169	164	145
"Resene Grey Suit"	193	190	205
"Resene Guardsman Red"	186	1	1
"Resene Gulf Blue"	5	22	87
"Resene Gulf Stream"	128	179	174
"Resene Gull Grey"	157	172	183
"Resene Gum Leaf"	182	211	191
"Resene Gumbo"	124	161	166
"Resene Gun Powder"	65	66	87
"Resene Gunmetal"	2	13	21
"Resene Gunsmoke"	130	134	133
"Resene Gurkha"	154	149	119
"Resene Hacienda"	152	129	27
"Resene Hairy Heath"	107	42	20
"Resene Haiti"	27	16	53
"Resene Half and Half"	255	254	225
"Resene Half Baked"	133	196	204
"Resene Half Colonial White"	253	246	211
"Resene Half Dutch White"	254	247	222
"Resene Half Pearl Lusta"	255	252	234
"Resene Half Spanish White"	254	244	219
"Resene Hampton"	229	216	175
"Resene Harp"	230	242	234
"Resene Harvest Gold"	224	185	116
"Resene Havana"	52	21	21
"Resene Havelock Blue"	85	144	217
"Resene Hawaiian Tan"	157	86	22
"Resene Hawkes Blue"	212	226	252
"Resene Heath"	84	16	18
"Resene Heather"	183	195	208
"Resene Heathered Grey"	182	176	149
"Resene Heavy Metal"	43	50	40
"Resene Hemlock"	94	93	59
"Resene Hemp"	144	120	116
"Resene Hibiscus"	182	49	108
"Resene Highball"	144	141	57
"Resene Highland"	111	142	99
"Resene Hillary"	172	165	134
"Resene Himalaya"	106	93	27
"Resene Hint of Green"	230	255	233
"Resene Hint of Grey"	252	255	249
"Resene Hint of Red"	249	249	249
"Resene Hint of Yellow"	250	253	228
"Resene Hippie Blue"	88	154	175
"Resene Hippie Green"	83	130	75
"Resene Hippie Pink"	174	69	96
"Resene Hit Grey"	161	173	181
"Resene Hit Pink"	255	171	129
"Resene Hokey Pokey"	200	165	40
"Resene Hoki"	101	134	159
"Resene Holly"	1	29	19
"Resene Honey Flower"	79	28	112
"Resene Honeysuckle"	237	252	132
"Resene Hopbush"	208	109	161
"Resene Horizon"	90	135	160
"Resene Horses Neck"	96	73	19
"Resene Hot Chile"	139	7	35
"Resene Hot Curry"	136	98	33
"Resene Hot Purple"	72	6	86
"Resene Hot Toddy"	179	128	7
"Resene Humming Bird"	207	249	243
"Resene Hunter Green"	22	29	16
"Resene Hurricane"	135	124	123
"Resene Husk"	183	164	88
"Resene Ice Cold"	177	244	231
"Resene Iceberg"	218	244	240
"Resene Illusion"	246	164	201
"Resene Indian Tan"	77	30	1
"Resene Indochine"	194	107	3
"Resene Irish Coffee"	95	61	38
"Resene Iroko"	67	49	32
"Resene Iron"	212	215	217
"Resene Ironbark"	65	31	16
"Resene Ironside Grey"	103	102	98
"Resene Ironstone"	134	72	60
"Resene Island Spice"	255	252	238
"Resene Jacaranda"	46	3	41
"Resene Jacarta"	58	42	106
"Resene Jacko Bean"	46	25	5
"Resene Jacksons Purple"	32	32	141
"Resene Jade"	66	121	119
"Resene Jaffa"	239	134	63
"Resene Jagged Ice"	194	232	229
"Resene Jagger"	53	14	87
"Resene Jaguar"	8	1	16
"Resene Jambalaya"	91	48	19
"Resene Janna"	244	235	211
"Resene Japanese Laurel"	10	105	6
"Resene Japanese Maple"	120	1	9
"Resene Japonica"	216	124	99
"Resene Jarrah"	52	21	21
"Resene Java"	31	194	194
"Resene Jazz"	120	1	9
"Resene Jelly Bean"	41	123	154
"Resene Jet Stream"	181	210	206
"Resene Jewel"	18	107	64
"Resene Joanna"	245	243	229
"Resene Jon"	59	31	31
"Resene Jonquil"	238	255	154
"Resene Jordy Blue"	138	185	241
"Resene Judge Grey"	84	67	51
"Resene Jumbo"	124	123	130
"Resene Jungle Green"	40	30	21
"Resene Jungle Mist"	180	207	211
"Resene Juniper"	109	146	146
"Resene Just Right"	236	205	185
"Resene Kabul"	94	72	62
"Resene Kaitoke Green"	0	70	32
"Resene Kangaroo"	198	200	189
"Resene Karaka"	30	22	9
"Resene Karry"	255	234	212
"Resene Kashmir Blue"	80	112	150
"Resene Kelp"	69	73	54
"Resene Kenyan Copper"	124	28	5
"Resene Keppel"	58	176	158
"Resene Kidnapper"	225	234	212
"Resene Kilamanjaro"	36	12	2
"Resene Killarney"	58	106	71
"Resene Kimberly"	115	108	159
"Resene Kingfisher Daisy"	62	4	128
"Resene Kobi"	231	159	196
"Resene Kokoda"	110	109	87
"Resene Korma"	143	75	14
"Resene Koromiko"	255	189	95
"Resene Kournikova"	255	231	114
"Resene Kumera"	136	98	33
"Resene La Palma"	54	135	22
"Resene La Rioja"	179	193	16
"Resene Las Palmas"	198	230	16
"Resene Laser"	200	181	104
"Resene Laurel"	116	147	120
"Resene Lavender"	168	153	230
"Resene Leather"	150	112	89
"Resene Lemon"	244	216	28
"Resene Lemon Ginger"	172	158	34
"Resene Lemon Grass"	155	158	143
"Resene Licorice"	9	34	86
"Resene Lightning Yellow"	252	192	30
"Resene Lilac Bush"	152	116	211
"Resene Lily"	200	170	191
"Resene Lily White"	231	248	255
"Resene Lima"	118	189	23
"Resene Lime"	191	201	33
"Resene Limeade"	111	157	2
"Resene Limed Ash"	116	125	99
"Resene Limed Gum"	66	57	33
"Resene Limed Oak"	172	138	86
"Resene Limed Spruce"	57	72	81
"Resene Limerick"	157	194	9
"Resene Linen"	230	228	212
"Resene Link Water"	217	228	245
"Resene Lipstick"	171	5	99
"Resene Lisbon Brown"	66	57	33
"Resene Livid Brown"	77	40	46
"Resene Loafer"	238	244	222
"Resene Loblolly"	189	201	206
"Resene Lochinvar"	44	140	132
"Resene Lochmara"	0	126	199
"Resene Locust"	168	175	142
"Resene Log Cabin"	36	42	29
"Resene Logan"	170	169	205
"Resene Lola"	223	207	219
"Resene London Hue"	190	166	195
"Resene Lonestar"	109	1	1
"Resene Lotus"	134	60	60
"Resene Loulou"	70	11	65
"Resene Lucky"	175	159	28
"Resene Lucky Point"	26	26	104
"Resene Lunar Green"	60	73	58
"Resene Lusty"	153	27	7
"Resene Luxor Gold"	167	136	44
"Resene Lynch"	105	126	154
"Resene Mabel"	217	247	255
"Resene Madang"	183	240	190
"Resene Madison"	9	37	93
"Resene Madras"	63	48	2
"Resene Magnolia"	248	244	255
"Resene Mahogany"	78	6	6
"Resene Mai Tai"	176	102	8
"Resene Maire"	19	10	6
"Resene Maize"	245	213	160
"Resene Makara"	137	125	109
"Resene Mako"	68	73	84
"Resene Malachite Green"	136	141	101
"Resene Malibu"	125	200	247
"Resene Mallard"	35	52	24
"Resene Malta"	189	178	161
"Resene Mamba"	142	129	144
"Resene Mandalay"	173	120	27
"Resene Mandy"	226	84	101
"Resene Mandys Pink"	242	195	178
"Resene Manhattan"	245	201	153
"Resene Mantis"	116	195	101
"Resene Mantle"	139	156	144
"Resene Manz"	238	239	120
"Resene Mardi Gras"	53	0	54
"Resene Marigold"	185	141	40
"Resene Mariner"	40	106	205
"Resene Marlin"	42	20	14
"Resene Maroon"	66	3	3
"Resene Marshland"	11	15	8
"Resene Martini"	175	160	158
"Resene Martinique"	54	48	80
"Resene Marzipan"	248	219	157
"Resene Masala"	64	59	56
"Resene Mash"	64	41	29
"Resene Matisse"	27	101	157
"Resene Matrix"	176	93	84
"Resene Matterhorn"	78	59	65
"Resene Maverick"	216	194	213
"Resene McKenzie"	175	135	81
"Resene Melanie"	228	194	213
"Resene Melanzane"	48	5	41
"Resene Melrose"	199	193	255
"Resene Meranti"	93	30	15
"Resene Mercury"	229	229	229
"Resene Merino"	246	240	230
"Resene Merlin"	65	60	55
"Resene Merlot"	131	25	35
"Resene Metallic Bronze"	73	55	27
"Resene Metallic Copper"	113	41	29
"Resene Meteor"	208	125	18
"Resene Meteorite"	60	31	118
"Resene Mexican Red"	167	37	37
"Resene Mid Grey"	95	95	110
"Resene Midnight"	1	22	53
"Resene Midnight Express"	0	7	65
"Resene Midnight Moss"	4	16	4
"Resene Mikado"	45	37	16
"Resene Milan"	250	255	164
"Resene Milano Red"	184	17	4
"Resene Milk Punch"	255	246	212
"Resene Milk White"	246	240	230
"Resene Millbrook"	89	68	51
"Resene Mimosa"	248	253	211
"Resene Mindaro"	227	249	136
"Resene Mine Shaft"	50	50	50
"Resene Mineral Green"	63	93	83
"Resene Ming"	54	116	125
"Resene Minsk"	63	48	127
"Resene Mint Julep"	241	238	193
"Resene Mint Tulip"	196	244	235
"Resene Mirage"	22	25	40
"Resene Mischka"	209	210	221
"Resene Mist Grey"	196	196	188
"Resene Mobster"	127	117	137
"Resene Moccaccino"	110	29	20
"Resene Mocha"	120	45	25
"Resene Mojo"	192	71	55
"Resene Mona Lisa"	255	161	148
"Resene Monarch"	139	7	35
"Resene Mondo"	74	60	48
"Resene Mongoose"	181	162	127
"Resene Monsoon"	138	131	137
"Resene Montana"	41	30	48
"Resene Monte Carlo"	131	208	198
"Resene Monza"	199	3	30
"Resene Moody Blue"	127	118	211
"Resene Moon Glow"	252	254	218
"Resene Moon Mist"	220	221	204
"Resene Moon Raker"	214	206	246
"Resene Moon Yellow"	252	217	23
"Resene Morning Glory"	158	222	224
"Resene Morocco Brown"	68	29	0
"Resene Mortar"	80	67	81
"Resene Mosaic"	18	52	71
"Resene Mosque"	3	106	110
"Resene Mountain Mist"	149	147	150
"Resene Muddy Waters"	183	142	92
"Resene Muesli"	170	139	91
"Resene Mulberry"	92	5	54
"Resene Mule Fawn"	140	71	47
"Resene Mulled Wine"	78	69	98
"Resene Mustard"	116	100	13
"Resene My Pink"	214	145	136
"Resene My Sin"	255	179	31
"Resene Mystic"	226	235	237
"Resene Nandor"	75	93	82
"Resene Napa"	172	164	148
"Resene Narvik"	237	249	241
"Resene Natural"	134	86	10
"Resene Nebula"	203	219	214
"Resene Negroni"	255	226	197
"Resene Nepal"	142	171	193
"Resene Neptune"	124	183	187
"Resene Nero"	20	6	0
"Resene Neutral Green"	172	165	134
"Resene Nevada"	100	110	117
"Resene New Amber"	123	56	1
"Resene New Orleans"	243	214	157
"Resene New York Pink"	215	131	127
"Resene Niagara"	6	161	137
"Resene Night Rider"	31	18	15
"Resene Night Shadz"	170	55	90
"Resene Nightclub"	102	0	69
"Resene Nile Blue"	25	55	81
"Resene Nobel"	183	177	177
"Resene Nomad"	186	177	162
"Resene Nordic"	1	39	49
"Resene Norway"	168	189	159
"Resene Nugget"	197	153	34
"Resene Nutmeg"	129	66	44
"Resene Nutmeg Wood Finish"	104	54	0
"Resene Oasis"	254	239	206
"Resene Observatory"	2	134	111
"Resene Ocean Green"	65	170	120
"Resene Off Green"	230	248	243
"Resene Off Yellow"	254	249	227
"Resene Oil"	40	30	21
"Resene Oiled Cedar"	124	28	5
"Resene Old Brick"	144	30	30
"Resene Old Copper"	114	74	47
"Resene Olive Green"	36	46	22
"Resene Olive Haze"	139	132	112
"Resene Olivetone"	113	110	16
"Resene Onahau"	205	244	255
"Resene Onion"	47	39	14
"Resene Opal"	169	198	194
"Resene Opium"	142	111	112
"Resene Oracle"	55	116	117
"Resene Orange Roughy"	196	87	25
"Resene Orange White"	254	252	237
"Resene Orchid White"	255	253	243
"Resene Oregon"	155	71	3
"Resene Orient"	1	94	133
"Resene Oriental Pink"	198	145	145
"Resene Orinoco"	243	251	212
"Resene Oslo Grey"	135	141	145
"Resene Ottoman"	233	248	237
"Resene Outer Space"	5	16	64
"Resene Oxford Blue"	56	69	85
"Resene Oxley"	119	158	134
"Resene Oyster Bay"	218	250	255
"Resene Oyster Pink"	233	206	205
"Resene Paarl"	166	85	41
"Resene Pablo"	119	111	97
"Resene Pacifika"	119	129	32
"Resene Paco"	65	31	16
"Resene Padua"	173	230	196
"Resene Pale Leaf"	192	211	185
"Resene Pale Oyster"	152	141	119
"Resene Pale Prim"	253	254	184
"Resene Pale Rose"	255	225	242
"Resene Pale Sky"	110	119	131
"Resene Pale Slate"	195	191	193
"Resene Palm Green"	9	35	15
"Resene Palm Leaf"	25	51	14
"Resene Pampas"	244	242	238
"Resene Panache"	234	246	238
"Resene Pancho"	237	205	171
"Resene Panda"	66	57	33
"Resene Paprika"	141	2	38
"Resene Paradiso"	49	125	130
"Resene Parchment"	241	233	210
"Resene Paris Daisy"	255	244	110
"Resene Paris M"	38	5	106
"Resene Paris White"	202	220	212
"Resene Parsley"	19	79	25
"Resene Patina"	99	154	143
"Resene Pattens Blue"	222	245	255
"Resene Paua"	38	3	104
"Resene Pavlova"	215	196	152
"Resene Pea Soup"	207	229	210
"Resene Peach"	255	240	219
"Resene Peach Schnapps"	255	220	214
"Resene Peanut"	120	47	22
"Resene Pearl Bush"	232	224	213
"Resene Pearl Lusta"	252	244	220
"Resene Peat"	113	107	86
"Resene Pelorous"	62	171	191
"Resene Peppermint"	227	245	225
"Resene Perano"	169	190	242
"Resene Perfume"	208	190	248
"Resene Periglacial Blue"	225	230	214
"Resene Persian Plum"	112	28	28
"Resene Persian Red"	82	12	23
"Resene Persimmon"	255	107	83
"Resene Peru Tan"	127	58	2
"Resene Pesto"	124	118	49
"Resene Petite Orchid"	219	150	144
"Resene Pewter"	150	168	161
"Resene Pharlap"	163	128	123
"Resene Picasso"	255	243	157
"Resene Pickled Aspen"	63	76	58
"Resene Pickled Bean"	110	72	38
"Resene Pickled Bluewood"	49	68	89
"Resene Picton Blue"	69	177	232
"Resene Pigeon Post"	175	189	217
"Resene Pine Cone"	109	94	84
"Resene Pine Glade"	199	205	144
"Resene Pine Tree"	23	31	4
"Resene Pink Flare"	225	192	200
"Resene Pink Lace"	255	221	244
"Resene Pink Lady"	255	241	216
"Resene Pink Swan"	190	181	183
"Resene Piper"	201	99	35
"Resene Pipi"	254	244	204
"Resene Pippin"	255	225	223
"Resene Pirate Gold"	186	127	3
"Resene Pistachio"	157	194	9
"Resene Pixie Green"	192	216	182
"Resene Pizazz"	255	144	0
"Resene Pizza"	201	148	21
"Resene Plantation"	39	80	75
"Resene Planter"	97	93	48
"Resene Plum"	65	0	86
"Resene Pohutukawa"	143	2	28
"Resene Polar"	229	249	246
"Resene Polo Blue"	141	168	204
"Resene Pompadour"	102	0	69
"Resene Porcelain"	239	242	243
"Resene Porsche"	234	174	105
"Resene Port Gore"	37	31	79
"Resene Portafino"	255	255	180
"Resene Portage"	139	159	238
"Resene Portica"	249	230	99
"Resene Pot Pourri"	245	231	226
"Resene Potters Clay"	140	87	56
"Resene Powder Blue"	188	201	194
"Resene Prairie Sand"	154	56	32
"Resene Prelude"	208	192	229
"Resene Prim"	240	226	236
"Resene Primrose"	237	234	153
"Resene Promenade"	252	255	231
"Resene Provincial Pink"	254	245	241
"Resene Prussian Blue"	0	49	83
"Resene Pueblo"	125	44	20
"Resene Puerto Rico"	63	193	170
"Resene Pumice"	194	202	196
"Resene Pumpkin"	177	97	11
"Resene Punch"	220	67	51
"Resene Punga"	77	61	20
"Resene Putty"	231	205	140
"Resene Quarter Pearl Lusta"	255	253	244
"Resene Quarter Spanish White"	247	242	225
"Resene Quicksand"	189	151	142
"Resene Quill Grey"	214	214	209
"Resene Quincy"	98	63	45
"Resene Racing Green"	12	25	17
"Resene Raffia"	234	218	184
"Resene Rain Forest"	119	129	32
"Resene Raincloud"	123	124	148
"Resene Rainee"	185	200	172
"Resene Rajah"	247	182	104
"Resene Rangitoto"	46	50	34
"Resene Rangoon Green"	28	30	19
"Resene Raven"	114	123	137
"Resene Rebel"	60	18	6
"Resene Red Beech"	123	56	1
"Resene Red Berry"	142	0	0
"Resene Red Damask"	218	106	65
"Resene Red Devil"	134	1	17
"Resene Red Oxide"	110	9	2
"Resene Red Robin"	128	52	31
"Resene Red Stage"	208	95	4
"Resene Redwood"	93	30	15
"Resene Reef"	201	255	162
"Resene Reef Gold"	159	130	28
"Resene Regal Blue"	1	63	106
"Resene Regent Grey"	134	148	159
"Resene Regent St Blue"	170	214	230
"Resene Remy"	254	235	243
"Resene Reno Sand"	168	101	21
"Resene Resolution Blue"	0	35	135
"Resene Revolver"	44	22	50
"Resene Rhino"	46	63	98
"Resene Ribbon"	102	0	69
"Resene Rice Cake"	255	254	240
"Resene Rice Flower"	238	255	226
"Resene Rich Gold"	168	83	7
"Resene Rio Grande"	187	208	9
"Resene Riptide"	139	230	216
"Resene River Bed"	67	76	89
"Resene Rob Roy"	234	198	116
"Resene Robins Egg Blue"	189	200	179
"Resene Rock"	77	56	51
"Resene Rock Blue"	158	177	205
"Resene Rock Salt"	255	255	255
"Resene Rock Spray"	186	69	12
"Resene Rodeo Dust"	201	178	155
"Resene Rolling Stone"	116	125	131
"Resene Roman"	222	99	96
"Resene Roman Coffee"	121	93	76
"Resene Romance"	255	254	253
"Resene Romantic"	255	210	183
"Resene Ronchi"	236	197	78
"Resene Roof Terracotta"	166	47	32
"Resene Rope"	142	77	30
"Resene Rose"	231	188	180
"Resene Rose Bud"	251	178	163
"Resene Rose Bud Cherry"	128	11	71
"Resene Rose of Sharon"	191	85	0
"Resene Rose White"	255	246	245
"Resene Rosewood"	101	0	11
"Resene Roti"	198	168	75
"Resene Rouge"	162	59	108
"Resene Royal Heath"	171	52	114
"Resene Rum"	121	105	137
"Resene Rum Swizzle"	249	248	228
"Resene Russett"	117	90	87
"Resene Rustic Red"	72	4	4
"Resene Rusty Nail"	134	86	10
"Resene Saddle"	76	48	36
"Resene Saddle Brown"	88	52	1
"Resene Saffron"	249	191	88
"Resene Sage"	158	165	135
"Resene Sahara"	183	162	20
"Resene Sail"	184	224	249
"Resene Salem"	9	127	75
"Resene Salomie"	254	219	141
"Resene Salt Box"	104	94	110
"Resene Saltpan"	241	247	242
"Resene Sambuca"	58	32	16
"Resene San Felix"	11	98	7
"Resene San Juan"	48	75	106
"Resene San Marino"	69	108	172
"Resene Sand Dune"	130	111	101
"Resene Sandal"	170	141	111
"Resene Sandrift"	171	145	122
"Resene Sandstone"	121	109	98
"Resene Sandwisp"	245	231	162
"Resene Sandy Beach"	255	234	200
"Resene Sangria"	146	0	10
"Resene Sanguine Brown"	141	61	56
"Resene Santa Fe"	177	109	82
"Resene Santas Grey"	159	160	177
"Resene Sapling"	222	212	164
"Resene Sapphire"	47	81	158
"Resene Saratoga"	85	91	16
"Resene Sauvignon"	255	245	243
"Resene Sazerac"	255	244	224
"Resene Scampi"	103	95	166
"Resene Scandal"	207	250	244
"Resene Scarlet Gum"	67	21	96
"Resene Scarlett"	149	0	21
"Resene Scarpa Flow"	88	85	98
"Resene Schist"	169	180	151
"Resene Schooner"	139	132	126
"Resene Scooter"	46	191	212
"Resene Scorpion"	105	95	98
"Resene Scotch Mist"	255	251	220
"Resene Scrub"	46	50	34
"Resene Sea Buckthorn"	251	161	41
"Resene Sea Fog"	252	255	249
"Resene Sea Green"	9	88	89
"Resene Sea Mist"	197	219	202
"Resene Sea Nymph"	120	163	156
"Resene Sea Pink"	237	152	158
"Resene Seagull"	128	204	234
"Resene Seance"	115	30	143
"Resene Seashell"	241	241	241
"Resene Seaweed"	27	47	17
"Resene Selago"	240	238	253
"Resene Sepia"	43	2	2
"Resene Serenade"	255	244	232
"Resene Shadow Green"	154	194	184
"Resene Shady Lady"	170	165	169
"Resene Shakespeare"	78	171	209
"Resene Shalimar"	251	255	186
"Resene Shark"	37	39	44
"Resene Sherpa Blue"	0	73	80
"Resene Sherwood Green"	2	64	44
"Resene Shilo"	232	185	179
"Resene Shingle Fawn"	107	78	49
"Resene Ship Cove"	120	139	186
"Resene Ship Grey"	62	58	68
"Resene Shiraz"	178	9	49
"Resene Shocking"	226	146	192
"Resene Shuttle Grey"	95	102	114
"Resene Siam"	100	106	84
"Resene Sidecar"	243	231	187
"Resene Silk"	189	177	168
"Resene Silver Chalice"	172	172	172
"Resene Silver Sand"	191	193	194
"Resene Silver Tree"	102	181	143
"Resene Sinbad"	159	215	211
"Resene Siren"	122	1	58
"Resene Sirocco"	113	128	128
"Resene Sisal"	211	203	186
"Resene Skeptic"	202	230	218
"Resene Slugger"	65	32	16
"Resene Smalt Blue"	81	128	143
"Resene Smoke Tree"	218	99	4
"Resene Smokey Ash"	65	60	55
"Resene Smoky"	96	91	115
"Resene Snow Drift"	247	250	247
"Resene Snow Flurry"	228	255	209
"Resene Snowy Mint"	214	255	219
"Resene Snuff"	226	216	237
"Resene Soapstone"	255	251	249
"Resene Soft Amber"	209	198	180
"Resene Soft Peach"	245	237	239
"Resene Solid Pink"	137	56	67
"Resene Solitaire"	254	248	226
"Resene Solitude"	234	246	255
"Resene Sorbus"	253	124	7
"Resene Sorrell Brown"	206	185	143
"Resene Sour Dough"	209	190	168
"Resene Soya Bean"	106	96	81
"Resene Space Shuttle"	67	49	32
"Resene Spanish Green"	129	152	133
"Resene Spanish White"	244	235	211
"Resene Spectra"	47	90	87
"Resene Spice"	106	68	46
"Resene Spicy Mix"	136	83	66
"Resene Spicy Pink"	129	110	113
"Resene Spindle"	182	209	234
"Resene Splash"	255	239	193
"Resene Spray"	121	222	236
"Resene Spring Green"	87	131	99
"Resene Spring Rain"	172	203	177
"Resene Spring Sun"	246	255	220
"Resene Spring Wood"	248	246	241
"Resene Sprout"	193	215	176
"Resene Spun Pearl"	170	171	183
"Resene Squirrel"	143	129	118
"Resene St Tropaz"	45	86	155
"Resene Stack"	138	143	138
"Resene Star Dust"	159	159	156
"Resene Stark White"	229	215	189
"Resene Starship"	236	242	69
"Resene Steel Grey"	38	35	53
"Resene Stiletto"	156	51	54
"Resene Stinger"	139	107	11
"Resene Stonewall"	146	133	115
"Resene Storm Dust"	100	100	99
"Resene Storm Grey"	113	116	134
"Resene Stratos"	0	7	65
"Resene Straw"	212	191	141
"Resene Strikemaster"	149	99	135
"Resene Stromboli"	50	93	82
"Resene Studio"	113	74	178
"Resene Submarine"	186	199	201
"Resene Sugar Cane"	249	255	246
"Resene Sulu"	193	240	124
"Resene Summer Green"	150	187	171
"Resene Sun"	251	172	19
"Resene Sundance"	201	179	91
"Resene Sundown"	255	177	179
"Resene Sunflower"	228	212	34
"Resene Sunglo"	225	104	101
"Resene Sunset"	220	67	51
"Resene Sunshade"	255	158	44
"Resene Supernova"	255	201	1
"Resene Surf"	187	215	193
"Resene Surf Crest"	207	229	210
"Resene Surfie Green"	12	122	121
"Resene Sushi"	135	171	57
"Resene Suva Grey"	136	131	135
"Resene Swamp"	0	27	28
"Resene Swans Down"	220	240	234
"Resene Sweet Corn"	251	234	140
"Resene Sweet Pink"	253	159	162
"Resene Swirl"	211	205	197
"Resene Swiss Coffee"	221	214	213
"Resene Sycamore"	144	141	57
"Resene Tabasco"	160	39	18
"Resene Tacao"	237	179	129
"Resene Tacha"	214	197	98
"Resene Tahiti Gold"	233	124	7
"Resene Tahuna Sands"	238	240	200
"Resene Tall Poppy"	179	45	41
"Resene Tallow"	168	165	137
"Resene Tamarillo"	153	22	19
"Resene Tamarind"	52	21	21
"Resene Tana"	217	220	193
"Resene Tangaroa"	3	22	60
"Resene Tangerine"	233	110	0
"Resene Tango"	237	122	28
"Resene Tapa"	123	120	116
"Resene Tapestry"	176	94	129
"Resene Tara"	225	246	232
"Resene Tarawera"	7	58	80
"Resene Tasman"	207	220	207
"Resene Taupe Grey"	179	175	149
"Resene Tawny Port"	105	37	69
"Resene Tax Break"	81	128	143
"Resene Te Papa Green"	30	67	60
"Resene Tea"	193	186	176
"Resene Teak"	177	148	97
"Resene Teak Wood Finish"	107	42	20
"Resene Teal Blue"	4	66	89
"Resene Temptress"	59	0	11
"Resene Tequila"	255	230	199
"Resene Texas"	248	249	156
"Resene Texas Rose"	255	181	85
"Resene Thatch"	182	157	152
"Resene Thatch Green"	64	61	25
"Resene Thistle"	204	202	168
"Resene Thunder"	51	41	47
"Resene Thunderbird"	192	43	24
"Resene Tia Maria"	193	68	14
"Resene Tiara"	195	209	209
"Resene Tiber"	6	53	55
"Resene Tidal"	241	255	173
"Resene Tide"	191	184	176
"Resene Timber Green"	22	50	44
"Resene Titan White"	240	238	255
"Resene Toast"	154	110	97
"Resene Tobacco Brown"	113	93	71
"Resene Tobago"	62	43	35
"Resene Toledo"	58	0	32
"Resene Tolopea"	27	2	69
"Resene Tom Thumb"	63	88	59
"Resene Tonys Pink"	231	159	140
"Resene Topaz"	124	119	138
"Resene Torea Bay"	15	45	158
"Resene Tory Blue"	20	80	170
"Resene Tosca"	141	63	63
"Resene Totem Pole"	153	27	7
"Resene Touch Wood"	55	48	33
"Resene Tower Grey"	169	189	191
"Resene Tradewind"	95	179	172
"Resene Tranquil"	230	255	255
"Resene Travertine"	255	253	232
"Resene Tree Poppy"	252	156	29
"Resene Treehouse"	59	40	32
"Resene Trendy Green"	124	136	26
"Resene Trendy Pink"	140	100	149
"Resene Trinidad"	230	78	3
"Resene Tropical Blue"	195	221	249
"Resene Trout"	74	78	90
"Resene True V"	138	115	214
"Resene Tuatara"	54	53	52
"Resene Tuft Bush"	255	221	205
"Resene Tulip Tree"	234	179	59
"Resene Tumbleweed"	55	41	14
"Resene Tuna"	53	53	66
"Resene Tundora"	74	66	68
"Resene Turbo"	250	230	0
"Resene Turkish Rose"	181	114	129
"Resene Turmeric"	202	187	72
"Resene Turtle Green"	42	56	11
"Resene Tuscany"	189	94	46
"Resene Tusk"	238	243	195
"Resene Tussock"	197	153	75
"Resene Tutu"	255	241	249
"Resene Twilight"	228	207	222
"Resene Twilight Blue"	238	253	255
"Resene Twine"	194	149	93
"Resene Valencia"	216	68	55
"Resene Valentino"	53	14	66
"Resene Valhalla"	43	25	79
"Resene Van Cleef"	73	23	12
"Resene Vanilla"	209	190	168
"Resene Vanilla Ice"	243	217	223
"Resene Varden"	255	246	223
"Resene Venetian Red"	114	1	15
"Resene Venice Blue"	5	89	137
"Resene Venus"	146	133	144
"Resene Verdigris"	93	94	55
"Resene Verdun Green"	73	84	0
"Resene Vesuvius"	177	74	11
"Resene Victoria"	83	68	145
"Resene Vida Loca"	84	144	25
"Resene Viking"	100	204	219
"Resene Vin Rouge"	152	61	97
"Resene Viola"	203	143	169
"Resene Violent Violet"	41	12	94
"Resene Violet"	36	10	64
"Resene Viridian Green"	103	137	117
"Resene Vis Vis"	255	239	161
"Resene Vista Blue"	143	214	180
"Resene Vista White"	252	248	247
"Resene Volcano"	101	26	20
"Resene Voodoo"	83	52	85
"Resene Vulcan"	16	18	29
"Resene Wafer"	222	203	198
"Resene Waikawa Grey"	90	110	156
"Resene Waiouru"	54	60	13
"Resene Walnut"	119	63	26
"Resene Wan White"	252	255	249
"Resene Wasabi"	120	138	37
"Resene Water Leaf"	161	233	222
"Resene Watercourse"	5	111	87
"Resene Waterloo "	123	124	148
"Resene Wattle"	220	215	71
"Resene Watusi"	255	221	207
"Resene Wax Flower"	255	192	168
"Resene We Peep"	247	219	230
"Resene Wedgewood"	78	127	158
"Resene Well Read"	180	51	50
"Resene West Coast"	98	81	25
"Resene West Side"	255	145	15
"Resene Westar"	220	217	210
"Resene Western Red"	139	7	35
"Resene Wewak"	241	155	171
"Resene Wheatfield"	243	237	207
"Resene Whiskey"	213	154	111
"Resene Whiskey Sour"	219	153	94
"Resene Whisper"	247	245	250
"Resene White Ice"	221	249	241
"Resene White Lilac"	248	247	252
"Resene White Linen"	248	240	232
"Resene White Nectar"	252	255	231
"Resene White Pointer"	254	248	255
"Resene White Rock"	234	232	212
"Resene Wild Rice"	236	224	144
"Resene Wild Sand"	244	244	244
"Resene Wild Willow"	185	196	106
"Resene William"	58	104	108
"Resene Willow Brook"	223	236	218
"Resene Willow Grove"	101	116	93
"Resene Windsor"	60	8	120
"Resene Wine Berry"	89	29	53
"Resene Winter Hazel"	213	209	149
"Resene Wisp Pink"	254	244	248
"Resene Wisteria"	151	113	181
"Resene Wistful"	164	166	211
"Resene Witch Haze"	255	252	153
"Resene Wood Bark"	38	17	5
"Resene Woodburn"	60	32	5
"Resene Woodland"	77	83	40
"Resene Woodrush"	48	42	15
"Resene Woodsmoke"	12	13	15
"Resene Woody Bay"	41	33	48
"Resene Woody Brown"	72	49	49
"Resene Xanadu"	115	134	120
"Resene Yellow Metal"	113	99	56
"Resene Yellow Sea"	254	169	4
"Resene Your Pink"	255	195	192
"Resene Yukon Gold"	123	102	8
"Resene Yuma"	206	194	145
"Resene Zambezi"	104	85	88
"Resene Zanah"	218	236	214
"Resene Zest"	229	132	27
"Resene Zeus"	41	35	25
"Resene Ziggurat"	191	219	226
"Resene Zircon"	244	248	255
"Resene Zombie"	228	214	155
"Resene Zorba"	165	155	145
"Resene Zuccini"	4	64	34
"Resene Zumthor"	237	246	255
"Resene Zydeco"	2	64	44
