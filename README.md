# Amazon-Shopper-Reviews

<p>In this project, reviews on <strong>toys</strong> and <strong>sports</strong> sold in Amazon were loaded from Amazon s3 to two separate ZEPL notebooks for ETL process. DataFrames were uploaded to Amazon Relational Database Service (RDS) instance.<p>

<p>Data analysis were executed by both <code>pyspark</code> and <code>mySQL</code>, from which I first found that averages of total as well as helpful votes were negatively correlated with the star rating. It seems that people were apt to keep silent but throwing out a higher ranking if they were pleased with their purchase.</p>
<p><strong>TOYS:</strong></p>
<img src="/figures/TOYS_avg_helpful_or_total_votes_per_star_rating.png" alt="corrlation threshold">
<p><strong>SPORTS:</strong></p>
<img src="/figures/SPORTS_avg_helpful_or_total_votes_per_star_rating.png" alt="corrlation threshold">

<p>Once dividing the reviews by total votes, it became clear that the average of helpful votes form vine customers does not outweigh over those from non vine customers in that in total votes are note greater than two. Only when going beyond that range are reviews from vine costomers more helpful.</p>
<p><strong>TOYS:</strong></p>
<img src="/figures/TOYS_avg_helpful_votes_by_total_votes.png" alt="corrlation threshold">
<p><strong>SPORTS:</strong></p>
<img src="/figures/SPORTS_avg_helpful_votes_by_total_votes.png" alt="corrlation threshold">
