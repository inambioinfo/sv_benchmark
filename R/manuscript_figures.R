source("libmanuscript_figures.R")

#generate_figures(datadir, sample_name, ids, truth_id, truth_name, grtransformName, allow_missing_callers=TRUE)

ignore.interchromosomal <- TRUE
mineventsize <- 51
maxeventsize <- NULL #TODO: what max event size should we use? Need one for chm since truth only has calls under a certain size
maxgap <- 200
sizemargin <- 0.25
ignore.strand <- TRUE
nominalPosition <- FALSE
longread_requiredHits <-5
longread_minMapq <- 0

# NA12878
na12878_truth <- c(
	"Parikh et al"="00000000000000000000000000000003",
	# TODO: which truth sets are these?
	"0001"="00000000000000000000000000000001", # Mills 2010?
	"0000"="00000000000000000000000000000000", # Kidd 2008?
	"0002"="00000000000000000000000000000002" # Sudmunt 2015?
		)
datadir <- "../data.na12878"
sample_name <- "NA12878"
ids <- c(
	#"2f4d15f5f6e428fb91e12dac971571b9", #bcftools/1.3.1
	"26511afa5055a939fdf99a2ac24938cc", #manta/1.1.1
	"6ae03359fcf0a39aa236a0aaea7ea915", #breakdancer/1.4.5
	"80dd0c2aa34964f330702ee3d0bfa53f", #hydra/master20160129
	"8aaf2886ffe782e666661d6b890b330a", #gridss/1.4.1
	"215312bf8994d7370151e8f9e6995ba5", #pindel/0.2.5b6 # broken"8d6a1ff660ab1a5374891f760903bdfb", #pindel/0.2.5b6
	"a6cbc4fc76337d871ef899d51fbae0d9", #socrates/1.13.1
	"b6aeda0d81ff8c839e381b57898dc3d8", #crest
	"e57987b7dec305f8be3a91fa95108c61", #cortex/1.0.5.14
	"f849b9493f2dd5dc20b6b7e49e1c89d7", #delly/0.7.6
	"fa5f9a52d3b67a206cb6e581053a9269") #lumpy/0.2.11
grtransformName <- "DAC"
longreadbedpedir <- paste0(datadir, "/../", "input.na12878/longread/")
for (i in seq_along(na12878_truth)) {
	truth_id <- na12878_truth[i]
	truth_name <- names(na12878_truth)[i]
	generate_figures(
		datadir, sample_name, ids, truth_id, truth_name,
		grtransformName,
		longreadbedpedir = NULL,
		#### LONG READS NOT WORKING ###
		# longreadbedpedir = longreadbedpedir,
		#### CORTEX NOT FINISHED ###
		allow_missing_callers = TRUE,
		eventtype = "DEL")
}

## chm datasets

longreadbedpedir <- NULL #TODO use Eichler PacBio reads directly

#chm13
datadir <- "../data.chm13"
sample_name <- "chm13"
ids <- c(
    "1bf3f864802712ffbe88f5bf29c7035a", # breakdancer/1.4.5
    "3b4917f2b3fc05710961bd98fe795863", # hydra/master20160129
    "48321dad78b7fdd801f6778c438799b3", # delly/0.7.6
    "4c7e0c2ae616fe15db24b2caf3786b93", # socrates/1.13.1
    "5ececd73193ffa02446ec5e2ea269fab", # pindel/0.2.5b6
    "6ab531d72c9b112e4a798e4285205cf3", # lumpy/0.2.11
    "907ff8ccd8657b8554ec31feb09f461b", # gridss/1.4.1
    "a6034953f1524610656f002b74faa1c4", # crest
    "b264ac30faf22d80ef51d8c4a25b1275"  # manta/1.1.1
    # "c639766990fcfbca2eb45f7806362fe6" # bcftools/1.3.1
	)
truth_id <- "00000000000000000000000000000013"
truth_name <- "Huddleston et al"
grtransformName <- "None"
generate_figures(
	datadir, sample_name, ids, truth_id, truth_name,
	grtransformName, allow_missing_callers = TRUE, eventtype = "DEL")

#chm1
datadir <- "../data.chm1"
sample_name <- "chm1"
ids <- c(
    "16c58fbcc5633564b10ebe8f78d87883", # manta/1.1.1
    "43a13d07730deb934e9fc01e3b3cd26f", # hydra/master20160129
    "74a311b09582df074b2bd839b06f8775", # pindel/0.2.5b6
    "8dcad8fe04f4ebc0ad3254ab4420cdc8", # breakdancer/1.4.5
    # "94bb6deef9f1bf1f9027a47e8488ae4f", # bcftools/1.3.1
    "9d134f160ac68c0445002fbb78db4a5e", # delly/0.7.6
    "acd889cc16741fb0fba62faa4f7005f3", # lumpy/0.2.11
    "b1112f1c3cbd28c464f58fc5c5c02f9b", # gridss/1.4.1
    "b142875fd36e402e4aff5f9e31f257f7")  # socrates/1.13.1

truth_id <- "00000000000000000000000000000001"
truth_name <- "Huddleston et al"
grtransformName <- "None"
generate_figures(
	datadir, sample_name, ids, truth_id, truth_name,
	grtransformName, allow_missing_callers = TRUE, eventtype = "DEL")

