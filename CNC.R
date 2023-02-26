library(readxl)
CNC_data <- read_excel("CNC_data.xlsx")

library(ggplot2)

b <- ggplot(CNC_data, aes(x=Nro)) +
  labs(title="X- ja Y-mitan erot pyydettyyn mittaan verrattuna", x="Kappaleen järjestysnumero", y="Ero [mm]") +
  geom_line(aes(y=`X_KA_ero`, colour="X")) +
  geom_line(aes(y=`Y_KA_ero`, colour="Y")) +
  geom_hline(yintercept = 0, colour = 'red', size = 1.5) +
  guides(color = guide_legend(title = ""))
  b
  ggsave("b.png")
  
c <- ggplot(CNC_data,aes(x=X, y=Y)) +
  labs(title="Sahattujen elementtien kokojakauma", x="X-suuntainen mitta [mm]", y="Y-suuntainen mitta [mm]") +
  geom_point(size = 2)
  c
  ggsave("c.png")