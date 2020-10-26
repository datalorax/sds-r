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
