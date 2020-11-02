library(synthpop)

d <- rio::import(here::here("data", "OKA_1415_20180110_NCAASE_Research_Agreement_8519.xlsx"), setclass = "tbl_df")

simulate_from <- d %>% 
  select(-pkID, -SchlYr, -aSchlID, -aDistID, -RptChkDigitStdntID) %>% 
  mutate_if(is.character, as.factor)

set.seed(8675309)
simulated <- syn(simulate_from)$syn

simulated$sid <- seq_len(nrow(simulated))
simulated$schid <- as.numeric(as.factor(d$aSchlID))
simulated$distid <- as.numeric(as.factor(d$aDistID))

simulated <- simulated %>% 
  select(sid, schid, distid, everything())

ggplot(simulated, aes(ELit_LScorr)) +
  geom_histogram()

#dir.create(here::here("data"))
write_csv(janitor::clean_names(simulated),
          here::here("data", "k-entry.csv"))



################# Violence
violence <- read_csv(here::here("raw_data", "CommViolPredUnnormalizedData.txt"),
                     col_names = FALSE,
                     na = "?")

violence_colnames <- c("communityname", "State", "countyCode", "communityCode", 
                       "fold", "pop", "perHoush", "pctBlack", "pctWhite", 
                       "pctAsian", "pctHisp", "pct12-21", "pct12-29", 
                       "pct16-24", "pct65up", "persUrban", "pctUrban", 
                       "medIncome", "pctWwage", "pctWfarm", "pctWdiv", 
                       "pctWsocsec", "pctPubAsst", "pctRetire", "medFamIncome", 
                       "perCapInc", "whitePerCap", "blackPerCap", "NAperCap", 
                       "asianPerCap", "otherPerCap", "hispPerCap", 
                       "persPoverty", "pctPoverty", "pctLowEdu", 
                       "pctNotHSgrad", "pctCollGrad", "pctUnemploy", 
                       "pctEmploy", "pctEmployMfg", "pctEmployProfServ", 
                       "pctOccupManu", "pctOccupMgmt", "pctMaleDivorc", 
                       "pctMaleNevMar", "pctFemDivorc", "pctAllDivorc", 
                       "persPerFam", "pct2Par", "pctKids2Par", 
                       "pctKids-4w2Par", "pct12-17w2Par", "pctWorkMom-6", 
                       "pctWorkMom-18", "kidsBornNevrMarr", 
                       "pctKidsBornNevrMarr", "numForeignBorn", 
                       "pctFgnImmig-3", "pctFgnImmig-5", "pctFgnImmig-8", 
                       "pctFgnImmig-10", "pctImmig-3", "pctImmig-5", 
                       "pctImmig-8", "pctImmig-10", "pctSpeakOnlyEng", 
                       "pctNotSpeakEng", "pctLargHousFam", "pctLargHous", 
                       "persPerOccupHous", "persPerOwnOccup", 
                       "persPerRenterOccup", "pctPersOwnOccup", 
                       "pctPopDenseHous", "pctSmallHousUnits", "medNumBedrm", 
                       "houseVacant", "pctHousOccup", "pctHousOwnerOccup", 
                       "pctVacantBoarded", "pctVacant6up", "medYrHousBuilt", 
                       "pctHousWOphone", "pctHousWOplumb", "ownHousLowQ", 
                       "ownHousMed", "ownHousUperQ", "ownHousQrange", 
                       "rentLowQ", "rentMed", "rentUpperQ", "rentQrange", 
                       "medGrossRent", "medRentpctHousInc", "medOwnCostpct", 
                       "medOwnCostPctWO", "persEmergShelt", "persHomeless", 
                       "pctForeignBorn", "pctBornStateResid", "pctSameHouse-5", 
                       "pctSameCounty-5", "pctSameState-5", "numPolice", 
                       "policePerPop", "policeField", "policeFieldPerPop", 
                       "policeCalls", "policCallPerPop", "policCallPerOffic", 
                       "policePerPop2", "racialMatch", "pctPolicWhite", 
                       "pctPolicBlack", "pctPolicHisp", "pctPolicAsian", 
                       "pctPolicMinority", "officDrugUnits", 
                       "numDiffDrugsSeiz", "policAveOT", "landArea", 
                       "popDensity", "pctUsePubTrans", "policCarsAvail", 
                       "policOperBudget", "pctPolicPatrol", "gangUnit", 
                       "pctOfficDrugUnit", "policBudgetPerPop", "murders", 
                       "murdPerPop", "rapes", "rapesPerPop", "robberies", 
                       "robbbPerPop", "assaults", "assaultPerPop", "burglaries", 
                       "burglPerPop", "larcenies", "larcPerPop", "autoTheft", 
                       "autoTheftPerPop", "arsons", "arsonsPerPop", 
                       "violentPerPop", "nonViolPerPop")
names(violence) <- violence_colnames

write_csv(violence,
          here::here("data", "violence.csv"))
