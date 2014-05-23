my(%answerhash,$subject,$info,$pattern);
dbmopen(%answerhash,"answer",0655) or die "Can't open the file $!";
while(1)
{
print "Your question: ";
chomp($_=lc<STDIN>);
last if($_=~/^quit$/);
if($_=~/^like\s+(.*)\?$/)
     {
      $pattern=$1;
      while(($subject,$info)=each %answerhash)
            {
             if($subject=~/$pattern/){
                 print "$subject is like $pattern\n";
               }
            }

     }elsif($_=~/(.*)\sis\s(.*)/){
            $subject=$1;
            $info=$2;
            $answerhash{$subject}=$info;
            print "OK,I'll remember $subject as $info\n";

           }elsif($_=~/(.*)\?$/){
             $subject=$1;
             if($answerhash{$subject})
               {
               print "$subject is $answerhash{$subject}\n";
               }
               else{
                print "I don't now the $subject\n";
                   }
           }else{
           print "I don't understand the $_;\n";
            }
   



}

dbmclose(%anserhash); 
