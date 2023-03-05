library(readr)
CNC_data <- read_delim("CNC_data.csv", delim = ";", 
     escape_double = FALSE, col_types = cols(Pvm = col_factor(levels = c("21.2.", 
         "22.2.", "23.2.", "24.2.")), Sijainti = col_factor(levels = c("1", 
         "2", "3")), X_luokka = col_factor(levels = c("1000-1999","2000-2999","3000-3999","4000-4999","8000-8999","9000-9999","10000-10999","13000-13999")), 
         Y_luokka = col_factor(levels = c("0-999","1000-1999","2000-2999","3000-3999"))), 
     trim_ws = TRUE)

library(ggplot2)

b <- ggplot(CNC_data, aes(x=Nro)) +
  labs(title="X- ja Y-mitan erot pyydettyyn mittaan verrattuna", x="Kappaleen järjestysnumero", y="Ero [mm]") +
  geom_line(aes(y=`X_KA_ero`, colour="X")) +
  geom_line(aes(y=`Y_KA_ero`, colour="Y")) +
  geom_hline(yintercept = 0, colour = 'red', linewidth = 1.5) +
  guides(color = guide_legend(title = ""))
  b
  ggsave("b.png")
  
c <- ggplot(CNC_data,aes(x=X, y=Y)) +
  labs(title="Sahattujen elementtien kokojakauma", x="X-suuntainen mitta [mm]", y="Y-suuntainen mitta [mm]") +
  geom_point(size = 2)
  c
  ggsave("c.png")
  
d <- ggplot(CNC_data, aes(x=`X_KA_ero`)) +
    #labs(title="Sahattujen elementtien kokojakauma", x="X-suuntainen mitta [mm]", y="Y-suuntainen mitta [mm]") +
    geom_histogram(binwidth = 0.5)
  d
  ggsave("d.png")

      
e <- ggplot(CNC_data, aes(x=`X_luokka`, y=`X_KA_ero`, fill = `X_luokka`)) +
  labs(title="Sahasvirheet elementin koon mukaan X-suunnaassa", x="Elementin kokoluokka", y="X-suuntainen sahausvirhe [mm]") +
  stat_boxplot(geom = "errorbar", width = 0.25) +     
  geom_boxplot()
  e
  ggsave("e.png")
  
f <- ggplot(CNC_data, aes(x=`Y_luokka`, y=`Y_KA_ero`, fill = `Y_luokka`)) +
  labs(title="Sahasvirheet elementin koon mukaan Y-suunnaassa", x="Elementin kokoluokka", y="Y-suuntainen sahausvirhe [mm]") +
  stat_boxplot(geom = "errorbar", width = 0.25) +     
  geom_boxplot()
  f
  ggsave("f.png")
  
g <- ggplot(CNC_data, aes(x=`Sijainti`, y=`X_KA_ero`, fill=`Sijainti`)) +
  labs(title="Sahausvirheet sahauspaikoittain", x="Sijainti pöydällä", y="X-suuntainen sahausvirhe [mm]") +
  stat_boxplot(geom = "errorbar", width = 0.25) +     
  geom_boxplot()
  g
  ggsave("g.png")

    
mean(CNC_data$X_KA_ero)
mean(CNC_data$Y_KA_ero)
median(CNC_data$X_KA_ero)
median(CNC_data$Y_KA_ero)