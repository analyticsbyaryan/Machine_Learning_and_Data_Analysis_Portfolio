# Chicago Neighborhood Clustering and AI Analysis

## Overview
This project consists of two main parts:
1. **Clustering Analysis of Chicago Neighborhoods**:
   - Performed K-Means clustering to analyze socioeconomic patterns across Chicago neighborhoods.
   - Identified distinct clusters based on income, unemployment rates, and racial composition.

2. **Analysis of AI Implications**:
   - Insights from the documentary *"In the Age of AI"* on global AI advancements and societal impacts, including surveillance capitalism, job displacement, and data dominance.

---

## Objectives
### Clustering Analysis
- Identify socioeconomic clusters of Chicago neighborhoods based on key indicators.
- Visualize the clusters using a scatter plot of income vs. unemployment rates.
- Interpret the racial and economic disparities within the clusters.

### AI Analysis
- Discuss AI advancements, such as facial recognition and China's AI developments.
- Explore ethical and societal implications of surveillance capitalism and job displacement due to AI.

---

## Dataset
### Chicago Neighborhood Data
- **Observations**: 76 neighborhoods.
- **Variables**:
  - `Name`: Neighborhood name.
  - `Black`: Percentage of Black population.
  - `Hispanic`: Percentage of Hispanic population.
  - `Unemployment`: Unemployment rate.
  - `Income`: Median income level.

---

## Methodology
### Clustering Analysis
1. **Data Preparation**:
   - Imported the dataset with 5 variables and ensured consistent results using `set.seed(23)`.
2. **Elbow Method**:
   - Plotted within-cluster sum of squares for cluster sizes 1 through 15.
   - Determined the optimal cluster size as **3** based on the elbow graph.
3. **K-Means Clustering**:
   - Built a K-Means clustering model with 3 clusters.
   - Tabulated cluster centers to analyze socioeconomic differences.
4. **Visualization**:
   - Plotted clusters using `ggplot` with unemployment on the x-axis and income on the y-axis.

### AI Analysis
- Discussed pivotal moments in AI history, such as AlphaGo's victory over Lee Sedol and China's response.
- Explored implications of AI in data-driven economies, job markets, and privacy concerns.

---

## Results
### Clustering Insights
- **Cluster 1 (Wealthy Areas)**:
  - High income (> $100,000) and low unemployment.
- **Cluster 2 (Middle-Income Areas)**:
  - Moderate income (~$60,000–$90,000) and moderate unemployment.
- **Cluster 3 (Economically Disadvantaged Areas)**:
  - Low income (< $50,000) and high unemployment.

### AI Analysis Highlights
- **China's AI Strategy**:
  - Move 37 in AlphaGo vs. Lee Sedol catalyzed China's focus on AI.
  - China is considered the "new Saudi Arabia" of data.
- **Ethical Implications**:
  - Risks of surveillance capitalism, including manipulation, inequality, and erosion of privacy.
  - Potential for job displacement, with 50% of jobs threatened by AI in the next 10–15 years.

---

## Tools and Libraries
- **Programming Language**: R
- **Key Libraries**:
  - `ggplot2`: Visualized clusters.
  - `stats`: Performed K-Means clustering.
  - `rpart`: Conducted decision tree analysis for interpretability.

---

## How to Run
1. Open the `chicago_clustering_ai_analysis.R` script in RStudio.
2. Install required libraries:
   ```R
   install.packages(c("ggplot2", "stats", "rpart"))

##Limitations
Clustering results are based on limited variables and may not capture all socioeconomic factors.
The AI analysis is qualitative and relies on insights from the documentary.

##Future Work
Expand clustering analysis to include more variables for a richer understanding of neighborhood dynamics.
Implement advanced clustering algorithms (e.g., hierarchical clustering).
Explore additional AI advancements and ethical considerations.
