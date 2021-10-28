#######################################################################################
# Date: 05/12/2010
# Author: Michelle Shardell, PhD
# This program is the base function for sample size calculation methods described in 
#
#  Shardell MD, El-Kamary SS. Calculating sample size for studies with expected 
#     all-or-none nonadherence and selection bias. Biometrics. 2009 Jun;65(2):635-9. 
######################################################################################

#test if ssanv installed
if("ssanv" %in% rownames(installed.packages()) == FALSE) {install.packages("ssanv")}

library(ssanv)


##############################################################################
# ss.noncomp - function to compute sample size for difference in means or 
#              proportions of 2 groups with all-or-none noncompliance and
#              selection bias.
##############################################################################

ss.noncomp <- function (mu.c0 = NULL, mu.c1 = NULL, mu.n=mu.c0, mu.a=mu.c1, 
                        sigma.c0.sq = 1, sigma.c1.sq=1, sigma.n.sq=sigma.c0.sq, sigma.a.sq=sigma.c1.sq, 
                        rho.a = 0, rho.n = 0, ss.ratio = 1,  
                        sig.level = 0.05, power = 0.8, alternative = c("two.sided", 
                                                                       "one.sided"), refinement = NULL) 
{
  alternative <- match.arg(alternative)
  tside <- switch(alternative, one.sided = 1, two.sided = 2)
  if (!is.null(refinement)) {
    rchoices <- c("Normal", "Bernoulli")
    if (refinement == "normal") 
      refinement <- "Normal"
    else if (refinement == "bernoulli") 
      refinement <- "Bernoulli"
    refinement <- char.expand(refinement, rchoices, stop("Refinement choices are:\n NULL, 'Normal' or 'Bernoulli'\n(upper case first letter is OK)"))
  }
  NOTE <- "n0 is number in *control* group\n\tn1 is number in *treatment* group"
  METHOD <- "Two-sample difference in means sample size with all-or-none non-compliance"
  if (is.null(mu.c0) && is.null(mu.c1)) {
    stop("give values for 'mu.c0' and 'mu.c1'")
  }
  delta <- mu.c1 - mu.c0
  delta.star <- (1 - rho.a - rho.n) * delta
  rho.c <- 1 - rho.a - rho.n
  if (delta.star > 0) {
    if (tside == 1) 
      alternative <- paste(alternative, ", delta > ", 
                           "0", sep = "")
  }
  else if (delta.star < 0) {
    delta.sta <- abs(delta.star)
    if (tside == 1) 
      alternative <- paste(alternative, ", delta < ", 
                           "0", sep = "")
  }
  else {
    stop("delta.star cannot equal 0")
  }
  
  #means and variances under alternative - use for no refinement or normal refinement
  mu.1 <- rho.a*mu.a + rho.n*mu.n + rho.c*mu.c1
  mu.0 <- rho.a*mu.a + rho.n*mu.n + rho.c*mu.c0
  V01 <- rho.c*sigma.c0.sq + rho.a*sigma.a.sq + rho.n*sigma.n.sq +
    rho.c*(mu.c0 - mu.0)^2 + rho.a*(mu.a - mu.0)^2 + rho.n*(mu.n - mu.0)^2 
  V11 <- rho.c*sigma.c1.sq + rho.a*sigma.a.sq + rho.n*sigma.n.sq +
    rho.c*(mu.c1 - mu.1)^2 + rho.a*(mu.a - mu.1)^2 + rho.n*(mu.n - mu.1)^2    
  
  Za <- qnorm(1 - sig.level/tside)
  Zb <- qnorm(power)
  if (is.null(refinement)) {
    N0 <- (Za*sqrt(V01 + V11/ss.ratio) + Zb*sqrt(V01 + V11/ss.ratio))^2 / delta.star^2
  }
  else if (refinement == "Normal") {
    N0.start <- floor(((V0 + V1/ss.ratio) * (Za + Zb)^2)/((1 - 
                                                             rho.a - rho.n) * delta - deltaB)^2)
    rootfunc1 <- function(n0, alpha = sig.level/tside, v0 = V00, 
                          v1 = V11, r = ss.ratio, nominal.power = power, Delta.star.minus.deltaB = delta.star) {
      n0 <- ceiling(n0)
      n1 <- ceiling(n0 * r)
      tau.sq <- (v0/n0 + v1/n1)
      nu <- ((tau.sq)^2)/(v0^2/((n0 - 1) * n0^2) + v1^2/((n1 - 
                                                            1) * n1^2))
      nu[nu < 1] <- 1
      ncp <- Delta.star.minus.deltaB/sqrt(tau.sq)
      POWER <- 1 - pt(qt(1 - alpha, nu), nu, ncp)
      nominal.power - POWER
    }
    if (rootfunc1(N0.start) < 0) 
      N0.start <- 1
    N0 <- uniroot.integer(rootfunc1, lower = N0.start, upper = Inf, 
                          step.power = 1)$root
  }
  else if (refinement == "Bernoulli" ) {
    if (!is.null(sigma.c0.sq)) {
      if (sigma.c0.sq != 1 | sigma.c1.sq != 1) 
        warning("sigma.c0.sq and sigma.c1.sq input values not used\n because refinement='Bernoulli' ")
      sigma.c0.sq <- NULL
    }
    
    #means and variances under null
    mu.c <- (mu.c0 + ss.ratio*mu.c1)/(1 + ss.ratio) #mu under the null
    mu.null <- rho.a*mu.a + rho.n*mu.n + rho.c*mu.c    
    V00 <- rho.c*sigma.c0.sq + rho.a*sigma.a.sq + rho.n*sigma.n.sq +
      rho.c*(mu.c - mu.null)^2 + rho.a*(mu.a - mu.null)^2 + rho.n*(mu.n - mu.null)^2 
    V10 <- rho.c*sigma.c1.sq + rho.a*sigma.a.sq + rho.n*sigma.n.sq +
      rho.c*(mu.c - mu.null)^2 + rho.a*(mu.a - mu.null)^2 + rho.n*(mu.n - mu.null)^2
    
    mu <- (mu.0 + ss.ratio*mu.1)/(1 + ss.ratio) 
    V00 <- mu.null*(1 - mu.null)
    V10 <- V00
    V11 <- mu.1*(1-mu.1)
    V01 <- mu.0*(1-mu.0)
    #N0 <- ((V0 + V1/ss.ratio) * (Za + Zb)^2)/delta.star.minus.deltaB^2
    N0 <- (Za*sqrt(V00 + V10/ss.ratio) + Zb*sqrt(V01 + V11/ss.ratio))^2 / delta.star^2  
    
  }
  else {
    stop("refinement should equal either NULL, 'normal' or 'Bernoulli'")
  }
  output <- list(n0 = ceiling(N0), n1 = ceiling(ss.ratio * 
                                                  N0), mu.c0 = mu.c0, mu.c1 = mu.c1, delta = delta, rho.a=rho.a, rho.n=rho.n, 
                 delta.star = delta.star,
                 sigma.c0.sq = sigma.c0.sq, sigma.c1.sq = sigma.c1.sq, 
                 sigma.a.sq = sigma.a.sq, sigma.n.sq = sigma.n.sq,
                 sig.level = sig.level, 
                 power = power, alternative = alternative, note = NOTE, 
                 method = METHOD, refinement = refinement)
  structure(output, class = "power.htest")
}
