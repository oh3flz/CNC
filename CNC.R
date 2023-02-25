library(readxl)
CNC_raakadata <- read_excel("CNC_raakadata.xlsx")

library(ggplot2)

b <- ggplot(CNC_raakadata, aes(x=Nro)) +
  labs(title="X- ja Y-mitan erot pyydettyyn mittaan verrattuna", x="Kappaleen järjestysnumero", y="Ero [mm]") +
  geom_line(aes(y=`X1_ero`, colour="X")) +
  geom_line(aes(y=`Y1_ero`, colour="Y")) +
  geom_hline(yintercept = 0, colour = 'red', size = 1.5) +
  guides(color = guide_legend(title = ""))
  b
  ggsave("b.png")
  
c <- ggplot(CNC_raakadata,aes(x=X, y=Y)) +
  labs(title="Sahattujen elementtien kokojakauma", x="X-suuntainen mitta [mm]", y="Y-suuntainen mitta [mm]") +
  geom_point(size = 2)
  c
  ggsave("c.png")