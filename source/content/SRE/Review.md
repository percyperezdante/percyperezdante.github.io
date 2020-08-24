---
title: "Review"
date: 2020-08-24T12:04:13+01:00
---

This section contains reviews or summaries from exisitng literature.


### 1. SQL is no excuse to avoid devops

```
@article{limoncelli2018sql,
  title={SQL is no excuse to avoid DevOps},
  author={Limoncelli, Thomas A},
  journal={Communications of the ACM},
  volume={62},
  number={1},
  pages={46--49},
  year={2018},
  publisher={ACM New York, NY, USA}
}
```


Automation and a little discipline allow better testing, shorter release cycles, and reduced business risk.

Previous  articles: 
- “The Small Batches Principle,”Communications, July 2016), when something is risky there is a natural inclination to seek to do it less.
- McHenry Technique in The Practice of Cloud System Administration, Strata R.  Chalup and Christina J. Hogan. 
    - It is also called Expand/Contract in Release It!: Design and Deploy Production-Ready Software by Michael T. Nygard.
- SQL migration tools:
    - https://github.com/bretcope/Mayflower.NET
    - https://bitbucket.org/liamstask/goose/src/master/


### Reliability: What is it, and how is it measured?

```
@article{bruton2000reliability,
  title={Reliability: what is it, and how is it measured?},
  author={Bruton, Anne and Conway, Joy H and Holgate, Stephen T},
  journal={Physiotherapy},
  volume={86},
  number={2},
  pages={94--99},
  year={2000},
  publisher={Elsevier}
}

```

how to quantify relibility`
how to measue
how to seect mesure metrics
how ti collect metrics
how to validate the methodology of collecting metrics
how to classify them
how to aggregate them
how to quantify errors
    errors in cpollectin
    errors in analysis
    errors agrregation
    errors per cases
how to store them
how to analize them
how to filter them
how to archive them
how to validate them
how to reuse them
hoe to reproduce them
how to transfort them
how long this measuremens and realibility is valid
how define good realibility?
    what is good?`
how important is reproucibility

Baumgarter (1989) has identified two types
of reliability, ie relative reliability and
absolute reliability.

### 3.  Nines are not enough: meaningful metrics for clouds

```
@inproceedings{mogul2019nines,
  title={Nines are not enough: meaningful metrics for clouds},
  author={Mogul, Jeffrey C and Wilkes, John},
  booktitle={Proceedings of the Workshop on Hot Topics in Operating Systems},
  pages={136--141},
  year={2019}
}
```


- This paper analyse: Why SLO are so hard to define?
- However, SLOs are not free. We have to spend resources
collecting and processing the data that allows us to com-
pute an SLO’s predicate, without significantly interfering
with “real" work – and without compromising security or
privacy of cloud customers and their own users. We often
must aggregate data to reduce costs, which loses fidelity.
(These costs are what we mean by the “feasibility" of a set
of SLOs.

- how to collect sufficient data without bias,
- When to triggerd the decision to claim an SLA?
- How much data you need to collect?
- How expensive it is?
- we have uncertain knowledge of future workloads, and we also
are unable to accurately model the performance of complex
computer systems even if we did know the workloads.
- By monitoring and collecting data, we can find the time when of SLA violation, which
can lead to a financial penalty in benefit of the customer, if the SLA says it. SLA's 
are very important from business and  law point of view.

- This paper present many interesting open questions.

### 4. Thinking about availabitliy in large service infrastrcuture.

```
@inproceedings{mogul2017thinking,
  title={Thinking about availability in large service infrastructures},
  author={Mogul, Jeffrey C and Isaacs, Rebecca and Welch, Brent},
  booktitle={Proceedings of the 16th Workshop on Hot Topics in Operating Systems},
  pages={12--17},
  year={2017}
}
```

### 5. Auditing to keep online storage services honest.

```
@inproceedings{shah2007auditing,
  title={Auditing to Keep Online Storage Services Honest.},
  author={Shah, Mehul A and Baker, Mary and Mogul, Jeffrey C and Swaminathan, Ram and others},
  booktitle={HotOS},
  year={2007}
}

```


### 6. Handbook of software reliability engineering.

```
@book{lyu1996handbook,
  title={Handbook of software reliability engineering},
  author={Lyu, Michael R and others},
  volume={222},
  year={1996},
  publisher={IEEE computer society press CA}
}

```
