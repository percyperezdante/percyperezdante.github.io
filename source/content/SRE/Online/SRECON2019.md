---
title: "SRECON 2019"
date: 2020-06-20T16:52:44+01:00
---


### 1. [The SRE I Aspire to be by Yaniv Aknin at SRECON 2019](https://www.usenix.org/conference/srecon19emea/presentation/aknin)

- Yaniv A. is GCP quantitative reliability lead.
- SRE skill is the ability to measure or translate to numbers ( quantify ) 
- SRE includes: "measurably optimse reliability vs cost"
- It is important to trade Operations and Reliability
- How can we build a more reliable logical disk? then we do not need to increase operations due to failure. One solution as use RAIDs, but cost more and more complexity!
- SRE is trading cost and reliability
- Remove alerts, reduce operations
- Fundamental: Monitoring, Alerting, Capacity planning, CI/CD & rollouts, and Load Balancing.
- Advanced: System Architecture, Distributed Algorithms, Networking, Operating systems.
- Pioneering: Product management, data science, business Acumen, UX research.
- Measurements are tied to the project priorities and operations are tied to these measurements.

![Compound advanace realibility patterns](/sre/online/YanivA-compoundreliabilitypatterns.png?width=40pc)
![Availability estimation](/sre/online/yanivavailabilityestaimation.png?width=40pc)
![How to SRE](/sre/online/YanivA-howtosre.png?width=40pc)


### 2. [SLOs for Data intensive Services by Yoann Fouquet Booking.com](https://www.usenix.org/conference/srecon19emea/presentation/fouquet) [Youtube]([https://www.youtube.com/watch?v=ZdguHXglT8M&feature=youtu.be)

- Example for SLI/SLO:  \
    SLI = Quantitative measure: availability, \
    SLO = SLI + target|threshold: availability (SLI)  for 1 week over  99.99% 
- SLO Booking.com: Availability, latency, and reservation success rate.\
` Missing SLOs: durability, freshness, accuracy, completeness, consistency.
        - "...99.99% of search results are consistent ..."
        - "...99.9% of reservations are available within in 10 seconds..."
        - Booking.com group queries by latency. 
- Benefits: mitagation for free, 
- My opinion these SLOs/SLIs does not reflect the customer perception

### 3. [Latency SLos Done right by Heinrich Hartman, Circonus](https://www.usenix.org/conference/srecon19emea/presentation/hartmann-latency)

- Presentation in [here](https://www.usenix.org/sites/default/files/conference/protected-files/srecon19emea_slides_hartmann.pdf)
- What is latency?
    - Key perfomance indicator for API.
    - Latency is number one golden signal.
    - Besides latency, another golden signals, indicators, include traffic, errors and saturation.
    - This later became the RED method: Request, Errors, Durantion.

- What is an SLI?
    - A metric that quantifies the quality or reliability of your service.

- What is an SLA?
    - What happen if a published SLO is not met?

- What is an SLO?
    - A target value for the service level, as measured by SLI, set of expectations about how the service will perform.
    - Percentile metrics need to be compute percentiles over:
        - Multiple weeks of data, better long time periods
        - Multiple nodes ( potentially )
    - Percentiles can not be aggregated.

- Methods to stimate SLOs:

    - Considering the task: "count all request over $period served faster than $threshold"
    - Methods: 
        - log data: 
            - Execute a query in your stored logs
            - You need to keep your logs for long times, which could be expensive ( you could use sampling )
            - You can do this with ssh+awk, ELK, Splunk, Honeycomb,etc

        - counter metrics
            - It stores and uses counters of how often an event occurs: for example, " how many requests were faster than 2 ms", so you can store this as short prometheus metric: "aws.www33get./latency_2ms". 
            - Later you can sum/integrate these metrics across nodes, endpoint and time.
            - This approach does not required store logs, instead store counters at specific time.
            - Tools: prometheus histogram, graphite, datadog, vividcontext.
        - HDR historgram metrics
            - See below figure
            - WIth histograms you can aggregate latency histrograms over nodes, endpoints and time. Get total latency distribution over SLO timeframe ( weeks, months)
            - Count samples in bins below the thresholds to compute SLOs. You can sum or agregate two similar bins to get a final overll number.
            - Full flexibility in choosing thresholds, and aggregation intervals and levels
            - Cost effective ( 300b/histogram value).
            - Need HDR histogram instruments and metrics store
            - Tools: CIrconus,IronDB + graphite / Grafana

            - ![HDR histogram data structure](/sre/online/HeinrichH-hdrhistogramdatastructure.png)


    - Conclusions:
        - Percentiles metrics are not suitable for implementing latency SLOs
        - Histogram metrics allow you to easily calculcate arbitraty latency SLOs
        - If you do not have histrogram metrics:
            - Use historic recent logs
            - Ad counter metrics for the threshold
            - Aggregate couter metrics as needed



