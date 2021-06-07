BEGIN 	{ printf "학번   이름    국어 영어 수학  총점  평균\n" }
	{ count++;
	
  	  if (count > 1){
	     	KOR += $3; ENG += $4; MATH += $5;	# 각 과목별  점수 총합
	  	sum = $3 + $4 +$5; 			# 개인 총점
	  	avg_per = sum / 3; 			# 개인 평균
	  	printf "%d   %s   %d   %d   %d   %d   %.1f\n", $1, $2, $3, $4, $5, sum, avg_per;
	  }
	}
END	{ if(count > 0)	{
		n = count-1;
		KOR /= n; ENG /= n; MATH /= n;  # 과목 평균
		printf "               %.1f %.1f %.1f\n", KOR, ENG, MATH;
		
	  }
	}
