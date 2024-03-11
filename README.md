# 김현석 두번째 팀 프로젝트 : 2MS

### [ Learning Management System (교육기관 학습 종합관리시스템) ]

![banner](https://github.com/doowon13/2ms/assets/83566946/c36841b6-da13-48bb-9b27-927bff51f4bf)




## 프로젝트 기능

### 📝 과정설계 기능
> * 기존의 LMS와의 가장 큰 차이점으로 <br>NCS (국가직무능력표준) 공공데이터 기반, 교육기관에서 자체적으로 NCS과목과 비 NCS과목을 유동적으로 조절하며 교육과정을 설계할 수 있습니다.
> * 설계된 과정은 지정된 교강사가 유동적으로 과목의 교육순서를 편성할 수 있습니다.
> * 과정의 개강날짜를 지정하면 편성된 과목의 시간을 계산하여 종강날짜가 자동 계산되어 표기됩니다.

<details>
<summary style="cursor: pointer">미리보기</summary>
<div markdown="1">
<strong>과정 설계</strong>

![image](https://github.com/doowon13/2ms/assets/83566946/d83ebdea-ead6-447e-acb6-7254bb6dce87)

<strong>개강날짜 지정</strong>
![image](https://github.com/doowon13/2ms/assets/83566946/ad241767-b68f-4660-8ab6-5f70c7c58cec)
<br>
</div>
</details>

### 📄 설문기능
> * 설문지에 대한 문항을 등록하여 훈련생들에게 배포할 수 있습니다.
> * 훈련생은 설문을 작성할 수 있습니다.
> * 각 설문은 '매우 그렇지 않다' ~ '매우 그렇다'의 데이터로 파이그래프로 시각화되어 보여집니다.

<details>
<summary style="cursor: pointer">미리보기</summary>
<div markdown="1">
<strong>설문등록</strong>

![image](https://github.com/doowon13/2ms/assets/83566946/f7c7acf3-08bb-4f9a-a5e1-b32f8a473037)

<strong>설문 진행</strong>
![image](https://github.com/doowon13/2ms/assets/83566946/3efbc325-6d31-4180-a75c-350d55186746)

<strong>설문결과 시각화</strong>
![image](https://github.com/doowon13/2ms/assets/83566946/41032d8c-d8af-4b1d-bbe5-f852cfeb0c9c)
<br>
</div>
</details>

### 📝 커뮤니티 (퀴즈출제, 채팅)
> * 교강사는 수업에 도움이 되는 간단한 문제를 출제할 수 있습니다.
> * 출제된 문제는 5분의 타이머가 존재하며 제한시간이 있습니다.
> * 훈련생은 교강사에게 교육에 관련된 궁금한 점을 채팅으로 질문할 수 있습니다.

<details>
<summary style="cursor: pointer">미리보기</summary>
<div markdown="1">
<strong>퀴즈 출제</strong>

![image](https://github.com/doowon13/2ms/assets/83566946/2c93167b-9b90-4d3b-b174-3b538ff27649)

<strong>채팅기능</strong>
![image](https://github.com/doowon13/2ms/assets/83566946/f1b7a242-2acd-41f7-98b9-fced45442243)


<br>
</div>
</details>

### 📋 출석부 기능
> * 12시를 기점으로 새로운 날짜의 출석이 DB에 입력되게 됩니다.
> * 교강사는 출석, 지각, 조퇴, 결석으로 각 학생의 출결상태를 기록할 수 있습니다.

<details>
<summary style="cursor: pointer">미리보기</summary>
<div markdown="1">
<strong>출결상태 기록</strong>

![image](https://github.com/doowon13/2ms/assets/83566946/d17b3cd2-ba68-4575-871a-8a75ab3cf07f)
<br>
</div>
</details>

### 📝 게시판 (공지사항, IT최신동향게시판, 서식게시판)
> * 교육기관에 등록된 모든 유저는 Python을 이용하여 Crawling된 정보를 게시판 형식으로 열람할 수 있습니다. 기사를 클릭하면 해당 웹페이지로 이동하게 됩니다.
> * 공지사항과 서식게시판은 별도로 첨부파일을 업로드할 수 있습니다.
> * 업로드된 파일은 클릭시 다운로드 할 수 있습니다.

<details>
<summary style="cursor: pointer">미리보기</summary>
<div markdown="1">
<strong>IT최신동향 게시판</strong>

![image](https://github.com/doowon13/2ms/assets/83566946/1bb02129-1b36-45a1-98e3-7d20aa503525)

<strong>게시판 파일 업, 다운로드</strong>
![image](https://github.com/doowon13/2ms/assets/83566946/f6ca3365-9c34-4814-a8d7-e376e510c0bc)

<br>
</div>
</details>

### ✏️ 평가 및 과제
> * 교강사는 자신의 반 전체에 과제를 출제할 수 있습니다.
> * 훈련생은 교강사가 출제한 과제에 응시할 수 있습니다.

<details>
<summary style="cursor: pointer">미리보기</summary>
<br>
<div markdown="1">
<strong>과제 출제</strong>

![image](https://github.com/doowon13/2ms/assets/83566946/434d6c48-d040-466e-a785-9f6b6afa4d3d)

<strong>과제 작성</strong>
![image](https://github.com/doowon13/2ms/assets/83566946/5549d864-c276-4cfd-8bb7-062b641a8dc0)

<br>
</div>
</details>

<br>
<hr style="text-align:center; width:45%;">
<br>

## Back-End 사용기술
`Spring Legacy (MVC model 2)` `Java` `MyBatis` `Oracle DB` `Python` `Apache Tomcat`

## Front-End 사용기술
`JavaScript` `jQuery` `EL` `JSTL` `HTML5` `CSS3`

## DB ERD Diagram
![image](https://github.com/doowon13/2ms/assets/83566946/2de18a2f-a973-4720-8ba8-8d453255ab69)
