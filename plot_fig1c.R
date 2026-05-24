# 构造和原图趋势一致的模拟数据
set.seed(123)
n_mice <- 10
mouse_id <- rep(1:n_mice, 4)
group <- rep(c("CON Day0", "LM Day0", "CON Day28", "LM Day28"), each = n_mice)
phyla <- c("Bacteroidetes", "Firmicutes", "Proteobacteria", "Verrucomicrobia", "Unknown/other")

df <- expand.grid(
  Mouse = mouse_id,
  Group = group,
  Phylum = phyla
) %>%
  mutate(
    RelAbundance = case_when(
      # Day0 两组：Bacteroidetes占主导，Firmicutes次之
      Group %in% c("CON Day0", "LM Day0") & Phylum == "Bacteroidetes" ~ runif(n(), 0.5, 0.85),
      Group %in% c("CON Day0", "LM Day0") & Phylum == "Firmicutes" ~ runif(n(), 0.05, 0.35),
      Group %in% c("CON Day0", "LM Day0") & Phylum == "Proteobacteria" ~ runif(n(), 0.01, 0.1),
      Group %in% c("CON Day0", "LM Day0") & Phylum == "Verrucomicrobia" ~ runif(n(), 0.01, 0.1),
      Group %in% c("CON Day0", "LM Day0") & Phylum == "Unknown/other" ~ runif(n(), 0.001, 0.05),
      
      # CON Day28：Firmicutes大幅升高
      Group == "CON Day28" & Phylum == "Bacteroidetes" ~ runif(n(), 0.05, 0.2),
      Group == "CON Day28" & Phylum == "Firmicutes" ~ runif(n(), 0.4, 0.7),
      Group == "CON Day28" & Phylum == "Proteobacteria" ~ runif(n(), 0.01, 0.1),
      Group == "CON Day28" & Phylum == "Verrucomicrobia" ~ runif(n(), 0.05, 0.2),
      Group == "CON Day28" & Phylum == "Unknown/other" ~ runif(n(), 0.001, 0.02),
      
      # LM Day28：Proteobacteria明显升高
      Group == "LM Day28" & Phylum == "Bacteroidetes" ~ runif(n(), 0.5, 0.8),
      Group == "LM Day28" & Phylum == "Firmicutes" ~ runif(n(), 0.1, 0.3),
      Group == "LM Day28" & Phylum == "Proteobacteria" ~ runif(n(), 0.05, 0.2),
      Group == "LM Day28" & Phylum == "Verrucomicrobia" ~ runif(n(), 0.01, 0.1),
      Group == "LM Day28" & Phylum == "Unknown/other" ~ runif(n(), 0.001, 0.02)
    )
  ) %>%
  group_by(Mouse, Group) %>%
  mutate(RelAbundance = RelAbundance / sum(RelAbundance)) %>%
  ungroup()

# 完全对齐原图的颜色和样式
colors <- c(
  "Bacteroidetes" = "#F68A8A",  # 原图的红色
  "Firmicutes" = "#C2C240",     # 原图的黄绿色
  "Proteobacteria" = "#33B899", # 原图的青绿色
  "Verrucomicrobia" = "#4D99E6",# 原图的蓝色
  "Unknown/other" = "#D988E6"  # 原图的紫色
)

p <- ggplot(df, aes(x = factor(Mouse), y = RelAbundance, fill = Phylum)) +
  geom_col(position = "stack", width = 0.8) +
  facet_wrap(~Group, nrow = 2, scales = "free_x") +  # 改成2行2列，和原图布局一致
  scale_fill_manual(values = colors) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 1)) +
  labs(x = "Mouse", y = "Rel. abundance") +
  theme_bw(base_size = 12) +
  theme(
    panel.grid = element_blank(),
    strip.background = element_rect(fill = "white", color = "black"),
    axis.text.x = element_text(angle = 0, hjust = 0.5),
    legend.position = "right",
    legend.title = element_text(size = 11),
    legend.key.size = unit(0.8, "lines")
  )

print(p)

# 保存高清图
ggsave("fig1c_phylum_abundance.png", p, width = 8, height = 6, dpi = 300, bg = "white")