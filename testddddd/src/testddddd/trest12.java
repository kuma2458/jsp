package testddddd;

import java.util.Random;

public class trest12 {
	Random random=new Random();
	int[][] lotto=new int[6][6];
	
	for(int i=0; i<ea; i++){
		for(int j=0; j<6; j++){
			int k = random.nextInt(45)+1;	
			lotto[i][j]=k;
			for(int z=0; z<j; z++){
			if(lotto[i][z]==lotto[i][j]){
				j--;
				break;
			}
			}
		}

	}
}
