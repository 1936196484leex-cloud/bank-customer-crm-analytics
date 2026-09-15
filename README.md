# Bank Customer CRM Analytics

## Project Overview

This project analyzes bank marketing campaign data to identify customer characteristics associated with term deposit conversion.

The analysis uses Python and SQL to explore customer demographics, financial characteristics, previous campaign interactions, and conversion behavior. The final goal is to identify high-potential customer segments that can help improve marketing targeting efficiency.

## Business Questions

This project aims to answer the following questions:

1. What is the overall term deposit conversion rate?
2. Which customer segments have higher conversion rates?
3. How do financial characteristics such as housing loans, personal loans, and account balance relate to conversion?
4. How do current and previous marketing interactions relate to conversion?
5. Which customers should be prioritized in future marketing campaigns?

## Tools

- Python
- Pandas
- Matplotlib
- SQL
- SQLite
- Jupyter Notebook

## Dataset

The project uses the Bank Marketing dataset, which contains information about direct marketing campaigns conducted by a Portuguese banking institution.

The dataset contains 45,211 customer records and includes:

- Customer demographics: age, job, marital status, education
- Financial information: account balance, housing loan, personal loan
- Campaign information: contact method, campaign frequency, previous contacts
- Previous campaign outcome
- Target variable (`y`): whether the customer subscribed to a term deposit

## Key Findings

### 1. Overall Conversion Rate

The overall conversion rate is 11.70%, meaning that approximately 12 out of every 100 customers subscribed to a term deposit. This relatively low conversion rate suggests that better customer targeting may help improve campaign efficiency.

![Overall Conversion Rate](images/overall_conversion.png)


### 2. Financial Characteristics

Customers without housing loans showed a conversion rate approximately 9 percentage points higher than customers with housing loans.

Customers without personal loans also showed a conversion rate approximately 6 percentage points higher than customers with personal loans.

The conversion rate generally increases as customer account balances increase, suggesting that customers with higher balances may have a greater propensity to subscribe to term deposits.

![Conversion Rate by Balance](images/balance_conversion.png)


### 3. Marketing Interactions

Within the 1–5 contact range, the conversion rate generally decreases as the number of campaign contacts increases, suggesting that repeated contact does not necessarily improve marketing efficiency.

Customers who had been contacted in previous campaigns generally showed higher conversion rates than customers who had not been contacted before.

Customers with a previous campaign outcome of "success" showed a much higher conversion rate than customers with an outcome of "failure", with a difference of approximately 52.12 percentage points.

![Conversion Rate by Campaign Contacts](images/campaign_conversion.png)


### 4. Target Customer Segment

Customers with a balance of at least 1,500, no housing loan, no personal loan, and a successful previous campaign outcome showed a conversion rate of 67.01%, substantially higher than the overall conversion rate of 11.70%.

This suggests that the bank could prioritize this customer segment in future marketing campaigns.

![Overall vs Target Segment](images/target_segment.png)

However, this targeting rule was identified and evaluated using the same historical dataset, so its effectiveness should be validated on unseen data or through A/B testing before deployment.
