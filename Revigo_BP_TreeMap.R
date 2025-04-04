# A treemap R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM
setwd("C:/Users/Gulee/OneDrive - University of Edinburgh/Attachments/New_PhD/GWAS_TWAS/GO")
# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.
revigo.data <- read.table(file = 'Revigo_BP_OnScreenTable.tsv', sep = '\t', header = TRUE)
# by default, outputs to a PDF file
pdf( file="revigo_treemap1.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
treemap(
  revigo.data,
  index = c("Representative","Name"),
  vSize = "Uniqueness",
  type = "categorical",
  vColor = "Representative",
  title = "Revigo TreeMap",
  inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
  lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
  bg.labels = "#CCCCCCAA",   # define background color of group labels
  # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
  position.legend = "none"
)

dev.off()


revigo.names <- c("term_ID","description","frequency","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0006081","cellular aldehyde metabolic process",0.5676347545201639,0.9855189435091741,0.06834537,"cellular aldehyde metabolic process"),
c("GO:0008202","steroid metabolic process",0.41840538689736173,0.9764203107778971,0.05384587,"steroid metabolic process"),
c("GO:0006704","glucocorticoid biosynthetic process",0.01052228383426214,0.9526428553875936,0.68304601,"steroid metabolic process"),
c("GO:0008207","C21-steroid hormone metabolic process",0.02158360396319175,0.8533562841809719,0.63731502,"steroid metabolic process"),
c("GO:0008211","glucocorticoid metabolic process",0.012680890365875686,0.9667125359937644,0.36656416,"steroid metabolic process"),
c("GO:0120178","steroid hormone biosynthetic process",0.017111325664512376,0.9583228830940808,0.61810681,"steroid metabolic process"),
c("GO:0010712","regulation of collagen metabolic process",0.002424432649531745,0.9074745246442378,0.08966286,"regulation of collagen metabolic process"),
c("GO:0010566","regulation of ketone biosynthetic process",0.0048193290637392455,0.8969927466022292,0.16304094,"regulation of collagen metabolic process"),
c("GO:0032967","positive regulation of collagen biosynthetic process",0.001661413236988759,0.8716739397321482,0.14391953,"regulation of collagen metabolic process"),
c("GO:0042176","regulation of protein catabolic process",0.3131480896135287,0.8745143466888368,0.22271132,"regulation of collagen metabolic process"),
c("GO:0070918","regulatory ncRNA processing",0.08827888467827975,0.8071070035542538,0.41172188,"regulation of collagen metabolic process"),
c("GO:0071071","regulation of phospholipid biosynthetic process",0.006281372712289354,0.8827611657552638,0.17647808,"regulation of collagen metabolic process"),
c("GO:1902894","negative regulation of miRNA transcription",0.0022472152375862774,0.8515679541914206,0.19216856,"regulation of collagen metabolic process"),
c("GO:2000628","regulation of miRNA metabolic process",0.010566588187248508,0.8987271648673925,0.15737862,"regulation of collagen metabolic process"),
c("GO:0014812","muscle cell migration",0.006918863124704299,0.9851783707152273,0.00954564,"muscle cell migration"),
c("GO:0001667","ameboidal-type cell migration",0.07440916084060323,0.9834552352404993,0.63253547,"muscle cell migration"),
c("GO:0014909","smooth muscle cell migration",0.002921625944156529,0.9839807945290708,0.53024525,"muscle cell migration"),
c("GO:0014910","regulation of smooth muscle cell migration",0.005176225240573868,0.8934627818108857,0.09453633,"regulation of smooth muscle cell migration"),
c("GO:0008212","mineralocorticoid metabolic process",0.0011962175306319065,0.8730823626823456,0.54701229,"regulation of smooth muscle cell migration"),
c("GO:0010810","regulation of cell-substrate adhesion",0.044752319222117955,0.8894656671038701,0.11921611,"regulation of smooth muscle cell migration"),
c("GO:0010959","regulation of metal ion transport",0.174564073472173,0.8694972990690847,0.607916,"regulation of smooth muscle cell migration"),
c("GO:0017015","regulation of transforming growth factor beta receptor signaling pathway",0.02449538449557353,0.8401570565437947,0.46397146,"regulation of smooth muscle cell migration"),
c("GO:0030111","regulation of Wnt signaling pathway",0.18630718836650392,0.8349516454532121,0.60277737,"regulation of smooth muscle cell migration"),
c("GO:0030308","negative regulation of cell growth",0.060834799356169145,0.8214856500580725,0.63324811,"regulation of smooth muscle cell migration"),
c("GO:0032350","regulation of hormone metabolic process",0.0042261430043106655,0.875263406524585,0.36389133,"regulation of smooth muscle cell migration"),
c("GO:0032530","regulation of microvillus organization",0.0040538482982525725,0.8864006957117094,0.40268555,"regulation of smooth muscle cell migration"),
c("GO:0032970","regulation of actin filament-based process",0.3388347689338468,0.8816354205253167,0.15641944,"regulation of smooth muscle cell migration"),
c("GO:0043567","regulation of insulin-like growth factor receptor signaling pathway",0.01321992666054315,0.8586227871564966,0.43070673,"regulation of smooth muscle cell migration"),
c("GO:0046885","regulation of hormone biosynthetic process",0.002673029296844137,0.8667529330115065,0.56836158,"regulation of smooth muscle cell migration"),
c("GO:0051492","regulation of stress fiber assembly",0.022752746611443095,0.868135013136754,0.58920716,"regulation of smooth muscle cell migration"),
c("GO:0060390","regulation of SMAD protein signal transduction",0.006465974183065882,0.862780972776615,0.39713665,"regulation of smooth muscle cell migration"),
c("GO:0061041","regulation of wound healing",0.027434239910335865,0.8474872224783695,0.43144631,"regulation of smooth muscle cell migration"),
c("GO:0090092","regulation of transmembrane receptor protein serine/threonine kinase signaling pathway",0.09221212668229166,0.8419736769734997,0.53631604,"regulation of smooth muscle cell migration"),
c("GO:0090287","regulation of cellular response to growth factor stimulus",0.1121047811731704,0.8474161037854694,0.49295545,"regulation of smooth muscle cell migration"),
c("GO:0110020","regulation of actomyosin structure organization",0.027458853439772737,0.8694519451329821,0.68598684,"regulation of smooth muscle cell migration"),
c("GO:1900046","regulation of hemostasis",0.019033642313531964,0.877731924493565,0.105103,"regulation of smooth muscle cell migration"),
c("GO:1900180","regulation of protein localization to nucleus",0.012523363777479712,0.8857518255827546,0.12552438,"regulation of smooth muscle cell migration"),
c("GO:1900182","positive regulation of protein localization to nucleus",0.008326757008493292,0.8589604341723599,0.66551754,"regulation of smooth muscle cell migration"),
c("GO:1900744","regulation of p38MAPK cascade",0.009510667774406763,0.8587346152625064,0.48520247,"regulation of smooth muscle cell migration"),
c("GO:1900745","positive regulation of p38MAPK cascade",0.005314061005420342,0.8318616536256247,0.60697379,"regulation of smooth muscle cell migration"),
c("GO:1902903","regulation of supramolecular fiber organization",0.3173914620884452,0.8538283343693964,0.53792574,"regulation of smooth muscle cell migration"),
c("GO:1903034","regulation of response to wounding",0.031835138973648314,0.8531324644481099,0.66018684,"regulation of smooth muscle cell migration"),
c("GO:1903053","regulation of extracellular matrix organization",0.005909708417792608,0.8841645536707292,0.4197566,"regulation of smooth muscle cell migration"),
c("GO:1903055","positive regulation of extracellular matrix organization",0.0031456090620320502,0.8558409158094894,0.40683221,"regulation of smooth muscle cell migration"),
c("GO:1903729","regulation of plasma membrane organization",0.0025475002967160973,0.8890410256149162,0.10250546,"regulation of smooth muscle cell migration"),
c("GO:1904752","regulation of vascular associated smooth muscle cell migration",0.0013389760013657556,0.8970046189544469,0.55798996,"regulation of smooth muscle cell migration"),
c("GO:2000095","regulation of Wnt signaling pathway, planar cell polarity pathway",0.0027493312380984358,0.8650584616640872,0.10288913,"regulation of smooth muscle cell migration"),
c("GO:2000146","negative regulation of cell motility",0.14326550944024846,0.8267149751549282,0.67256689,"regulation of smooth muscle cell migration"),
c("GO:2001237","negative regulation of extrinsic apoptotic signaling pathway",0.02577036532040342,0.8156198344547257,0.48265274,"regulation of smooth muscle cell migration"),
c("GO:0030033","microvillus assembly",0.0008934711185583993,0.9892711180591224,0.00844245,"microvillus assembly"),
c("GO:0007044","cell-substrate junction assembly",0.007514510537076566,0.9880435720800931,0.28410274,"microvillus assembly"),
c("GO:0030198","extracellular matrix organization",0.23021526352893723,0.9858840240291092,0.20729818,"microvillus assembly"),
c("GO:0030865","cortical cytoskeleton organization",0.11460797711690014,0.9834324564792275,0.28563476,"microvillus assembly"),
c("GO:0031032","actomyosin structure organization",0.12413341300896903,0.9826112595378658,0.57776582,"microvillus assembly"),
c("GO:0043062","extracellular structure organization",0.23198743764839191,0.9858767305834969,0.30222597,"microvillus assembly"),
c("GO:0045229","external encapsulating structure organization",1.2096737471750436,0.9841589199384314,0.35006659,"microvillus assembly"),
c("GO:0031589","cell-substrate adhesion",0.22749792987910672,0.9950620647331642,-0,"cell-substrate adhesion"),
c("GO:0032964","collagen biosynthetic process",0.001265135413055144,0.9881310409371588,0.02414857,"collagen biosynthetic process"),
c("GO:0016051","carbohydrate biosynthetic process",1.1871720585638565,0.9807937392073496,0.11421376,"collagen biosynthetic process"),
c("GO:0046184","aldehyde biosynthetic process",0.12185666153605851,0.9734100109846777,0.16102868,"collagen biosynthetic process"),
c("GO:0120255","olefinic compound biosynthetic process",0.011137622070183904,0.9749535396010509,0.13256693,"collagen biosynthetic process"),
c("GO:0033687","osteoblast proliferation",0.0010756112363912412,0.9649991630075161,0.00853183,"osteoblast proliferation"),
c("GO:0010463","mesenchymal cell proliferation",0.0026016500614772127,0.9637053290391726,0.6290783,"osteoblast proliferation"),
c("GO:0033002","muscle cell proliferation",0.004679031945949083,0.9627976612506383,0.68288572,"osteoblast proliferation"),
c("GO:0048144","fibroblast proliferation",0.003384360297569695,0.9633034428405194,0.6636624,"osteoblast proliferation"),
c("GO:0048659","smooth muscle cell proliferation",0.0006621039418518166,0.9644820844622334,0.5922339,"osteoblast proliferation"),
c("GO:0035510","DNA dealkylation",0.026230638320872898,0.9835976720634754,0.02877474,"DNA dealkylation"),
c("GO:0000394","RNA splicing, via endonucleolytic cleavage and ligation",0.05302492646585013,0.9666241627728583,0.61004467,"DNA dealkylation"),
c("GO:0006351","DNA-templated transcription",2.0416135034942102,0.9593829123576529,0.55460708,"DNA dealkylation"),
c("GO:0006388","tRNA splicing, via endonucleolytic cleavage and ligation",0.052650800818409706,0.9666386068373072,0.26445635,"DNA dealkylation"),
c("GO:0010586","miRNA metabolic process",0.004952242122698346,0.9832068336922165,0.19181066,"DNA dealkylation"),
c("GO:0061614","miRNA transcription",7.384058831061151E-05,0.9779490228401619,0.19216258,"DNA dealkylation"),
c("GO:0071897","DNA biosynthetic process",0.7699653505500705,0.9628039835397241,0.41583538,"DNA dealkylation"),
c("GO:0036065","fucosylation",0.051070612228562615,0.9949355364269591,-0,"fucosylation"),
c("GO:0042634","regulation of hair cycle",0.0028773215911701623,0.8668403865581655,0.09533291,"regulation of hair cycle"),
c("GO:0008360","regulation of cell shape",0.6756881487480254,0.7757106504763327,0.67040446,"regulation of hair cycle"),
c("GO:0010543","regulation of platelet activation",0.009264532480038059,0.8541200270182281,0.47765012,"regulation of hair cycle"),
c("GO:0030278","regulation of ossification",0.02036277290312297,0.8528479021054083,0.53020221,"regulation of hair cycle"),
c("GO:0045778","positive regulation of ossification",0.007248684419158364,0.8291303672703816,0.5011016,"regulation of hair cycle"),
c("GO:0050818","regulation of coagulation",0.02280689637620421,0.8519477819965096,0.55849009,"regulation of hair cycle"),
c("GO:0050819","negative regulation of coagulation",0.015804347251414552,0.8107896568072065,0.54661648,"regulation of hair cycle"),
c("GO:0060688","regulation of morphogenesis of a branching structure",0.013810651367028042,0.8164798917693592,0.54237712,"regulation of hair cycle"),
c("GO:0061035","regulation of cartilage development",0.014509675603035163,0.8142325918616715,0.54392177,"regulation of hair cycle"),
c("GO:0070167","regulation of biomineral tissue development",0.01724916142935885,0.8125443288333055,0.62650085,"regulation of hair cycle"),
c("GO:0071634","regulation of transforming growth factor beta production",0.002855169414676979,0.8552077212794039,0.45077499,"regulation of hair cycle"),
c("GO:0043696","dedifferentiation",0.00164418376638295,0.7752054228639321,-0,"dedifferentiation"),
c("GO:0001649","osteoblast differentiation",0.0197105143730459,0.7092331093018841,0.48058164,"dedifferentiation"),
c("GO:0001763","morphogenesis of a branching structure",0.0242344810835427,0.6991888871512043,0.48079098,"dedifferentiation"),
c("GO:0001837","epithelial to mesenchymal transition",0.010812723481617215,0.6524950228253034,0.56386525,"dedifferentiation"),
c("GO:0002065","columnar/cuboidal epithelial cell differentiation",0.0133429943077275,0.663282330036933,0.6394182,"dedifferentiation"),
c("GO:0002066","columnar/cuboidal epithelial cell development",0.004280292769071781,0.6726178326432946,0.68349275,"dedifferentiation"),
c("GO:0002244","hematopoietic progenitor cell differentiation",0.019481608549283005,0.7162992497008498,0.43966864,"dedifferentiation"),
c("GO:0003401","axis elongation",0.0036403410037131475,0.7390911151309802,0.38397481,"dedifferentiation"),
c("GO:0007164","establishment of tissue polarity",0.01264397007172038,0.7228748992404291,0.44166076,"dedifferentiation"),
c("GO:0007492","endoderm development",0.016301540546039335,0.685520978327815,0.50113119,"dedifferentiation"),
c("GO:0007530","sex determination",0.011302532717410937,0.752436453730619,0.32928253,"dedifferentiation"),
c("GO:0010001","glial cell differentiation",0.04677308998888502,0.6685220661635977,0.50835209,"dedifferentiation"),
c("GO:0014706","striated muscle tissue development",0.08190890326001768,0.6561533260143725,0.68392032,"dedifferentiation"),
c("GO:0031128","developmental induction",0.004693800063611205,0.7638442693844106,0.29902926,"dedifferentiation"),
c("GO:0031214","biomineral tissue development",0.020889502433072,0.655222256413498,0.62582805,"dedifferentiation"),
c("GO:0042063","gliogenesis",0.05724614676427342,0.6662184042303732,0.62580583,"dedifferentiation"),
c("GO:0043697","cell dedifferentiation",0.00164418376638295,0.7628756555790596,0.33393846,"dedifferentiation"),
c("GO:0045165","cell fate commitment",0.1569284796306553,0.7001317317474133,0.55312389,"dedifferentiation"),
c("GO:0045444","fat cell differentiation",0.01588803325149991,0.735031042724569,0.40032628,"dedifferentiation"),
c("GO:0045445","myoblast differentiation",0.0035615777095151626,0.7403305502433064,0.35519199,"dedifferentiation"),
c("GO:0048863","stem cell differentiation",0.06843545724627476,0.7137781492584843,0.48022702,"dedifferentiation"),
c("GO:0051145","smooth muscle cell differentiation",0.009572201597998941,0.7274434529872453,0.63388363,"dedifferentiation"),
c("GO:0060008","Sertoli cell differentiation",0.0014177392955637411,0.6575677150354446,0.64589251,"dedifferentiation"),
c("GO:0060021","roof of mouth development",0.008299682126112734,0.7455129376677205,0.33943599,"dedifferentiation"),
c("GO:0060218","hematopoietic stem cell differentiation",0.0028034810028595507,0.7401611882077658,0.69038928,"dedifferentiation"),
c("GO:0060231","mesenchymal to epithelial transition",0.0011568358835329139,0.699168708522719,0.33734719,"dedifferentiation"),
c("GO:0061383","trabecula morphogenesis",0.00523283635827867,0.7345627856679037,0.41427304,"dedifferentiation"),
c("GO:0061430","bone trabecula morphogenesis",0.001073149883447554,0.7532667645274245,0.27938099,"dedifferentiation"),
c("GO:0061448","connective tissue development",0.04942396710923598,0.6671562349639846,0.61632665,"dedifferentiation"),
c("GO:0072074","kidney mesenchyme development",0.0011765267070824102,0.6332776379491162,0.69988699,"dedifferentiation"),
c("GO:1904238","pericyte cell differentiation",0.000920546000938957,0.7686005748450568,0.27748579,"dedifferentiation"),
c("GO:0044790","suppression of viral release by host",0.0014743504132685432,0.9765271114105651,-0,"suppression of viral release by host"),
c("GO:0006935","chemotaxis",0.48949664396987486,0.9655103095753972,0.4966975,"suppression of viral release by host"),
c("GO:0007166","cell surface receptor signaling pathway",1.7427092633657988,0.8385803274768175,0.31711329,"suppression of viral release by host"),
c("GO:0007178","cell surface receptor protein serine/threonine kinase signaling pathway",0.11133437770179636,0.8512960931835648,0.64919311,"suppression of viral release by host"),
c("GO:0007264","small GTPase-mediated signal transduction",0.3940010724607046,0.85165025356837,0.62275272,"suppression of viral release by host"),
c("GO:0016055","Wnt signaling pathway",0.19157448366599422,0.8507068916684952,0.46807378,"suppression of viral release by host"),
c("GO:0032924","activin receptor signaling pathway",0.02348376843571815,0.8615571477603926,0.69306107,"suppression of viral release by host"),
c("GO:0035567","non-canonical Wnt signaling pathway",0.03480845332962227,0.8629074500129538,0.55962791,"suppression of viral release by host"),
c("GO:0035791","platelet-derived growth factor receptor-beta signaling pathway",0.002156145178669856,0.8802123594473299,0.21421653,"suppression of viral release by host"),
c("GO:0036293","response to decreased oxygen levels",0.0754207769004586,0.9745665029104806,0.16101863,"suppression of viral release by host"),
c("GO:0038066","p38MAPK cascade",0.005077771122826385,0.8850881687159934,0.17267841,"suppression of viral release by host"),
c("GO:0042060","wound healing",0.12011402365192808,0.9753818086172611,0.28452185,"suppression of viral release by host"),
c("GO:0048009","insulin-like growth factor receptor signaling pathway",0.008432595185071836,0.8715265178334652,0.55649113,"suppression of viral release by host"),
c("GO:0060071","Wnt signaling pathway, planar cell polarity pathway",0.004162147827774802,0.8777872266868748,0.69204153,"suppression of viral release by host"),
c("GO:0070482","response to oxygen levels",0.09176416044654062,0.9742604358851812,0.65312863,"suppression of viral release by host"),
c("GO:0071773","cellular response to BMP stimulus",0.047555800224977504,0.9617906747177871,0.19870702,"suppression of viral release by host"),
c("GO:0051098","regulation of binding",0.005311599652476655,0.9117792194014593,-0,"regulation of binding"),
c("GO:0051099","positive regulation of binding",0.0008860870597273381,0.9147928366981131,0.38837777,"regulation of binding"),
c("GO:0070509","calcium ion import",0.0638647248298479,0.9952835990095447,0,"calcium ion import"),
c("GO:0034504","protein localization to nucleus",0.27573306351654187,0.992549650546284,0.19751312,"calcium ion import"),
c("GO:0070988","demethylation",0.056268989645629666,0.9949038752130966,0.03023276,"demethylation"),
c("GO:0071604","transforming growth factor beta production",0.00043319811808892095,0.8134168885559473,0.07594844,"transforming growth factor beta production"),
c("GO:0001503","ossification",0.058122388412226014,0.784815867998811,0.40299007,"transforming growth factor beta production"),
c("GO:0001701","in utero embryonic development",0.03609081821328322,0.6817967883114018,0.46416853,"transforming growth factor beta production"),
c("GO:0001710","mesodermal cell fate commitment",0.001511270707423849,0.6668393271584604,0.61958938,"transforming growth factor beta production"),
c("GO:0001738","morphogenesis of a polarized epithelium",0.020992879256706856,0.6470129336250325,0.68390617,"transforming growth factor beta production"),
c("GO:0001890","placenta development",0.012919641601413328,0.6914682698410537,0.44426244,"transforming growth factor beta production"),
c("GO:0003014","renal system process",0.013687583719843688,0.7995232321735403,0.34988814,"transforming growth factor beta production"),
c("GO:0003128","heart field specification",0.0012331378247872123,0.6719257493889591,0.63748076,"transforming growth factor beta production"),
c("GO:0003170","heart valve development",0.0062444524181340475,0.6667869316723468,0.60169104,"transforming growth factor beta production"),
c("GO:0003188","heart valve formation",0.0012872875895483275,0.6755585066591576,0.55926704,"transforming growth factor beta production"),
c("GO:0007389","pattern specification process",0.20576910609223742,0.6584954880052534,0.54119911,"transforming growth factor beta production"),
c("GO:0009798","axis specification",0.0314388611497147,0.6885099454676594,0.63503584,"transforming growth factor beta production"),
c("GO:0021978","telencephalon regionalization",0.0011445291188144785,0.6998093230090925,0.3082009,"transforming growth factor beta production"),
c("GO:0022405","hair cycle process",0.007871406713911188,0.8011848612619286,0.29446489,"transforming growth factor beta production"),
c("GO:0030879","mammary gland development",0.01283595560132797,0.6879596178818964,0.50420692,"transforming growth factor beta production"),
c("GO:0031016","pancreas development",0.02080335508004295,0.684058727430241,0.51817339,"transforming growth factor beta production"),
c("GO:0035270","endocrine system development",0.02078120290354977,0.6935626283777577,0.38809165,"transforming growth factor beta production"),
c("GO:0036302","atrioventricular canal development",0.001457120942662734,0.6880195120538557,0.44960202,"transforming growth factor beta production"),
c("GO:0042303","molting cycle",0.020793509668268203,0.7962732050622199,0.36945005,"transforming growth factor beta production"),
c("GO:0048565","digestive tract development",0.021748514610418778,0.66606787450965,0.61610271,"transforming growth factor beta production"),
c("GO:0048736","appendage development",0.028416319734867,0.6933343023002619,0.45024991,"transforming growth factor beta production"),
c("GO:0048839","inner ear development",0.03713689321435022,0.6736654457429592,0.55158298,"transforming growth factor beta production"),
c("GO:0055123","digestive system development",0.023363162141477486,0.6917329693987917,0.45759906,"transforming growth factor beta production"),
c("GO:0060039","pericardium development",0.0020035412961612593,0.6481952145235294,0.61103825,"transforming growth factor beta production"),
c("GO:0060173","limb development",0.021945422845913744,0.6931687316868006,0.44191483,"transforming growth factor beta production"),
c("GO:0060348","bone development",0.03279260526874257,0.6516157592586657,0.56734949,"transforming growth factor beta production"),
c("GO:0060433","bronchus development",0.0009008551773894604,0.6879540358932434,0.39281091,"transforming growth factor beta production"),
c("GO:0060502","epithelial cell proliferation involved in lung morphogenesis",0.0003642802356656835,0.6463226758725393,0.68875545,"transforming growth factor beta production"),
c("GO:0060541","respiratory system development",0.031716994032351335,0.6868537897598921,0.46938347,"transforming growth factor beta production"),
c("GO:0061437","renal system vasculature development",0.00183616929599054,0.6544882223906232,0.51946151,"transforming growth factor beta production"),
c("GO:0070294","renal sodium ion absorption",0.0015728045310160251,0.815159791171951,0.44512032,"transforming growth factor beta production"),
c("GO:0072001","renal system development",0.04924428834434682,0.6795582217632146,0.49171522,"transforming growth factor beta production"),
c("GO:0072111","cell proliferation involved in kidney development",0.0006670266477391908,0.6431162168951639,0.66707707,"transforming growth factor beta production"),
c("GO:0072224","metanephric glomerulus development",0.0009057778832768347,0.6486857134837208,0.67614135,"transforming growth factor beta production"),
c("GO:0090399","replicative senescence",0.001405432530845306,0.9899944386701443,0.024284,"replicative senescence"),
c("GO:1901722","regulation of cell proliferation involved in kidney development",0.0007999397066982915,0.8929349412583527,0.09700973,"regulation of cell proliferation involved in kidney development"),
c("GO:0033688","regulation of osteoblast proliferation",0.0039898531217167086,0.8843806862222756,0.52112899,"regulation of cell proliferation involved in kidney development"),
c("GO:0033689","negative regulation of osteoblast proliferation",0.0011445291188144785,0.8541650408125079,0.49199669,"regulation of cell proliferation involved in kidney development"),
c("GO:0048145","regulation of fibroblast proliferation",0.008311988890831169,0.8800067163510632,0.56513702,"regulation of cell proliferation involved in kidney development"),
c("GO:0048146","positive regulation of fibroblast proliferation",0.0056832639469734,0.8504589812497767,0.57329181,"regulation of cell proliferation involved in kidney development"),
c("GO:0048660","regulation of smooth muscle cell proliferation",0.011228692129100324,0.8781184349652696,0.59440527,"regulation of cell proliferation involved in kidney development"),
c("GO:0050678","regulation of epithelial cell proliferation",0.059951173649385486,0.8664355494473702,0.66552405,"regulation of cell proliferation involved in kidney development"),
c("GO:0072124","regulation of glomerular mesangial cell proliferation",0.0005193454711179677,0.8950240812119877,0.45976596,"regulation of cell proliferation involved in kidney development"),
c("GO:1904705","regulation of vascular associated smooth muscle cell proliferation",0.0043098290043960255,0.8807301233992616,0.54458427,"regulation of cell proliferation involved in kidney development"),
c("GO:2000136","regulation of cell proliferation involved in heart morphogenesis",0.0017377151782430578,0.8889678667555773,0.48423165,"regulation of cell proliferation involved in kidney development"),
c("GO:1902644","tertiary alcohol metabolic process",0.01463028189727583,0.9786058581883483,0.02775097,"tertiary alcohol metabolic process"),
c("GO:0042181","ketone biosynthetic process",0.3161140199106716,0.9617782217370203,0.22326908,"tertiary alcohol metabolic process"),
c("GO:0046165","alcohol biosynthetic process",0.5630541766919623,0.9633467956557272,0.63871207,"tertiary alcohol metabolic process"),
c("GO:1902645","tertiary alcohol biosynthetic process",0.0018164784724410432,0.9693893271562953,0.45315637,"tertiary alcohol metabolic process"),
c("GO:1905939","regulation of gonad development",0.0016712586487635074,0.8581465757909585,0.08806244,"regulation of gonad development"),
c("GO:0010717","regulation of epithelial to mesenchymal transition",0.01160774048242813,0.8296045815594957,0.59407269,"regulation of gonad development"),
c("GO:0010718","positive regulation of epithelial to mesenchymal transition",0.005597116593944353,0.7878272576573419,0.66136099,"regulation of gonad development"),
c("GO:0016202","regulation of striated muscle tissue development",0.009136542126966333,0.8457143814178889,0.43244497,"regulation of gonad development"),
c("GO:0030858","positive regulation of epithelial cell differentiation",0.00564142094693072,0.786708297000672,0.66163631,"regulation of gonad development"),
c("GO:0032330","regulation of chondrocyte differentiation",0.012171390306532465,0.799839872832882,0.62802213,"regulation of gonad development"),
c("GO:0045598","regulation of fat cell differentiation",0.018765354842670074,0.8252638965886576,0.64385988,"regulation of gonad development"),
c("GO:0045667","regulation of osteoblast differentiation",0.018669362077866278,0.8253113963988004,0.62633472,"regulation of gonad development"),
c("GO:0045669","positive regulation of osteoblast differentiation",0.010549358716642698,0.7995313433024506,0.60671009,"regulation of gonad development"),
c("GO:0045685","regulation of glial cell differentiation",0.0071600757131856305,0.8337603718355977,0.55074117,"regulation of gonad development"),
c("GO:0048634","regulation of muscle organ development",0.00969773059812698,0.8452385798327389,0.45211009,"regulation of gonad development"),
c("GO:0048710","regulation of astrocyte differentiation",0.002060152413866061,0.8420160974196945,0.40155869,"regulation of gonad development"),
c("GO:0051147","regulation of muscle cell differentiation",0.022767514729105216,0.8234545745434418,0.65138999,"regulation of gonad development"),
c("GO:0090183","regulation of kidney development",0.00425567923963491,0.8515645877515415,0.39757051,"regulation of gonad development"),
c("GO:0090184","positive regulation of kidney development",0.0007039469418944964,0.8165161717179306,0.52384559,"regulation of gonad development"),
c("GO:1901861","regulation of muscle tissue development",0.009308836833024425,0.8455655754340574,0.4506598,"regulation of gonad development"),
c("GO:1905207","regulation of cardiocyte differentiation",0.0026853360615625723,0.8416060793601013,0.51855388,"regulation of gonad development"),
c("GO:1905330","regulation of morphogenesis of an epithelium",0.009665733009859047,0.8429955451265463,0.45303026,"regulation of gonad development"),
c("GO:1905332","positive regulation of morphogenesis of an epithelium",0.00483163582845768,0.817880508480704,0.48526288,"regulation of gonad development"),
c("GO:2000027","regulation of animal organ morphogenesis",0.010172771716258579,0.8425799237921602,0.50485836,"regulation of gonad development"),
c("GO:2000725","regulation of cardiac muscle cell differentiation",0.0016023407663402697,0.8402812783872489,0.50628954,"regulation of gonad development"),
c("GO:2000826","regulation of heart morphogenesis",0.000635029059471259,0.8552615899999251,0.36463913,"regulation of gonad development"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap1.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
treemap(
  stuff,
  index = c("representative","description"),
  vSize = "uniqueness",
  type = "categorical",
  vColor = "representative",
  title = "Revigo TreeMap",
  inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
  lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
  bg.labels = "#CCCCCCAA",   # define background color of group labels
								 # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
  position.legend = "none"
)

dev.off()

