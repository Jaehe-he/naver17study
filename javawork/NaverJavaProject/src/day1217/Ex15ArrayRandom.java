package day1217;

public class Ex15ArrayRandom {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int []numbers = new int[20];
		boolean find;
		/*
		 * 배열에 1~50 사이의 난수 20개를 구하여 넣고
		 * 오름차순으로 정렬해서 출력을 하시오
		 */
		
//		//교수님 코드
//		//방법 1. 이전에 발생한 값이랑 같을 경우 다시 구하기 - 중복처리 로직추가
//		for(int i=0;i<numbers.length;i++) {
//			numbers[i]=(int)(Math.random()*50)+1;
//
//			//이전에 발생한 값이랑 같을 경우 다시 구하기 - 중복처리 로직추가
//			for(int j=0;j<i;j++) {
//				if(numbers[i] == numbers[j]) {
//					i--;
//					break;
//				}
//			}
//		}
		
		//방법 2.
		Loop:
			for(int i =0; i<numbers.length; i++) {
				numbers[i] = (int)(Math.random()*50) +1;
				for(int j=0; j<i;j++) {
					if(numbers[i]==numbers[j]) {
						i--;
						continue Loop; //i++로 직접 이동
					}
				}
			}

		//정렬
		for(int i=0; i<numbers.length-1;i++) {
			for(int j=0;j<i;j++) {
				if(numbers[i]<numbers[j]) {
					int temp=numbers[i];
					numbers[i]=numbers[j];
					numbers[j]=temp;
				}
			}
		}



		//출력 - 한줄에 5개씩만 출력
		for(int i=0;i<numbers.length;i++) {
			System.out.print(i+1+"번째 :"+numbers[i]+"\t");
			if((i+1)%5==0)
				System.out.println();
		}
	}
}



////========================================(아래 chatgpt로 돌린 코드)
//package day1217;
//
//public class Ex15ArrayRandom {
//
//    public static void main(String[] args) {
//        int[] numbers = new int[20];
//        boolean find;
//
//        /*
//         * 배열에 1~50 사이의 난수 20개를 구하여 넣고
//         * 오름차순으로 정렬해서 출력을 하시오
//         */
//
//        for (int i = 0; i < numbers.length; i++) {
//            do {
//                find = false;
//                numbers[i] = (int) (Math.random() * 50) + 1;
//
//                // 중복 확인
//                for (int j = 0; j < i; j++) {
//                    if (numbers[i] == numbers[j]) {
//                        find = true; // 중복이 발견되면 다시 난수 생성
//                        break;
//                    }
//                }
//            } while (find);
//        }
//
//        // 정렬 (오름차순)
//        for (int i = 0; i < numbers.length - 1; i++) {
//            for (int j = i + 1; j < numbers.length; j++) {
//                if (numbers[i] > numbers[j]) {
//                    int temp = numbers[i];
//                    numbers[i] = numbers[j];
//                    numbers[j] = temp;
//                }
//            }
//        }
//
//        // 출력 - 한 줄에 5개씩만 출력
//        for (int i = 0; i < numbers.length; i++) {
//            System.out.print((i + 1) + "번째: " + numbers[i] + "\t");
//            if ((i + 1) % 5 == 0) {
//                System.out.println();
//            }
//        }
//    }
//}
