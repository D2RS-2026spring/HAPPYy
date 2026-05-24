# 论文 Fig.1f 复现代码
# 肠杆菌科数量箱线图

library(tidyverse)
library(ggpubr)

comps <- list(
  c("CON Day 0", "LM Day 0"),
  c("CON Day 0", "CON Day 28"),
  c("LM Day 0", "LM Day 28"),
  c("LM Day 28", "CON Day 28")
)

set.seed(123)
n <- 10
sim_data <- data.frame(
  Sample = paste0("Sample_", 1:(4*n)),
  Group = rep(c("CON_Day0","LM_Day0","CON_Day28","LM_Day28"), each=n),
  CFU = c(
    rnorm(n, 1e5, 2e4),
    rnorm(n, 1.5e5, 3e4),
    rnorm(n, 8e4, 1.5e4),
    rnorm(n, 8e5, 2e5)
  )
)

sim_data$Group <- factor(sim_data$Group, levels = c("CON_Day0","LM_Day0","CON_Day28","LM_Day28"))

p <- ggplot(sim_data, aes(Group, CFU, fill=Group)) +
  geom_boxplot(alpha=0.7) +
  geom_jitter(width=0.2) +
  scale_y_log10() +
  stat_compare_means(comparisons=comps) +
  theme_classic()

print(p)
ggsave("Fig1f.png",width=6,height=4)
