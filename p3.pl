#!/usr/bin/perl

# 파일로부터 성적 데이터 읽어오기
open(FILE, "score_data");
@lines = <FILE>;
close(FILE);

@p = split(/ /, @lines[0]); # 데이터 파일의 첫째줄 저장
chomp(@p);
@p[5]="총점"; @p[6]="평균";
printf "@p[0]  @p[1]    @p[2] @p[3] @p[4]  @p[5] @p[6]\n";

foreach $n (@lines){
	$sum=0;
	if($n != @lines[0]){
		@l = split(/ /, $n);
		chomp(@l);
   		$c = scalar(@l);

		printf "@l[0]  @l[1]   ";
		for($i=2 ; $i <= $c-1 ;$i++){
			@subject[$i] += @l[$i];		# 과목별 총합
			$sum += @l[$i];			# 개인 총점
			printf"@l[$i]   ";
		}
		
		$avg_per = $sum / ($c-2);		# 개인 평균

		printf "%d  %.1f\n", $sum, $avg_per;
	}
	$count++;
}

printf "              ", ;
for ($i=2 ; $i<=$c-1 ; $i++){
	@subject[$i] /= $count-1;
	printf "%.1f ", @subject[$i];	# 과목별 평균
}
printf "\n";

