package yw.dao.test;

import java.util.Scanner;
import dao.YWManyFieldDao;

public class TestInsertField {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        System.out.print("여러 열 IDX: ");
        int mfIdx = sc.nextInt();
        System.out.print("라이브러리 IDX: ");
        int slIdx = sc.nextInt();
        System.out.print("제목: ");
        String title = sc.next();
        System.out.print("제목 링크: ");
        String titleLink = sc.next();
        System.out.print("설명: ");
        String description = sc.next();
        System.out.print("버튼 제목: ");
        String buttonLabel = sc.next();
        System.out.print("버튼 링크: ");
        String buttonLink = sc.next();

        YWManyFieldDao dao = new YWManyFieldDao();
        dao.insertField(mfIdx, slIdx, title, titleLink, description, buttonLabel, buttonLink);

        System.out.println("필드가 성공적으로 추가되었습니다.");
        sc.close();
    }
}