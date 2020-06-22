---
title: "Myapproach"
date: 2020-06-21T08:40:40+01:00
---

# What is 

###SRE

- SRE measures how reliable my serivice is from my customer's perspective, not from my perspective.
- It seems most of the talks use current or historic data, logs, Why we do not estimate future data then ?
    - The reason is that usually you take generated logs, so it is hard to have a real-time observations.
    - How to have real-time observations? how to estimate the future?



### SLO
- Defines a threshold, max or min value, for an SLI.
- Defines what are your service expectations.
- Examples:
    - Uptime 999% i.e. SLI-1 over the last month 99.95 of the time.
    - 99% of valid requests in the past 28 days served in less than one second.


### SLI
- Includes the most relevant metrics to measure service of your system.
- If you see historical data, you can not take overall view, instead every slot should be analysed. For example, if we have a pick in a specific day, maybe the traffic was high at that time and that is where we need to guarantee reliability. This should be consider even if it occurs only once.
- Examples:
    - One a minute, ssh into the target host, report 1 if it's working 0 if not.
    - The proportion of valir requests that were serverd within less than one second.
    -

- How percentiles should be treated? can we aggregate along the time? When can be aggreagted when not? 

- Can we averga percentiles of many modules and for a long time of data analysis?
            
- If we do not use logs, what will be the benefit to counts events as soon as they happen, and evaluate SLI base on this fresh results?

### SLA

- Examples:
    - If we do not meet our SLO in one month, you will get exactly one cake
    - 

### Alerts

- Set an alert ONLY when a manual internvention is required, not for infomative purposes. Alerts mean action and now. If this is not possible, you can separate alerts that requries action and alerts where no action is required.
- Monitoring should be display in one place.

 
-

### Customer perception

- Collect data from customers, slack, twitter, emails, open public conversations and centralise them. Apply ML to analyse them and get insights for understand whether customer are happy or not with services.
