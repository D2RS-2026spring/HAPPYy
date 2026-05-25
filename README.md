# 小组信息
- 小组名称：好好学习 天天向上
- 小组成员:  
  刘卓益（2025303110003）[@Lzy-NICE](https://github.com/Lzy-NICE)  
  李俊杰（2025303120105）[@lijj2k](https://github.com/lijj2k)  
  朱烁龙（2025303120103）[@DragonBron23](https://github.com/DragonBron23)  
  高心灵（2025303120157）[@gaoxinling](https://github.com/gaoxinling)  
  章靖（2025303110106）[@zh–ang–jing](https://github.com/zh–ang–jing)  
# 论文信息
- 论文题目:《Multiple micronutrient deficiencies in early life cause multi-kingdom alterations in the gut microbiome and intrinsic antibiotic resistance genes in mice》
- DOI：10.1038/s41564-023-01519-3
# 项目内容
- 项目对公开发表在Nature Microbiology的论文进行结果进行复现。
- 论文数据与分析代码提供在 GitHub 仓库 https://github.com/armetcal/Littlejohn_Micronutrient_ARG_2023 中，源数据随文章提供。
- 本项目使用原始数据“Source Data Fig 1.xlsx”
- 复现结果具体内容为 论文Figure 1中的： (b-c) 按组和个体小鼠在门水平上绘制的条形图。条形代表平均相对丰度。(d) 第0天和第28天的细菌Shannon α多样性。 (e) 按日常和饮食治疗划分的 Bray-Curtis β细菌多样性。 (f) 肠杆菌 cfu 计数。
## 具体分工与文件
- **Fig.1b 复现（刘卓益）：**
代码文件：re包中的intro.qmd
结果图片：re包中的Fig_1b_Grouped_Phylum_Barplot.png

- **Fig.1c 复现  (李俊杰)：**
代码文件：plot_fig1c.R
结果图片：fig1c_phylum_abundance.png

- **Fig.1d 复现（高心灵）：**
代码文件：
结果图片：

- **Fig.1e 复现（朱烁龙）：**
代码文件：R Script
结果图片：fig_1d.png

- **Fig.1f 复现（章靖）：**
代码文件、结果图片：论文图1F复现

注：图片均用R生成，复现代码时需要将数据下载到自己电脑中，并改动R读取文件的代码，从而读取自己电脑中的文件。
