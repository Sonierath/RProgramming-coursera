Download <code>.csv</code> files --- <a href="https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip">specdata</a>
<br>
<br>
<b>Technologies:</b> <br>
R, RStudio <br>
<br>
<b>Part 1: pollutantmean</b><br>
<code>source("pollutantmean.R")</code><br>
<code>pollutantmean("specdata", "sulfate", 1:10)</code><br>
<code>pollutantmean("specdata", "nitrate", 70:72)</code><br>
<code>pollutantmean("specdata", "nitrate", 23)</code><br>

<b>Part 2: complete</b><br>
<code>source("complete.R")</code><br>
<code>complete("specdata", 1)</code><br>
<code>complete("specdata", c(2, 4, 8, 10, 12))</code><br>
<code>complete("specdata", 30:25)</code><br>
<code>complete("specdata", 3)</code><br>

<b>Part 3: corr</b><br>
<code>source("corr.R")</code><br>
<code>source("complete.R")</code><br>
<code>cr <- corr("specdata", 150)</code><br>
<code>head(cr)</code><br>
<code>summary(cr)</code><br>
<code>cr <- corr("specdata", 400)</code><br>
<code>head(cr)</code><br>
<code>summary(cr)</code><br>
<code>cr <- corr("specdata", 5000)</code><br>
<code>summary(cr)</code><br>
<code>length(cr)</code><br>
<code>cr <- corr("specdata")</code><br>
<code>summary(cr)</code><br>
<code>length(cr)</code><br>
<br>
<b>Submission:</b><br>
<code>source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")</code><br>
<code>submit()</code><br>
<br>
Score: 20/20
