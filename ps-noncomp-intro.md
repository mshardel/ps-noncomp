Tutorial on using functions to compute sample size for studies with expected all-or-none non-compliance and selection bias
==========================================================================================================================

Setting up
----------

First, source the code for the three functions used in this tutorial.
The function ss.noncomp() is used to compute sample size without pilot
data, whereas ss.noncomp.expilot() is used when leveraging external
pilot data, and ss.noncomp.inpilot() is used in the presence of internal
pilot data.

    source("ss.noncomp.R")
    source("ss.noncomp.expilot.R")
    source("ss.noncomp.inpilot.R")

These function will be demonstrated for the scenarios listed in Table 1
of Shardell and El-Kamary (2009).

Computing sample size *without* pilot data
------------------------------------------

The function ss.noncomp() takes as arguments the means and variances by
compliance group (compliers, always takers, and never takers). For
compliers, separate means are provided according to treatment assigned,
which are used to compute delta, the mean difference of interest to be
detected. The function also takes the compliance group proportions as
arguments as well as ratio of the number of participants assigned to the
treatment group to the number of participants assigned to the control
group. The function can be refined for normally and Bernoulli
distributed data.

### No refinement

First, implement the six scenarios for normal data in Table 1 of
Shardell and El-Kamary (2009) for two-sided tests with default sig.level
(0.05), power (0.8), and ss.ratio (1) and with no refinement.

    #scenario 1, no refinement
    ss.noncomp(mu.c0=0,mu.c1=0.5, sigma.c0.sq=1.2,sigma.c1.sq=1.0, rho.a=0.25,rho.n=0.25, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 289
    ##              n1 = 289
    ##           mu.c0 = 0
    ##           mu.c1 = 0.5
    ##           delta = 0.5
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.25
    ##     sigma.c0.sq = 1.2
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 1
    ##      sigma.n.sq = 1.2
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = NULL
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 2, no refinement
    ss.noncomp(mu.c0=0,mu.c1=0.5, mu.a=1.0, mu.n=-0.5, sigma.c0.sq=1.2,sigma.c1.sq=1.0, rho.a=0.25,rho.n=0.25, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 351
    ##              n1 = 351
    ##           mu.c0 = 0
    ##           mu.c1 = 0.5
    ##           delta = 0.5
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.25
    ##     sigma.c0.sq = 1.2
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 1
    ##      sigma.n.sq = 1.2
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = NULL
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 3, no refinement
    ss.noncomp(mu.c0=0,mu.c1=0.5, mu.a=1.0, mu.n=-0.5, sigma.c0.sq=1.2,sigma.c1.sq=1.0, sigma.n.sq=1.4,sigma.a.sq=1.2, 
              rho.a=0.25,rho.n=0.25, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 376
    ##              n1 = 376
    ##           mu.c0 = 0
    ##           mu.c1 = 0.5
    ##           delta = 0.5
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.25
    ##     sigma.c0.sq = 1.2
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 1.2
    ##      sigma.n.sq = 1.4
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = NULL
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 4, no refinement
    ss.noncomp(mu.c0=0,mu.c1=0.5, mu.a=0.3, mu.n=0.2, sigma.c0.sq=1.2,sigma.c1.sq=1.0, sigma.n.sq=1.2,sigma.a.sq=1.0, 
              rho.a=0.25,rho.n=0.25, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 281
    ##              n1 = 281
    ##           mu.c0 = 0
    ##           mu.c1 = 0.5
    ##           delta = 0.5
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.25
    ##     sigma.c0.sq = 1.2
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 1
    ##      sigma.n.sq = 1.2
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = NULL
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 5, no refinement
    ss.noncomp(mu.c0=0,mu.c1=0.5, mu.a=1.5, mu.n=-1.0, sigma.c0.sq=1.2,sigma.c1.sq=1.0, sigma.n.sq=2.0,sigma.a.sq=2.0, 
              rho.a=0.25,rho.n=0.25, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 590
    ##              n1 = 590
    ##           mu.c0 = 0
    ##           mu.c1 = 0.5
    ##           delta = 0.5
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.25
    ##     sigma.c0.sq = 1.2
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 2
    ##      sigma.n.sq = 2
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = NULL
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 6, no refinement
    ss.noncomp(mu.c0=0,mu.c1=0.5, mu.a=0.3, mu.n=0.2, sigma.c0.sq=1.2,sigma.c1.sq=1.0, sigma.n.sq=0.6,sigma.a.sq=0.5, 
              rho.a=0.25,rho.n=0.25, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 212
    ##              n1 = 212
    ##           mu.c0 = 0
    ##           mu.c1 = 0.5
    ##           delta = 0.5
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.25
    ##     sigma.c0.sq = 1.2
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 0.5
    ##      sigma.n.sq = 0.6
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = NULL
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

The results of the above calculations match the “Proposed” column for
normally distributed data shown in Table 2 of Shardell and El-Kamary
(2009).

### Normal refinement

Next, compare the calculations to those when using normal refinement:

    #scenario 1, normal refinement
    ss.noncomp(mu.c0=0,mu.c1=0.5, sigma.c0.sq=1.2,sigma.c1.sq=1.0, rho.a=0.25,rho.n=0.25, alternative="two.sided", refinement="Normal")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 290
    ##              n1 = 290
    ##           mu.c0 = 0
    ##           mu.c1 = 0.5
    ##           delta = 0.5
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.25
    ##     sigma.c0.sq = 1.2
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 1
    ##      sigma.n.sq = 1.2
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = Normal
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 2, normal refinement
    ss.noncomp(mu.c0=0,mu.c1=0.5, mu.a=1.0, mu.n=-0.5, sigma.c0.sq=1.2,sigma.c1.sq=1.0, rho.a=0.25,rho.n=0.25, alternative="two.sided", refinement="Normal")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 352
    ##              n1 = 352
    ##           mu.c0 = 0
    ##           mu.c1 = 0.5
    ##           delta = 0.5
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.25
    ##     sigma.c0.sq = 1.2
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 1
    ##      sigma.n.sq = 1.2
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = Normal
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 3, normal refinement
    ss.noncomp(mu.c0=0,mu.c1=0.5, mu.a=1.0, mu.n=-0.5, sigma.c0.sq=1.2,sigma.c1.sq=1.0, sigma.n.sq=1.4,sigma.a.sq=1.2, 
              rho.a=0.25,rho.n=0.25, alternative="two.sided", refinement="Normal")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 377
    ##              n1 = 377
    ##           mu.c0 = 0
    ##           mu.c1 = 0.5
    ##           delta = 0.5
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.25
    ##     sigma.c0.sq = 1.2
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 1.2
    ##      sigma.n.sq = 1.4
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = Normal
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 4, normal refinement
    ss.noncomp(mu.c0=0,mu.c1=0.5, mu.a=0.3, mu.n=0.2, sigma.c0.sq=1.2,sigma.c1.sq=1.0, sigma.n.sq=1.2,sigma.a.sq=1.0, 
              rho.a=0.25,rho.n=0.25, alternative="two.sided", refinement="Normal")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 282
    ##              n1 = 282
    ##           mu.c0 = 0
    ##           mu.c1 = 0.5
    ##           delta = 0.5
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.25
    ##     sigma.c0.sq = 1.2
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 1
    ##      sigma.n.sq = 1.2
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = Normal
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 5, normal refinement
    ss.noncomp(mu.c0=0,mu.c1=0.5, mu.a=1.5, mu.n=-1.0, sigma.c0.sq=1.2,sigma.c1.sq=1.0, sigma.n.sq=2.0,sigma.a.sq=2.0, 
              rho.a=0.25,rho.n=0.25, alternative="two.sided", refinement="Normal")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 591
    ##              n1 = 591
    ##           mu.c0 = 0
    ##           mu.c1 = 0.5
    ##           delta = 0.5
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.25
    ##     sigma.c0.sq = 1.2
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 2
    ##      sigma.n.sq = 2
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = Normal
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 6, normal refinement
    ss.noncomp(mu.c0=0,mu.c1=0.5, mu.a=0.3, mu.n=0.2, sigma.c0.sq=1.2,sigma.c1.sq=1.0, sigma.n.sq=0.6,sigma.a.sq=0.5, 
              rho.a=0.25,rho.n=0.25, alternative="two.sided", refinement="Normal")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 213
    ##              n1 = 213
    ##           mu.c0 = 0
    ##           mu.c1 = 0.5
    ##           delta = 0.5
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.25
    ##     sigma.c0.sq = 1.2
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 0.5
    ##      sigma.n.sq = 0.6
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = Normal
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

In the six scenarios considered, normal refinement led to negligible
difference in the calculated required sample size.

### Bernoulli refinement

Lastly, implement the six scenarios for Bernoulli data in Table 1 of
Shardell and El-Kamary (2009) for two-sided tests with default sig.level
(0.05), power (0.8), and ss.ratio (1) and with Bernoulli refinement.
Variances are not required because they are computed based on the
user-inputted means (proportions):

    ss.noncomp(mu.c0=0.6,mu.c1=0.8, mu.a=0.8, mu.n=0.6, 
              rho.a=0.25,rho.n=0.25, alternative="two.sided", refinement="Bernoulli")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 329
    ##              n1 = 329
    ##           mu.c0 = 0.6
    ##           mu.c1 = 0.8
    ##           delta = 0.2
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.1
    ##     sigma.c0.sq = NULL
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 1
    ##      sigma.n.sq = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = Bernoulli
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 2, bernoulli refinement
    ss.noncomp(mu.c0=0.6,mu.c1=0.8, mu.a=0.6, mu.n=0.6, 
              rho.a=0.25,rho.n=0.25, alternative="two.sided", refinement="Bernoulli")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 356
    ##              n1 = 356
    ##           mu.c0 = 0.6
    ##           mu.c1 = 0.8
    ##           delta = 0.2
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.1
    ##     sigma.c0.sq = NULL
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 1
    ##      sigma.n.sq = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = Bernoulli
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 3, bernoulli refinement
    ss.noncomp(mu.c0=0.6,mu.c1=0.8, mu.a=0.6, mu.n=0.4, 
              rho.a=0.25,rho.n=0.25, alternative="two.sided", refinement="Bernoulli")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 376
    ##              n1 = 376
    ##           mu.c0 = 0.6
    ##           mu.c1 = 0.8
    ##           delta = 0.2
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.1
    ##     sigma.c0.sq = NULL
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 1
    ##      sigma.n.sq = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = Bernoulli
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 4, bernoulli refinement
    ss.noncomp(mu.c0=0.6,mu.c1=0.8, mu.a=0.9, mu.n=0.8, 
              rho.a=0.25,rho.n=0.25, alternative="two.sided", refinement="Bernoulli")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 273
    ##              n1 = 273
    ##           mu.c0 = 0.6
    ##           mu.c1 = 0.8
    ##           delta = 0.2
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.1
    ##     sigma.c0.sq = NULL
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 1
    ##      sigma.n.sq = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = Bernoulli
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 5, bernoulli refinement
    ss.noncomp(mu.c0=0.6,mu.c1=0.8, mu.a=0.2, mu.n=0.2, 
              rho.a=0.25,rho.n=0.25, alternative="two.sided", refinement="Bernoulli")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 388
    ##              n1 = 388
    ##           mu.c0 = 0.6
    ##           mu.c1 = 0.8
    ##           delta = 0.2
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.1
    ##     sigma.c0.sq = NULL
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 1
    ##      sigma.n.sq = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = Bernoulli
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 6, bernoulli refinement
    ss.noncomp(mu.c0=0.6,mu.c1=0.8, mu.a=1.0, mu.n=1.0, 
              rho.a=0.25,rho.n=0.25, alternative="two.sided", refinement="Bernoulli")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance 
    ## 
    ##              n0 = 199
    ##              n1 = 199
    ##           mu.c0 = 0.6
    ##           mu.c1 = 0.8
    ##           delta = 0.2
    ##           rho.a = 0.25
    ##           rho.n = 0.25
    ##      delta.star = 0.1
    ##     sigma.c0.sq = NULL
    ##     sigma.c1.sq = 1
    ##      sigma.a.sq = 1
    ##      sigma.n.sq = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ##      refinement = Bernoulli
    ## 
    ## NOTE: n0 is number in *control* group
    ##  n1 is number in *treatment* group

The results of the above calculations match the “Proposed” column for
Bernoulli distributed data shown in Table 2 of Shardell and El-Kamary
(2009).

Computing sample size with *external* pilot data
------------------------------------------------

The function ss.noncomp.expilot() takes as arguments the estimated
variances by treatment group and compliance subgroup proportions based
on external pilot data as well as the pilot data sample sizes in both
groups. Additionally, users provide the value of delta of interest to be
detected.

To adapt the six scenarios for normally distributed data in Table 1 of
Shardell and El-Kamary (2009) for external pilot data, the function
var.f computes expected pilot data variances:

    var.f <- function(rho.a, rho.n, rho.cp, mu.c1, mu.c0, mu.a, mu.n, 
                      sigma.c0.sq, sigma.c1.sq, sigma.n.sq, sigma.a.sq){

    mu.0 <- rho.a*mu.a + rho.n*mu.n + rho.cp*mu.c0
    mu.1 <- rho.a*mu.a + rho.n*mu.n + rho.cp*mu.c1

    sigma.0p.sq <- rho.cp*sigma.c0.sq + rho.a*sigma.a.sq + rho.n*sigma.n.sq + 
                   rho.cp*(mu.c0-mu.0)^2 + rho.a*(mu.a-mu.0)^2 + rho.n*(mu.n-mu.0)^2


    sigma.1p.sq <- rho.cp*sigma.c1.sq + rho.a*sigma.a.sq + rho.n*sigma.n.sq + 
                   rho.cp*(mu.c1-mu.1)^2 + rho.a*(mu.a-mu.1)^2 + rho.n*(mu.n-mu.1)^2

    return(c(sigma.0p.sq, sigma.1p.sq))
    }

For each scenario, consider pilot studies of size n0.p + n1.p = 40.
First consider a pilot study with n0.p=n1.p=20, then consider a pilot
study with n0.p=25 and n1.p=15. The function ss.noncomp.expilot()
computes the sample size in the control group using Equation (2) in the
supplementary material of Shardell and El-Kamary (2009). By default, the
sample size ratio between the two groups is presumed to equal that of
the pilot study.

### Scenario 1

    var.scenario.1 <- var.f(rho.a=0.25, rho.n=0.25, rho.cp=0.50, mu.c1=0.50, mu.c0=0, mu.a=0.5, mu.n=0, 
                      sigma.c0.sq=1.2, sigma.c1.sq=1.0, sigma.n.sq=1.2, sigma.a.sq=1.0)

    print(var.scenario.1)

    ## [1] 1.196875 1.096875

    #scenario 1, pilot n0.p = 20, pilot n1.p = 20
    ss.noncomp.expilot(delta=0.5, sigma.0p.sq=var.scenario.1[1], sigma.1p.sq=var.scenario.1[2], 
                         rho.cp=0.5, n0.p = 20, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using external pilot data 
    ## 
    ##              n0 = 305
    ##              n1 = 305
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.196875
    ##     sigma.1p.sq = 1.096875
    ##            n0.p = 20
    ##            n1.p = 20
    ##        ss.ratio = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 1, pilot n0.p = 25, pilot n1.p = 15
    ss.noncomp.expilot(delta=0.5, sigma.0p.sq=var.scenario.1[1], sigma.1p.sq=var.scenario.1[2], 
                         rho.cp=0.5, n0.p=25, n1.p=15, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using external pilot data 
    ## 
    ##              n0 = 407
    ##              n1 = 244
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.196875
    ##     sigma.1p.sq = 1.096875
    ##            n0.p = 25
    ##            n1.p = 15
    ##        ss.ratio = 0.6
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group
    ##  n1 is number in *treatment* group

### Scenario 2

    var.scenario.2 <- var.f(rho.a=0.25, rho.n=0.25, rho.cp=0.50, mu.c1=0.50, mu.c0=0, mu.a=1.0, mu.n=-0.5, 
                      sigma.c0.sq=1.2, sigma.c1.sq=1.0, sigma.n.sq=1.2, sigma.a.sq=1.0)

    print(var.scenario.2)

    ## [1] 1.446875 1.346875

    #scenario 2, pilot n0.p = 20, pilot n1.p = 20
    ss.noncomp.expilot(delta=0.5, sigma.0p.sq=var.scenario.2[1], sigma.1p.sq=var.scenario.2[2], 
                         rho.cp=0.5, n0.p=20, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using external pilot data 
    ## 
    ##              n0 = 371
    ##              n1 = 371
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.446875
    ##     sigma.1p.sq = 1.346875
    ##            n0.p = 20
    ##            n1.p = 20
    ##        ss.ratio = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 2, pilot n0.p = 25, pilot n1.p = 15
    ss.noncomp.expilot(delta=0.5, sigma.0p.sq=var.scenario.2[1], sigma.1p.sq=var.scenario.2[2], 
                         rho.cp=0.5, n0.p=25, n1.p=15, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using external pilot data 
    ## 
    ##              n0 = 496
    ##              n1 = 298
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.446875
    ##     sigma.1p.sq = 1.346875
    ##            n0.p = 25
    ##            n1.p = 15
    ##        ss.ratio = 0.6
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group
    ##  n1 is number in *treatment* group

### Scenario 3

    var.scenario.3 <- var.f(rho.a=0.25, rho.n=0.25, rho.cp=0.50, mu.c1=0.50, mu.c0=0, mu.a=1.0, mu.n=-0.5, 
                      sigma.c0.sq=1.2, sigma.c1.sq=1.0, sigma.n.sq=1.4, sigma.a.sq=1.2)

    print(var.scenario.3)

    ## [1] 1.546875 1.446875

    #scenario 3, pilot n0.p = 20, pilot n1.p = 20
    ss.noncomp.expilot(delta=0.5, sigma.0p.sq=var.scenario.3[1], sigma.1p.sq=var.scenario.3[2], 
                         rho.cp=0.5, n0.p=20, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using external pilot data 
    ## 
    ##              n0 = 398
    ##              n1 = 398
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.546875
    ##     sigma.1p.sq = 1.446875
    ##            n0.p = 20
    ##            n1.p = 20
    ##        ss.ratio = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 3, pilot n0.p = 25, pilot n1.p = 15
    ss.noncomp.expilot(delta=0.5, sigma.0p.sq=var.scenario.3[1], sigma.1p.sq=var.scenario.3[2], 
                         rho.cp=0.5, n0.p=25, n1.p=15, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using external pilot data 
    ## 
    ##              n0 = 532
    ##              n1 = 320
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.546875
    ##     sigma.1p.sq = 1.446875
    ##            n0.p = 25
    ##            n1.p = 15
    ##        ss.ratio = 0.6
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group
    ##  n1 is number in *treatment* group

### Scenario 4

    var.scenario.4 <- var.f(rho.a=0.25, rho.n=0.25, rho.cp=0.50, mu.c1=0.50, mu.c0=0, mu.a=0.3, mu.n=0.2, 
                      sigma.c0.sq=1.2, sigma.c1.sq=1.0, sigma.n.sq=1.2, sigma.a.sq=1.0)

    print(var.scenario.4)

    ## [1] 1.166875 1.066875

    #scenario 4, pilot n0.p = 20, pilot n1.p = 20
    ss.noncomp.expilot(delta=0.5, sigma.0p.sq=var.scenario.4[1], sigma.1p.sq=var.scenario.4[2], 
                         rho.cp=0.5, n0.p=20, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using external pilot data 
    ## 
    ##              n0 = 297
    ##              n1 = 297
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.166875
    ##     sigma.1p.sq = 1.066875
    ##            n0.p = 20
    ##            n1.p = 20
    ##        ss.ratio = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 4, pilot n0.p = 25, pilot n1.p = 15
    ss.noncomp.expilot(delta=0.5, sigma.0p.sq=var.scenario.4[1], sigma.1p.sq=var.scenario.4[2], 
                         rho.cp=0.5, n0.p=25, n1.p=15, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using external pilot data 
    ## 
    ##              n0 = 396
    ##              n1 = 238
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.166875
    ##     sigma.1p.sq = 1.066875
    ##            n0.p = 25
    ##            n1.p = 15
    ##        ss.ratio = 0.6
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group
    ##  n1 is number in *treatment* group

### Scenario 5

    var.scenario.5 <- var.f(rho.a=0.25, rho.n=0.25, rho.cp=0.50, mu.c1=0.50, mu.c0=0, mu.a=1.5, mu.n=-1.0, 
                      sigma.c0.sq=1.2, sigma.c1.sq=1.0, sigma.n.sq=2.0, sigma.a.sq=2.0)

    print(var.scenario.5)

    ## [1] 2.396875 2.296875

    #scenario 5, pilot n0.p = 20, pilot n1.p = 20
    ss.noncomp.expilot(delta=0.5, sigma.0p.sq=var.scenario.5[1], sigma.1p.sq=var.scenario.5[2], 
                         rho.cp=0.5, n0.p=20, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using external pilot data 
    ## 
    ##              n0 = 623
    ##              n1 = 623
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 2.396875
    ##     sigma.1p.sq = 2.296875
    ##            n0.p = 20
    ##            n1.p = 20
    ##        ss.ratio = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 5, pilot n0.p = 25, pilot n1.p = 15
    ss.noncomp.expilot(delta=0.5, sigma.0p.sq=var.scenario.5[1], sigma.1p.sq=var.scenario.5[2], 
                         rho.cp=0.5, n0.p=25, n1.p=15, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using external pilot data 
    ## 
    ##              n0 = 837
    ##              n1 = 502
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 2.396875
    ##     sigma.1p.sq = 2.296875
    ##            n0.p = 25
    ##            n1.p = 15
    ##        ss.ratio = 0.6
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group
    ##  n1 is number in *treatment* group

### Scenario 6

    var.scenario.6 <- var.f(rho.a=0.25, rho.n=0.25, rho.cp=0.50, mu.c1=0.50, mu.c0=0, mu.a=0.3, mu.n=0.2, 
                      sigma.c0.sq=1.2, sigma.c1.sq=1.0, sigma.n.sq=0.6, sigma.a.sq=0.5)

    print(var.scenario.6)

    ## [1] 0.891875 0.791875

    #scenario 6, pilot n0.p = 20, pilot n1.p = 20
    ss.noncomp.expilot(delta=0.5, sigma.0p.sq=var.scenario.6[1], sigma.1p.sq=var.scenario.6[2], 
                         rho.cp=0.5, n0.p=20, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using external pilot data 
    ## 
    ##              n0 = 224
    ##              n1 = 224
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 0.891875
    ##     sigma.1p.sq = 0.791875
    ##            n0.p = 20
    ##            n1.p = 20
    ##        ss.ratio = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group
    ##  n1 is number in *treatment* group

    #scenario 6, pilot n0.p = 25, pilot n1.p = 15
    ss.noncomp.expilot(delta=0.5, sigma.0p.sq=var.scenario.6[1], sigma.1p.sq=var.scenario.6[2], 
                         rho.cp=0.5, n0.p=25, n1.p=15, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using external pilot data 
    ## 
    ##              n0 = 298
    ##              n1 = 179
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 0.891875
    ##     sigma.1p.sq = 0.791875
    ##            n0.p = 25
    ##            n1.p = 15
    ##        ss.ratio = 0.6
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group
    ##  n1 is number in *treatment* group

Computing sample size with *internal* pilot data
------------------------------------------------

The function ss.noncomp.inpilot() takes the same arguments a the
function ss.noncomp.expilot() decribed above, but additionally a
user-specifief value for n0.s.min, the minimum control-group sample size
for the study’s second segment.

Once again, for each scenario, consider pilot studies of size n0.p +
n1.p = 40. First consider a pilot study with n0.p=n1.p=20, then consider
a pilot study with n0.p=25 and n1.p=15. The function
ss.noncomp.inpilot() computes the sample size in the control group using
Equation (3) in the supplementary material of Shardell and El-Kamary
(2009). In this function, the sample size ratio between the two groups
in the pilot study is preserved.

### Scenario 1

    var.scenario.1 <- var.f(rho.a=0.25, rho.n=0.25, rho.cp=0.50, mu.c1=0.50, mu.c0=0, mu.a=0.5, mu.n=0, 
                      sigma.c0.sq=1.2, sigma.c1.sq=1.0, sigma.n.sq=1.2, sigma.a.sq=1.0)

    print(var.scenario.1)

    ## [1] 1.196875 1.096875

    #scenario 1, pilot n0.p = 20, pilot n1.p = 20
    ss.noncomp.inpilot(delta=0.5, sigma.0p.sq=var.scenario.1[1], sigma.1p.sq=var.scenario.1[2], 
                         rho.cp=0.5, n0.p = 20, n0.s.min = 10, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using internal pilot data 
    ## 
    ##              n0 = 305
    ##              n1 = 305
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.196875
    ##     sigma.1p.sq = 1.096875
    ##            n0.p = 20
    ##            n1.p = 20
    ##        n0.s.min = 10
    ##        ss.ratio = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group (internal pilot plus second segment) 
    ##  n1 is number in *treatment* group (internal pilot plus second segment)

    #scenario 1, pilot n0.p = 25, pilot n1.p = 15
    ss.noncomp.inpilot(delta=0.5, sigma.0p.sq=var.scenario.1[1], sigma.1p.sq=var.scenario.1[2], 
                         rho.cp=0.5, n0.p=25, n1.p=15, n0.s.min = 10, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using internal pilot data 
    ## 
    ##              n0 = 407
    ##              n1 = 244
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.196875
    ##     sigma.1p.sq = 1.096875
    ##            n0.p = 25
    ##            n1.p = 15
    ##        n0.s.min = 10
    ##        ss.ratio = 0.6
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group (internal pilot plus second segment) 
    ##  n1 is number in *treatment* group (internal pilot plus second segment)

### Scenario 2

    var.scenario.2 <- var.f(rho.a=0.25, rho.n=0.25, rho.cp=0.50, mu.c1=0.50, mu.c0=0, mu.a=1.0, mu.n=-0.5, 
                      sigma.c0.sq=1.2, sigma.c1.sq=1.0, sigma.n.sq=1.2, sigma.a.sq=1.0)

    print(var.scenario.2)

    ## [1] 1.446875 1.346875

    #scenario 2, pilot n0.p = 20, pilot n1.p = 20
    ss.noncomp.inpilot(delta=0.5, sigma.0p.sq=var.scenario.2[1], sigma.1p.sq=var.scenario.2[2], 
                         rho.cp=0.5, n0.p=20, n0.s.min = 10, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using internal pilot data 
    ## 
    ##              n0 = 371
    ##              n1 = 371
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.446875
    ##     sigma.1p.sq = 1.346875
    ##            n0.p = 20
    ##            n1.p = 20
    ##        n0.s.min = 10
    ##        ss.ratio = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group (internal pilot plus second segment) 
    ##  n1 is number in *treatment* group (internal pilot plus second segment)

    #scenario 2, pilot n0.p = 25, pilot n1.p = 15
    ss.noncomp.inpilot(delta=0.5, sigma.0p.sq=var.scenario.2[1], sigma.1p.sq=var.scenario.2[2], 
                         rho.cp=0.5, n0.p=25, n1.p=15, n0.s.min = 10, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using internal pilot data 
    ## 
    ##              n0 = 496
    ##              n1 = 298
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.446875
    ##     sigma.1p.sq = 1.346875
    ##            n0.p = 25
    ##            n1.p = 15
    ##        n0.s.min = 10
    ##        ss.ratio = 0.6
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group (internal pilot plus second segment) 
    ##  n1 is number in *treatment* group (internal pilot plus second segment)

### Scenario 3

    var.scenario.3 <- var.f(rho.a=0.25, rho.n=0.25, rho.cp=0.50, mu.c1=0.50, mu.c0=0, mu.a=1.0, mu.n=-0.5, 
                      sigma.c0.sq=1.2, sigma.c1.sq=1.0, sigma.n.sq=1.4, sigma.a.sq=1.2)

    print(var.scenario.3)

    ## [1] 1.546875 1.446875

    #scenario 3, pilot n0.p = 20, pilot n1.p = 20
    ss.noncomp.inpilot(delta=0.5, sigma.0p.sq=var.scenario.3[1], sigma.1p.sq=var.scenario.3[2], 
                         rho.cp=0.5, n0.p=20, n0.s.min = 10, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using internal pilot data 
    ## 
    ##              n0 = 398
    ##              n1 = 398
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.546875
    ##     sigma.1p.sq = 1.446875
    ##            n0.p = 20
    ##            n1.p = 20
    ##        n0.s.min = 10
    ##        ss.ratio = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group (internal pilot plus second segment) 
    ##  n1 is number in *treatment* group (internal pilot plus second segment)

    #scenario 3, pilot n0.p = 25, pilot n1.p = 15
    ss.noncomp.inpilot(delta=0.5, sigma.0p.sq=var.scenario.3[1], sigma.1p.sq=var.scenario.3[2], 
                         rho.cp=0.5, n0.p=25, n1.p=15, n0.s.min = 10, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using internal pilot data 
    ## 
    ##              n0 = 532
    ##              n1 = 320
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.546875
    ##     sigma.1p.sq = 1.446875
    ##            n0.p = 25
    ##            n1.p = 15
    ##        n0.s.min = 10
    ##        ss.ratio = 0.6
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group (internal pilot plus second segment) 
    ##  n1 is number in *treatment* group (internal pilot plus second segment)

### Scenario 4

    var.scenario.4 <- var.f(rho.a=0.25, rho.n=0.25, rho.cp=0.50, mu.c1=0.50, mu.c0=0, mu.a=0.3, mu.n=0.2, 
                      sigma.c0.sq=1.2, sigma.c1.sq=1.0, sigma.n.sq=1.2, sigma.a.sq=1.0)

    print(var.scenario.4)

    ## [1] 1.166875 1.066875

    #scenario 4, pilot n0.p = 20, pilot n1.p = 20
    ss.noncomp.inpilot(delta=0.5, sigma.0p.sq=var.scenario.4[1], sigma.1p.sq=var.scenario.4[2], 
                         rho.cp=0.5, n0.p=20, n0.s.min = 10, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using internal pilot data 
    ## 
    ##              n0 = 297
    ##              n1 = 297
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.166875
    ##     sigma.1p.sq = 1.066875
    ##            n0.p = 20
    ##            n1.p = 20
    ##        n0.s.min = 10
    ##        ss.ratio = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group (internal pilot plus second segment) 
    ##  n1 is number in *treatment* group (internal pilot plus second segment)

    #scenario 4, pilot n0.p = 25, pilot n1.p = 15
    ss.noncomp.inpilot(delta=0.5, sigma.0p.sq=var.scenario.4[1], sigma.1p.sq=var.scenario.4[2], 
                         rho.cp=0.5, n0.p=25, n1.p=15, n0.s.min = 10, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using internal pilot data 
    ## 
    ##              n0 = 396
    ##              n1 = 238
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 1.166875
    ##     sigma.1p.sq = 1.066875
    ##            n0.p = 25
    ##            n1.p = 15
    ##        n0.s.min = 10
    ##        ss.ratio = 0.6
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group (internal pilot plus second segment) 
    ##  n1 is number in *treatment* group (internal pilot plus second segment)

### Scenario 5

    var.scenario.5 <- var.f(rho.a=0.25, rho.n=0.25, rho.cp=0.50, mu.c1=0.50, mu.c0=0, mu.a=1.5, mu.n=-1.0, 
                      sigma.c0.sq=1.2, sigma.c1.sq=1.0, sigma.n.sq=2.0, sigma.a.sq=2.0)

    print(var.scenario.5)

    ## [1] 2.396875 2.296875

    #scenario 5, pilot n0.p = 20, pilot n1.p = 20
    ss.noncomp.inpilot(delta=0.5, sigma.0p.sq=var.scenario.5[1], sigma.1p.sq=var.scenario.5[2], 
                         rho.cp=0.5, n0.p=20, n0.s.min = 10, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using internal pilot data 
    ## 
    ##              n0 = 623
    ##              n1 = 623
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 2.396875
    ##     sigma.1p.sq = 2.296875
    ##            n0.p = 20
    ##            n1.p = 20
    ##        n0.s.min = 10
    ##        ss.ratio = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group (internal pilot plus second segment) 
    ##  n1 is number in *treatment* group (internal pilot plus second segment)

    #scenario 5, pilot n0.p = 25, pilot n1.p = 15
    ss.noncomp.inpilot(delta=0.5, sigma.0p.sq=var.scenario.5[1], sigma.1p.sq=var.scenario.5[2], 
                         rho.cp=0.5, n0.p=25, n1.p=15, n0.s.min = 10, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using internal pilot data 
    ## 
    ##              n0 = 837
    ##              n1 = 502
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 2.396875
    ##     sigma.1p.sq = 2.296875
    ##            n0.p = 25
    ##            n1.p = 15
    ##        n0.s.min = 10
    ##        ss.ratio = 0.6
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group (internal pilot plus second segment) 
    ##  n1 is number in *treatment* group (internal pilot plus second segment)

### Scenario 6

    var.scenario.6 <- var.f(rho.a=0.25, rho.n=0.25, rho.cp=0.50, mu.c1=0.50, mu.c0=0, mu.a=0.3, mu.n=0.2, 
                      sigma.c0.sq=1.2, sigma.c1.sq=1.0, sigma.n.sq=0.6, sigma.a.sq=0.5)

    print(var.scenario.6)

    ## [1] 0.891875 0.791875

    #scenario 6, pilot n0.p = 20, pilot n1.p = 20
    ss.noncomp.inpilot(delta=0.5, sigma.0p.sq=var.scenario.6[1], sigma.1p.sq=var.scenario.6[2], 
                         rho.cp=0.5, n0.p=20, n0.s.min = 10, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using internal pilot data 
    ## 
    ##              n0 = 224
    ##              n1 = 224
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 0.891875
    ##     sigma.1p.sq = 0.791875
    ##            n0.p = 20
    ##            n1.p = 20
    ##        n0.s.min = 10
    ##        ss.ratio = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group (internal pilot plus second segment) 
    ##  n1 is number in *treatment* group (internal pilot plus second segment)

    #scenario 6, pilot n0.p = 25, pilot n1.p = 15
    ss.noncomp.inpilot(delta=0.5, sigma.0p.sq=var.scenario.6[1], sigma.1p.sq=var.scenario.6[2], 
                         rho.cp=0.5, n0.p=25, n1.p=15, n0.s.min = 10, alternative="two.sided")

    ## 
    ##      Two-sample difference in means sample size with all-or-none non-compliance using internal pilot data 
    ## 
    ##              n0 = 298
    ##              n1 = 179
    ##           delta = 0.5
    ##          rho.cp = 0.5
    ##      delta.star = 0.25
    ##     sigma.0p.sq = 0.891875
    ##     sigma.1p.sq = 0.791875
    ##            n0.p = 25
    ##            n1.p = 15
    ##        n0.s.min = 10
    ##        ss.ratio = 0.6
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE:  n0 is number in *control* group (internal pilot plus second segment) 
    ##  n1 is number in *treatment* group (internal pilot plus second segment)
