BEGIN   { printf "학번   이름    국어 영어 수학  총점  평균\n" }
        { count++;
	  sum = 0;
	  avg = 0;
          if (count > 1){
                for (i=3; i <= NF ; i++){
                        subject[i] += $i;	# 각 과목별  점수 총합
			sum += $i;		# 개인총점
	      	}
                avg = sum / (NF-2);		# 개인 평균
                printf "%d   %s   %d   %d   %d   %d   %.1f\n", $1, $2, $3, $4, $5, sum, avg;
          }
        }
END     { if(count > 0) {
                n = count-1;
		printf "                ";
                for (i=3; i<= NF;i++ ){
                        subject[i] /= n;	# 과목 평균
                	printf "%.1f ", subject[i];
		}
		printf "\n";
          }
	}
