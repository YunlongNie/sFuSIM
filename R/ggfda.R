fdagg = function(fdobj, ylab='Value', xlab="Time", addzero = FALSE)
{
range= fdobj$basis$rangeval

t = seq(range[1], range[2], len=1e3)

names_y = eval.fd(t, fdobj)%>%colnames

data=  data.frame(Time=t, eval.fd(t, fdobj))
names(data) = c('Time',names_y)

plotdata = reshape2::melt(data, id=1)

plot = ggplot2::ggplot(plotdata,aes(x=Time, y=value,group=factor(variable), color=factor(variable)))+geom_line()+theme_bw()+ylab(ylab)+xlab(xlab)
if (addzero) plot = plot+geom_hline(yintercept=0, linetype=2, col=2)
return(plot)
}