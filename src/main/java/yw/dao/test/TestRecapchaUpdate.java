package yw.dao.test;

import java.util.Scanner;

import dao.YWRecapchaDao;

public class TestRecapchaUpdate {
	public static void main(String[] args) throws Exception{
		Scanner sc = new Scanner(System.in);
		System.out.print("캡챠설정버튼 (0또는1) : ");
		int recaptcha = sc.nextInt();
		System.out.print("현재스토어IDX : ");
		int storeIdx = sc.nextInt();
		YWRecapchaDao dao = new YWRecapchaDao();
		dao.recaptchaUpdate(recaptcha, storeIdx);
		System.out.println("업데이트완료");
		sc.close();
	}
}