
State <- c ("Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware",
            "Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","lowa","Kansas","Kentucky",
            "Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi",
            "Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico",
            "New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania",
            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont",
            "Virginia","Washington","West Virginia","Wisconsin","Wyoming")

Murder <- c (13.2,10,8.1,8.8,9,7.9,3.3,5.9,15.4,17.4,5.3,2.6,10.4,7.2,2.2,6,9.7,15.4,2.1,11.3,4.4,
             12.1,2.7,16.1,9,6,4.3,12.2,2.1,7.4,11.4,11.1,13,0.8,7.3,6.6,4.9,6.3,3.4,14.4,3.8,13.2,
             12.7,3.2,2.2,8.5,4,5.7,2.6,6.8)

Assault <- c (236,263,294,190,276,204,110,238,335,NA,46,120,249,113,56,115,109,249,83,300,149,255,
              72,259,178,109,102,252,57,159,285,254,337,45,120,151,159,106,174,879,86,188,201,120,
              48,156,145,81,53,161)

UrbanPopulation <- c (58,48,80,50,91,78,77,72,80,60,83,54,83,65,570,66,52,66,51,67,85,74,66,44,70,
                      53,62,81,56,89,70,6,45,44,75,68,67,72,87,48,45,59,80,80,32,63,73,39,66,60)

US_State_Arrest_Stats_1973 <- data.frame(Murder,Assault,UrbanPopulation,row.names =State)

US_State_Arrest_Stats_1973


US_State_Arrest_Stats_1973$Assault[is.na(US_State_Arrest_Stats_1973$Assault)] <- 0

assaultMean <- mean(US_State_Arrest_Stats_1973$Assault)

US_State_Arrest_Stats_1973$Assault[US_State_Arrest_Stats_1973$Assault == 0] <- assaultMean

US_State_Arrest_Stats_1973


#assaultMean <-ceiling(assaultMean)


Murder_sorted <- US_State_Arrest_Stats_1973[order(US_State_Arrest_Stats_1973$Murder), "Murder"]
Murder_sorted

Assault_sorted <- US_State_Arrest_Stats_1973[order(US_State_Arrest_Stats_1973$Assault), "Assault"]
Assault_sorted

UrbanPopulation_sorted <- US_State_Arrest_Stats_1973[order(US_State_Arrest_Stats_1973$UrbanPopulation), "UrbanPopulation"]
UrbanPopulation_sorted


US_State_Arrest_Stats_1973$Assault[US_State_Arrest_Stats_1973$Assault == 879] <- assaultMean

US_State_Arrest_Stats_1973$UrbanPopulation[US_State_Arrest_Stats_1973$UrbanPopulation == 6] <- 60

US_State_Arrest_Stats_1973$UrbanPopulation[US_State_Arrest_Stats_1973$UrbanPopulation == 570] <- 57

US_State_Arrest_Stats_1973
UrbanPopulation_sorted <- US_State_Arrest_Stats_1973[order(US_State_Arrest_Stats_1973$UrbanPopulation), "UrbanPopulation"]
print(UrbanPopulation_sorted)

US_State_Arrest_Stats_1973$Assault <- ceiling(US_State_Arrest_Stats_1973$Assault)

US_State_Arrest_Stats_1973$Murder <- ifelse((US_State_Arrest_Stats_1973$Murder %% 1) >= 0.5, 
                                            ceiling(US_State_Arrest_Stats_1973$Murder), floor(US_State_Arrest_Stats_1973$Murder))


US_State_Arrest_Stats_1973


PopulationLevel <- ifelse(US_State_Arrest_Stats_1973$UrbanPopulation < 50, "Small", 
                   ifelse(US_State_Arrest_Stats_1973$UrbanPopulation < 60, "Medium",
                   ifelse(US_State_Arrest_Stats_1973$UrbanPopulation < 70, "Large", "Extra-Large")))

US_State_Arrest_Stats_1973$PopulationLevel <- PopulationLevel


US_State_Arrest_Stats_1973


OrderedFactorPopulation <- factor(PopulationLevel,levels <-c("Small","Medium","Large","Extra-Large"),labels <-c(1,2,3,4))

US_State_Arrest_Stats_1973$OrderedFactorPopulation <- OrderedFactorPopulation

US_State_Arrest_Stats_1973

colnames(US_State_Arrest_Stats_1973)[3] <- "Urban Population (%)"
colnames(US_State_Arrest_Stats_1973)[4] <- "Population Level"
colnames(US_State_Arrest_Stats_1973)[5] <- "Ordered Factor Population"

US_State_Arrest_Stats_1973